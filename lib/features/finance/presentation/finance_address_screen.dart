import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../application/finance_address_controller.dart';

class FinanceAddressScreen extends ConsumerWidget {
  const FinanceAddressScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(financeAddressControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Finance + Address')),
      body: state.loading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              children: [
                ListTile(
                  title: const Text('Address'),
                  subtitle: Text(state.address?.street ?? 'No address saved'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: FilledButton(
                    onPressed: () {
                      ref
                          .read(financeAddressControllerProvider.notifier)
                          .upsertAddress(
                        {
                          'id': state.address?.id ?? 'local-temp-id',
                          'street': 'Main Street',
                          'suburb': 'Central',
                          'postal_code': '0001',
                        },
                        hasExisting: state.address != null,
                      );
                    },
                    child: const Text('Save sample address'),
                  ),
                ),
                const Divider(),
                const ListTile(title: Text('Bank Accounts')),
                for (final account in state.accounts)
                  ListTile(
                    title: Text('${account.currency} - ${account.balance}'),
                    subtitle: Text('Primary: ${account.isPrimary}'),
                    trailing: PopupMenuButton<String>(
                      onSelected: (value) {
                        if (value == 'primary') {
                          ref
                              .read(financeAddressControllerProvider.notifier)
                              .setPrimary(account.id);
                        } else {
                          ref
                              .read(financeAddressControllerProvider.notifier)
                              .deleteAccount(account.id);
                        }
                      },
                      itemBuilder: (context) => const [
                        PopupMenuItem(
                            value: 'primary', child: Text('Set Primary')),
                        PopupMenuItem(value: 'delete', child: Text('Delete')),
                      ],
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: FilledButton(
                    onPressed: () {
                      ref
                          .read(financeAddressControllerProvider.notifier)
                          .createBankAccount(
                        {
                          'account_number': '1234567890',
                          'bank_code': '058',
                          'account_name': 'Demo User',
                          'currency': 'ZAR',
                        },
                      );
                    },
                    child: const Text('Create sample account'),
                  ),
                ),
              ],
            ),
    );
  }
}
