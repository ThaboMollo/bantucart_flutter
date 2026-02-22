import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../core_api/domain/models/domain_models.dart';

class NotificationEnvelope {
  const NotificationEnvelope({
    required this.data,
    this.title,
    this.body,
  });

  final Map<String, dynamic> data;
  final String? title;
  final String? body;
}

abstract class NotificationMessagingBridge {
  Future<void> requestPermission();
  Future<void> setForegroundPresentation();
  Future<String?> getToken();
  Stream<String> get onTokenRefresh;
  Stream<NotificationEnvelope> get onForegroundMessage;
  Stream<NotificationEnvelope> get onMessageOpenedApp;
  Future<NotificationEnvelope?> getInitialMessage();
}

class FirebaseMessagingBridge implements NotificationMessagingBridge {
  FirebaseMessagingBridge([FirebaseMessaging? firebaseMessaging])
      : _messaging = firebaseMessaging ?? FirebaseMessaging.instance;

  final FirebaseMessaging _messaging;

  @override
  Future<void> requestPermission() async {
    await _messaging.requestPermission(alert: true, badge: true, sound: true);
  }

  @override
  Future<void> setForegroundPresentation() {
    return _messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  @override
  Future<String?> getToken() => _messaging.getToken();

  @override
  Stream<String> get onTokenRefresh => _messaging.onTokenRefresh;

  @override
  Stream<NotificationEnvelope> get onForegroundMessage =>
      FirebaseMessaging.onMessage.map(_toEnvelope);

  @override
  Stream<NotificationEnvelope> get onMessageOpenedApp =>
      FirebaseMessaging.onMessageOpenedApp.map(_toEnvelope);

  @override
  Future<NotificationEnvelope?> getInitialMessage() async {
    final initial = await _messaging.getInitialMessage();
    if (initial == null) {
      return null;
    }
    return _toEnvelope(initial);
  }

  NotificationEnvelope _toEnvelope(RemoteMessage message) {
    return NotificationEnvelope(
      data: message.data,
      title: message.notification?.title,
      body: message.notification?.body,
    );
  }
}

abstract class LocalNotificationBridge {
  Future<void> initialize({
    required void Function(Map<String, dynamic> data) onNotificationTap,
  });
  Future<void> show(NotificationData notification);
}

class FlutterLocalNotificationBridge implements LocalNotificationBridge {
  FlutterLocalNotificationBridge([FlutterLocalNotificationsPlugin? plugin])
      : _plugin = plugin ?? FlutterLocalNotificationsPlugin();

  static const _channelId = 'bantucart_alerts';
  static const _channelName = 'Bantucart Alerts';
  static const _channelDescription =
      'Order, delivery, payment, and account updates.';

  final FlutterLocalNotificationsPlugin _plugin;

  @override
  Future<void> initialize({
    required void Function(Map<String, dynamic> data) onNotificationTap,
  }) async {
    const androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings(
      notificationCategories: <DarwinNotificationCategory>[
        DarwinNotificationCategory('order_updates'),
        DarwinNotificationCategory('delivery_updates'),
        DarwinNotificationCategory('general_updates'),
      ],
    );

    const settings =
        InitializationSettings(android: androidSettings, iOS: iosSettings);
    await _plugin.initialize(
      settings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        final payload = response.payload;
        if (payload == null || payload.isEmpty) {
          return;
        }
        final decoded = jsonDecode(payload);
        if (decoded is Map<String, dynamic>) {
          onNotificationTap(decoded);
        }
      },
    );

    const channel = AndroidNotificationChannel(
      _channelId,
      _channelName,
      description: _channelDescription,
      importance: Importance.high,
    );
    await _plugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  @override
  Future<void> show(NotificationData notification) {
    final details = NotificationDetails(
      android: const AndroidNotificationDetails(
        _channelId,
        _channelName,
        channelDescription: _channelDescription,
        importance: Importance.high,
        priority: Priority.high,
      ),
      iOS: DarwinNotificationDetails(
          categoryIdentifier: _categoryForType(notification.type)),
    );
    return _plugin.show(
      notification.hashCode,
      notification.title,
      notification.message,
      details,
      payload: jsonEncode(notification.toJson()),
    );
  }

  String _categoryForType(String type) {
    if (type.contains('ORDER') || type.contains('PAYMENT')) {
      return 'order_updates';
    }
    if (type.contains('DELIVERY') || type.contains('COURIER')) {
      return 'delivery_updates';
    }
    return 'general_updates';
  }
}
