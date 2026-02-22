import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../application/network_dashboard_controller.dart';

class NetworkDashboardScreen extends ConsumerWidget {
  const NetworkDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(networkDashboardControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Network Dashboard')),
      body: state.loading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              children: [
                ListTile(
                  title: const Text('Referral token'),
                  subtitle: Text(state.shareToken ?? '-'),
                ),
                if (state.dashboard != null) ...[
                  ListTile(
                    title: const Text('Total earnings'),
                    subtitle: Text(state.dashboard!.summary.totalEarnings),
                  ),
                  ListTile(
                    title: const Text('Total shops'),
                    subtitle: Text('${state.dashboard!.summary.totalShops}'),
                  ),
                ],
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: FilledButton(
                    onPressed: () => ref
                        .read(networkDashboardControllerProvider.notifier)
                        .invalidateCache(),
                    child: const Text('Invalidate cache + refresh'),
                  ),
                ),
              ],
            ),
    );
  }
}
