import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_permission_service.dart';

final appPermissionServiceProvider = Provider<AppPermissionService>((ref) {
  return DevicePermissionService();
});

final permissionStateProvider = FutureProvider<PermissionState>((ref) {
  return ref.watch(appPermissionServiceProvider).getState();
});

class PermissionGateScreen extends ConsumerWidget {
  const PermissionGateScreen({super.key, required this.onContinue});

  final VoidCallback onContinue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stateAsync = ref.watch(permissionStateProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Permissions')),
      body: stateAsync.when(
        data: (state) {
          if (state.allGranted) {
            WidgetsBinding.instance.addPostFrameCallback((_) => onContinue());
          }

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    'Notifications: ${state.notificationsGranted ? 'Granted' : 'Missing'}'),
                const SizedBox(height: 8),
                Text(
                    'Location: ${state.locationGranted ? 'Granted' : 'Missing'}'),
                const SizedBox(height: 24),
                FilledButton(
                  onPressed: () async {
                    await ref.read(appPermissionServiceProvider).requestAll();
                    ref.invalidate(permissionStateProvider);
                  },
                  child: const Text('Request permissions'),
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: onContinue,
                  child: const Text('Skip for now'),
                ),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Permission error: $e')),
      ),
    );
  }
}
