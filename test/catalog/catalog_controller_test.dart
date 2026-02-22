import 'package:flutter_test/flutter_test.dart';

import 'package:bantucart/features/catalog/application/catalog_controller.dart';
import 'package:bantucart/features/core_api/domain/repositories/repositories.dart';

class FakeCatalogRepository implements CatalogRepository {
  Map<String, dynamic>? lastQuery;

  @override
  Future getCategories() async => {
        'count': 1,
        'next': null,
        'previous': null,
        'results': [
          {'id': 'cat1', 'name': 'Category', 'slug': 'category'}
        ],
      };

  @override
  Future getProducts({Map<String, dynamic>? query}) async {
    lastQuery = query;
    return {
      'count': 1,
      'next': null,
      'previous': null,
      'results': [
        {
          'id': 'p1',
          'shop': {'id': 's1', 'name': 'Shop', 'rank': '1'},
          'name': 'Product',
          'description': 'Desc',
          'price': '10.00',
          'is_on_sale': false,
          'sale_percentage': '0.00',
          'images': [],
          'attributes': {},
        }
      ],
    };
  }

  @override
  Future getShops() async =>
      {'count': 0, 'next': null, 'previous': null, 'results': []};
}

void main() {
  test('buildQueryParams composes search/category params', () async {
    final repo = FakeCatalogRepository();
    final controller = CatalogController(repo);

    await controller.applyFilter(
        search: 'milk',
        categoryId: 'cat1',
        subCategoryId: 'sub1',
        shopId: 'shop1');

    expect(repo.lastQuery?['search'], 'milk');
    expect(repo.lastQuery?['category'], 'cat1');
    expect(repo.lastQuery?['sub_category'], 'sub1');
    expect(repo.lastQuery?['shop'], 'shop1');
  });
}
