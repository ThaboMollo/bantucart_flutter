import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';

import '../../core_api/domain/models/domain_models.dart';
import '../../core_api/domain/repositories/repositories.dart';
import '../../routing/notification_route_resolver.dart';
import 'notification_bridges.dart';
import 'notification_payload_parser.dart';
import 'notification_token_store.dart';

class NotificationLifecycleService {
  NotificationLifecycleService({
    required NotificationRepository notificationRepository,
    required NotificationTokenStore tokenStore,
    required NotificationMessagingBridge messagingBridge,
    required LocalNotificationBridge localNotificationBridge,
  })  : _notificationRepository = notificationRepository,
        _tokenStore = tokenStore,
        _messagingBridge = messagingBridge,
        _localNotificationBridge = localNotificationBridge;

  final NotificationRepository _notificationRepository;
  final NotificationTokenStore _tokenStore;
  final NotificationMessagingBridge _messagingBridge;
  final LocalNotificationBridge _localNotificationBridge;

  StreamSubscription<String>? _tokenRefreshSubscription;
  StreamSubscription<NotificationEnvelope>? _foregroundSubscription;
  StreamSubscription<NotificationEnvelope>? _openedAppSubscription;
  bool _initialized = false;
  bool _isAuthenticated = false;
  void Function(String route)? _onRouteResolved;

  Future<void> initialize({
    required bool isAuthenticated,
    required void Function(String route) onRouteResolved,
  }) async {
    _onRouteResolved = onRouteResolved;
    _isAuthenticated = isAuthenticated;
    if (_initialized) {
      if (_isAuthenticated) {
        await _registerSavedTokenIfNeeded();
      }
      return;
    }

    _initialized = true;
    await _messagingBridge.requestPermission();
    await _messagingBridge.setForegroundPresentation();
    await _localNotificationBridge.initialize(
      onNotificationTap: (payload) {
        final notification = NotificationPayloadParser.parse(data: payload);
        _routeFromNotification(notification);
      },
    );

    _tokenRefreshSubscription =
        _messagingBridge.onTokenRefresh.listen((token) async {
      await _tokenStore.saveDeviceToken(token);
      if (_isAuthenticated) {
        await _registerTokenIfNeeded(token: token, force: false);
      }
    });

    _foregroundSubscription =
        _messagingBridge.onForegroundMessage.listen((envelope) async {
      final notification = NotificationPayloadParser.parse(
        data: envelope.data,
        title: envelope.title,
        body: envelope.body,
      );
      await _localNotificationBridge.show(notification);
    });

    _openedAppSubscription =
        _messagingBridge.onMessageOpenedApp.listen((envelope) {
      final notification = NotificationPayloadParser.parse(
        data: envelope.data,
        title: envelope.title,
        body: envelope.body,
      );
      _routeFromNotification(notification);
    });

    final initialMessage = await _messagingBridge.getInitialMessage();
    if (initialMessage != null) {
      final notification = NotificationPayloadParser.parse(
        data: initialMessage.data,
        title: initialMessage.title,
        body: initialMessage.body,
      );
      _routeFromNotification(notification);
    }

    final token = await _messagingBridge.getToken();
    if (token != null && token.isNotEmpty) {
      await _tokenStore.saveDeviceToken(token);
      if (_isAuthenticated) {
        await _registerTokenIfNeeded(token: token, force: false);
      }
    }
  }

  Future<void> syncAuthentication(bool isAuthenticated) async {
    _isAuthenticated = isAuthenticated;
    if (_isAuthenticated) {
      await _registerSavedTokenIfNeeded();
    }
  }

  Future<void> unregisterOnLogout() async {
    final registeredToken = await _tokenStore.getRegisteredDeviceToken();
    final token = registeredToken ?? await _tokenStore.getDeviceToken();
    if (token != null && token.isNotEmpty) {
      try {
        await _notificationRepository.unregisterDeviceToken(token);
      } catch (_) {
        // Logout should continue even if endpoint call fails.
      }
    }
    await _tokenStore.clear();
  }

  Future<void> dispose() async {
    await _tokenRefreshSubscription?.cancel();
    await _foregroundSubscription?.cancel();
    await _openedAppSubscription?.cancel();
  }

  Future<void> _registerSavedTokenIfNeeded() async {
    final token = await _tokenStore.getDeviceToken();
    if (token == null || token.isEmpty) {
      return;
    }
    await _registerTokenIfNeeded(token: token, force: false);
  }

  Future<void> _registerTokenIfNeeded({
    required String token,
    required bool force,
  }) async {
    final registeredToken = await _tokenStore.getRegisteredDeviceToken();
    if (!force && registeredToken == token) {
      return;
    }

    await _notificationRepository.registerDeviceToken(<String, dynamic>{
      'token': token,
      'platform': _platform,
    });
    await _tokenStore.saveRegisteredDeviceToken(token);
  }

  void _routeFromNotification(NotificationData notification) {
    final route = NotificationRouteResolver.resolve(notification);
    _onRouteResolved?.call(route);
  }

  String get _platform {
    if (kIsWeb) {
      return 'web';
    }
    if (Platform.isAndroid) {
      return 'android';
    }
    if (Platform.isIOS) {
      return 'ios';
    }
    return 'unknown';
  }
}
