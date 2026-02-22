import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core_api/domain/models/domain_models.dart';
import '../../core_api/domain/models/paginated_response.dart';
import '../../core_api/data/network/model_parsers.dart';
import '../../core_api/domain/repositories/repositories.dart';
import '../../core_api/domain/repositories/repository_providers.dart';

class CatalogState {
  const CatalogState({
    this.loading = false,
    this.products = const <Product>[],
    this.categories = const <Category>[],
    this.error,
    this.search,
    this.categoryId,
    this.shopId,
    this.subCategoryId,
    this.next,
  });

  final bool loading;
  final List<Product> products;
  final List<Category> categories;
  final String? error;
  final String? search;
  final String? categoryId;
  final String? shopId;
  final String? subCategoryId;
  final String? next;

  CatalogState copyWith({
    bool? loading,
    List<Product>? products,
    List<Category>? categories,
    String? error,
    String? search,
    String? categoryId,
    String? shopId,
    String? subCategoryId,
    String? next,
    bool clearError = false,
  }) {
    return CatalogState(
      loading: loading ?? this.loading,
      products: products ?? this.products,
      categories: categories ?? this.categories,
      error: clearError ? null : (error ?? this.error),
      search: search ?? this.search,
      categoryId: categoryId ?? this.categoryId,
      shopId: shopId ?? this.shopId,
      subCategoryId: subCategoryId ?? this.subCategoryId,
      next: next ?? this.next,
    );
  }
}

final catalogControllerProvider =
    StateNotifierProvider<CatalogController, CatalogState>((ref) {
  return CatalogController(ref.watch(catalogRepositoryProvider));
});

class CatalogController extends StateNotifier<CatalogState> {
  CatalogController(this._catalogRepository) : super(const CatalogState()) {
    loadInitial();
  }

  final CatalogRepository _catalogRepository;

  Future<void> loadInitial() async {
    state = state.copyWith(loading: true, clearError: true);
    try {
      final categoriesJson =
          await _catalogRepository.getCategories() as Map<String, dynamic>;
      final productsJson = await _catalogRepository.getProducts(
          query: buildQueryParams()) as Map<String, dynamic>;

      final categories = PaginatedResponse<Category>.fromJson(
        categoriesJson,
        (obj) => parseCategory(obj! as Map<String, dynamic>),
      ).results;

      final page = PaginatedResponse<Product>.fromJson(
        productsJson,
        (obj) => parseProduct(obj! as Map<String, dynamic>),
      );

      state = state.copyWith(
        loading: false,
        categories: categories,
        products: page.results,
        next: page.next,
      );
    } catch (e) {
      state = state.copyWith(loading: false, error: e.toString());
    }
  }

  Map<String, dynamic> buildQueryParams({String? nextUrl}) {
    if (nextUrl != null && nextUrl.isNotEmpty) {
      return {'next': nextUrl};
    }

    return {
      if (state.search != null && state.search!.isNotEmpty)
        'search': state.search,
      if (state.categoryId != null && state.categoryId!.isNotEmpty)
        'category': state.categoryId,
      if (state.subCategoryId != null && state.subCategoryId!.isNotEmpty)
        'sub_category': state.subCategoryId,
      if (state.shopId != null && state.shopId!.isNotEmpty)
        'shop': state.shopId,
    };
  }

  Future<void> applyFilter(
      {String? search,
      String? categoryId,
      String? subCategoryId,
      String? shopId}) async {
    state = state.copyWith(
      search: search,
      categoryId: categoryId,
      subCategoryId: subCategoryId,
      shopId: shopId,
      next: null,
    );
    await loadInitial();
  }

  Future<void> loadNext() async {
    final next = state.next;
    if (next == null || next.isEmpty || state.loading) {
      return;
    }

    state = state.copyWith(loading: true, clearError: true);
    try {
      final productsJson = await _catalogRepository.getProducts(
          query: buildQueryParams(nextUrl: next)) as Map<String, dynamic>;
      final page = PaginatedResponse<Product>.fromJson(
        productsJson,
        (obj) => parseProduct(obj! as Map<String, dynamic>),
      );
      state = state.copyWith(
        loading: false,
        products: [...state.products, ...page.results],
        next: page.next,
      );
    } catch (e) {
      state = state.copyWith(loading: false, error: e.toString());
    }
  }
}
