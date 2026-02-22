import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core_api/domain/repositories/repository_providers.dart';
import 'notification_bridges.dart';
import 'notification_lifecycle_service.dart';
import 'notification_token_store.dart';

final notificationTokenStoreProvider = Provider<NotificationTokenStore>((ref) {
  return NotificationTokenStore(ref.watch(secureStorageProvider));
});

final notificationMessagingBridgeProvider =
    Provider<NotificationMessagingBridge>((ref) {
  return FirebaseMessagingBridge();
});

final localNotificationBridgeProvider =
    Provider<LocalNotificationBridge>((ref) {
  return FlutterLocalNotificationBridge();
});

final notificationRouteProvider = StateProvider<String?>((ref) => null);

final notificationLifecycleServiceProvider =
    Provider<NotificationLifecycleService>((ref) {
  final service = NotificationLifecycleService(
    notificationRepository: ref.watch(notificationRepositoryProvider),
    tokenStore: ref.watch(notificationTokenStoreProvider),
    messagingBridge: ref.watch(notificationMessagingBridgeProvider),
    localNotificationBridge: ref.watch(localNotificationBridgeProvider),
  );
  ref.onDispose(service.dispose);
  return service;
});
