import 'dart:async';

import 'package:flutter_test/flutter_test.dart';

import 'package:bantucart/features/core_api/domain/models/domain_models.dart';
import 'package:bantucart/features/core_api/domain/repositories/repositories.dart';
import 'package:bantucart/features/notifications/application/notification_bridges.dart';
import 'package:bantucart/features/notifications/application/notification_lifecycle_service.dart';
import 'package:bantucart/features/notifications/application/notification_token_store.dart';

void main() {
  late FakeNotificationRepository repository;
  late InMemoryNotificationTokenStore tokenStore;
  late FakeMessagingBridge messagingBridge;
  late FakeLocalNotificationBridge localNotificationBridge;
  late NotificationLifecycleService service;

  setUp(() {
    repository = FakeNotificationRepository();
    tokenStore = InMemoryNotificationTokenStore();
    messagingBridge = FakeMessagingBridge(initialToken: 'token-1');
    localNotificationBridge = FakeLocalNotificationBridge();
    service = NotificationLifecycleService(
      notificationRepository: repository,
      tokenStore: tokenStore,
      messagingBridge: messagingBridge,
      localNotificationBridge: localNotificationBridge,
    );
  });

  tearDown(() async {
    await service.dispose();
    await messagingBridge.dispose();
  });

  test('registers token on initialize when authenticated', () async {
    final routes = <String>[];

    await service.initialize(
      isAuthenticated: true,
      onRouteResolved: routes.add,
    );

    expect(routes, isEmpty);
    expect(await tokenStore.getDeviceToken(), 'token-1');
    expect(await tokenStore.getRegisteredDeviceToken(), 'token-1');
    expect(repository.registeredBodies, hasLength(1));
    expect(repository.registeredBodies.first['token'], 'token-1');
  });

  test('skips duplicate token re-register on refresh when unchanged', () async {
    await service.initialize(
      isAuthenticated: true,
      onRouteResolved: (_) {},
    );
    expect(repository.registeredBodies, hasLength(1));

    messagingBridge.emitTokenRefresh('token-1');
    await pumpEventQueue();

    expect(repository.registeredBodies, hasLength(1));
  });

  test('unregisters token and clears local store on logout', () async {
    await service.initialize(
      isAuthenticated: true,
      onRouteResolved: (_) {},
    );

    await service.unregisterOnLogout();

    expect(repository.unregisteredTokens, ['token-1']);
    expect(await tokenStore.getDeviceToken(), isNull);
    expect(await tokenStore.getRegisteredDeviceToken(), isNull);
  });

  test('routes opened notifications to expected destination', () async {
    String? route;
    await service.initialize(
      isAuthenticated: false,
      onRouteResolved: (value) => route = value,
    );

    messagingBridge.emitOpenedAppMessage(
      const NotificationEnvelope(
        data: <String, dynamic>{
          'type': 'ORDER_UPDATE',
          'title': 'Order changed',
          'message': 'Now shipped',
          'order_id': 'o-1',
        },
      ),
    );
    await pumpEventQueue();

    expect(route, '/orders/o-1');
  });

  test('shows local notification for foreground payload', () async {
    await service.initialize(
      isAuthenticated: false,
      onRouteResolved: (_) {},
    );

    messagingBridge.emitForegroundMessage(
      const NotificationEnvelope(
        data: <String, dynamic>{
          'type': 'GENERAL',
          'title': 'Heads up',
          'message': 'Something happened',
        },
      ),
    );
    await pumpEventQueue();

    expect(localNotificationBridge.shownNotifications, hasLength(1));
    expect(localNotificationBridge.shownNotifications.first.title, 'Heads up');
  });
}

class InMemoryNotificationTokenStore implements NotificationTokenStore {
  String? _token;
  String? _registeredToken;

  @override
  Future<void> clear() async {
    _token = null;
    _registeredToken = null;
  }

  @override
  Future<String?> getDeviceToken() async => _token;

  @override
  Future<String?> getRegisteredDeviceToken() async => _registeredToken;

  @override
  Future<void> saveDeviceToken(String token) async {
    _token = token;
  }

  @override
  Future<void> saveRegisteredDeviceToken(String token) async {
    _registeredToken = token;
  }
}

class FakeNotificationRepository implements NotificationRepository {
  final List<Map<String, dynamic>> registeredBodies = <Map<String, dynamic>>[];
  final List<String> unregisteredTokens = <String>[];

  @override
  Future<dynamic> registerDeviceToken(Map<String, dynamic> body) async {
    registeredBodies.add(body);
    return null;
  }

  @override
  Future<dynamic> unregisterDeviceToken(String token) async {
    unregisteredTokens.add(token);
    return null;
  }

  @override
  Future<dynamic> getNotificationPreferences() async => null;

  @override
  Future<dynamic> updateNotificationPreferences(
          Map<String, dynamic> body) async =>
      null;
}

class FakeMessagingBridge implements NotificationMessagingBridge {
  FakeMessagingBridge({this.initialToken});

  final String? initialToken;
  final StreamController<String> _tokenRefreshController =
      StreamController<String>.broadcast();
  final StreamController<NotificationEnvelope> _foregroundController =
      StreamController<NotificationEnvelope>.broadcast();
  final StreamController<NotificationEnvelope> _openedAppController =
      StreamController<NotificationEnvelope>.broadcast();

  @override
  Future<String?> getToken() async => initialToken;

  @override
  Future<NotificationEnvelope?> getInitialMessage() async => null;

  @override
  Stream<NotificationEnvelope> get onForegroundMessage =>
      _foregroundController.stream;

  @override
  Stream<NotificationEnvelope> get onMessageOpenedApp =>
      _openedAppController.stream;

  @override
  Stream<String> get onTokenRefresh => _tokenRefreshController.stream;

  @override
  Future<void> requestPermission() async {}

  @override
  Future<void> setForegroundPresentation() async {}

  void emitTokenRefresh(String token) {
    _tokenRefreshController.add(token);
  }

  void emitForegroundMessage(NotificationEnvelope envelope) {
    _foregroundController.add(envelope);
  }

  void emitOpenedAppMessage(NotificationEnvelope envelope) {
    _openedAppController.add(envelope);
  }

  Future<void> dispose() async {
    await _tokenRefreshController.close();
    await _foregroundController.close();
    await _openedAppController.close();
  }
}

class FakeLocalNotificationBridge implements LocalNotificationBridge {
  final List<NotificationData> shownNotifications = <NotificationData>[];
  void Function(Map<String, dynamic> data)? _tapCallback;

  @override
  Future<void> initialize({
    required void Function(Map<String, dynamic> data) onNotificationTap,
  }) async {
    _tapCallback = onNotificationTap;
  }

  @override
  Future<void> show(NotificationData notification) async {
    shownNotifications.add(notification);
  }

  void tap(Map<String, dynamic> payload) {
    _tapCallback?.call(payload);
  }
}
