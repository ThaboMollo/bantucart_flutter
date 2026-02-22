import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class NotificationTokenStore {
  NotificationTokenStore(this._storage);

  static const _tokenKey = 'notification_device_token';
  static const _registeredTokenKey = 'notification_registered_device_token';

  final FlutterSecureStorage _storage;

  Future<String?> getDeviceToken() => _storage.read(key: _tokenKey);

  Future<void> saveDeviceToken(String token) =>
      _storage.write(key: _tokenKey, value: token);

  Future<String?> getRegisteredDeviceToken() =>
      _storage.read(key: _registeredTokenKey);

  Future<void> saveRegisteredDeviceToken(String token) =>
      _storage.write(key: _registeredTokenKey, value: token);

  Future<void> clear() async {
    await _storage.delete(key: _tokenKey);
    await _storage.delete(key: _registeredTokenKey);
  }
}
