import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../application/cart_controller.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(cartControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: state.loading && state.carts.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              children: [
                for (final cart in state.carts) ...[
                  ListTile(
                      title: Text(cart.title),
                      subtitle: Text('Status: ${cart.orderStatus}')),
                  for (final item in cart.items)
                    ListTile(
                      title: Text(item.product.name),
                      subtitle: Text('Qty: ${item.qty}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () => ref
                                .read(cartControllerProvider.notifier)
                                .updateItemQtyOptimistic(
                                  cartId: cart.id,
                                  itemId: item.id,
                                  qty: item.qty + 1,
                                ),
                            icon: const Icon(Icons.add),
                          ),
                          IconButton(
                            onPressed: () => ref
                                .read(cartControllerProvider.notifier)
                                .removeItemOptimistic(
                                  cartId: cart.id,
                                  itemId: item.id,
                                ),
                            icon: const Icon(Icons.delete),
                          ),
                        ],
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: FilledButton(
                      onPressed: () => ref
                          .read(cartControllerProvider.notifier)
                          .initiateCheckout(cart.id),
                      child: const Text('Checkout'),
                    ),
                  ),
                ],
                if (state.checkoutResponse != null)
                  ListTile(
                      title: Text(
                          'Checkout link: ${state.checkoutResponse!.link}')),
                if (state.checkoutCallback != null)
                  ListTile(
                      title:
                          Text('Callback: ${state.checkoutCallback!.status}')),
              ],
            ),
    );
  }
}
