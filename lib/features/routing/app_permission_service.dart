import 'package:permission_handler/permission_handler.dart';

class PermissionState {
  const PermissionState(
      {required this.notificationsGranted, required this.locationGranted});

  final bool notificationsGranted;
  final bool locationGranted;

  bool get allGranted => notificationsGranted && locationGranted;
}

abstract class AppPermissionService {
  Future<PermissionState> getState();
  Future<PermissionState> requestAll();
}

class DevicePermissionService implements AppPermissionService {
  @override
  Future<PermissionState> getState() async {
    final notification = await Permission.notification.status;
    final location = await Permission.locationWhenInUse.status;
    return PermissionState(
      notificationsGranted: notification.isGranted,
      locationGranted: location.isGranted,
    );
  }

  @override
  Future<PermissionState> requestAll() async {
    final notification = await Permission.notification.request();
    final location = await Permission.locationWhenInUse.request();
    return PermissionState(
      notificationsGranted: notification.isGranted,
      locationGranted: location.isGranted,
    );
  }
}
