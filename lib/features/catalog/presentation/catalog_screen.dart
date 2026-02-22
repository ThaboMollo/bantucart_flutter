import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../application/catalog_controller.dart';

class CatalogScreen extends ConsumerStatefulWidget {
  const CatalogScreen({super.key});

  @override
  ConsumerState<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends ConsumerState<CatalogScreen> {
  final _search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(catalogControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Catalog')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _search,
                    decoration:
                        const InputDecoration(hintText: 'Search product'),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    ref
                        .read(catalogControllerProvider.notifier)
                        .applyFilter(search: _search.text.trim());
                  },
                  icon: const Icon(Icons.search),
                ),
              ],
            ),
          ),
          Expanded(
            child: state.loading && state.products.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: state.products.length + 1,
                    itemBuilder: (context, index) {
                      if (index == state.products.length) {
                        if (state.next == null) {
                          return const SizedBox.shrink();
                        }
                        return TextButton(
                          onPressed: () => ref
                              .read(catalogControllerProvider.notifier)
                              .loadNext(),
                          child: const Text('Load more'),
                        );
                      }

                      final product = state.products[index];
                      return ListTile(
                        title: Text(product.name),
                        subtitle: Text('R ${product.price}'),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
