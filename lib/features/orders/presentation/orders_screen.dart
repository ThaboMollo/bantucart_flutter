import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../application/orders_controller.dart';

class OrdersScreen extends ConsumerWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(ordersControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Orders')),
      body: state.loading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              children: [
                const ListTile(title: Text('User Orders')),
                for (final order in state.userOrders)
                  ListTile(
                      title: Text(order.title),
                      subtitle: Text(order.orderStatus)),
                const Divider(),
                const ListTile(title: Text('Courier Orders')),
                for (final order in state.courierOrders)
                  ListTile(
                    title: Text(order.title),
                    subtitle: Text(order.orderStatus),
                    trailing: PopupMenuButton<String>(
                      onSelected: (value) {
                        if (value == 'accept') {
                          ref
                              .read(ordersControllerProvider.notifier)
                              .acceptOrder(order.id, 'courier-id');
                        } else if (value == 'reject') {
                          ref
                              .read(ordersControllerProvider.notifier)
                              .rejectOrder(
                                order.id,
                                'courier-id',
                                reason: 'Unavailable',
                              );
                        } else {
                          ref
                              .read(ordersControllerProvider.notifier)
                              .updateOrderStatus(order.id, value);
                        }
                      },
                      itemBuilder: (context) => const [
                        PopupMenuItem(value: 'accept', child: Text('Accept')),
                        PopupMenuItem(value: 'reject', child: Text('Reject')),
                        PopupMenuItem(
                            value: 'Assigned', child: Text('Set Assigned')),
                        PopupMenuItem(
                            value: 'InTransit', child: Text('Set InTransit')),
                        PopupMenuItem(
                            value: 'Delivered', child: Text('Set Delivered')),
                      ],
                    ),
                  ),
              ],
            ),
    );
  }
}
