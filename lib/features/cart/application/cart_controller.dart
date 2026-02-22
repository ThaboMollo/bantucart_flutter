import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core_api/domain/models/domain_models.dart';
import '../../core_api/domain/models/paginated_response.dart';
import '../../core_api/data/network/model_parsers.dart';
import '../../core_api/domain/repositories/repositories.dart';
import '../../core_api/domain/repositories/repository_providers.dart';

class CartState {
  const CartState({
    this.loading = false,
    this.carts = const <Cart>[],
    this.error,
    this.checkoutResponse,
    this.checkoutCallback,
  });

  final bool loading;
  final List<Cart> carts;
  final String? error;
  final CheckoutResponse? checkoutResponse;
  final CheckoutCallbackResponse? checkoutCallback;

  CartState copyWith({
    bool? loading,
    List<Cart>? carts,
    String? error,
    CheckoutResponse? checkoutResponse,
    CheckoutCallbackResponse? checkoutCallback,
    bool clearError = false,
  }) {
    return CartState(
      loading: loading ?? this.loading,
      carts: carts ?? this.carts,
      error: clearError ? null : (error ?? this.error),
      checkoutResponse: checkoutResponse ?? this.checkoutResponse,
      checkoutCallback: checkoutCallback ?? this.checkoutCallback,
    );
  }
}

final cartControllerProvider =
    StateNotifierProvider<CartController, CartState>((ref) {
  return CartController(ref.watch(cartRepositoryProvider));
});

class CartController extends StateNotifier<CartState> {
  CartController(this._cartRepository) : super(const CartState()) {
    refreshCarts();
  }

  final CartRepository _cartRepository;

  Future<void> refreshCarts() async {
    state = state.copyWith(loading: true, clearError: true);
    try {
      final json = await _cartRepository.getCarts() as Map<String, dynamic>;
      final page = PaginatedResponse<Cart>.fromJson(
        json,
        (obj) => parseCart(obj! as Map<String, dynamic>),
      );
      state = state.copyWith(loading: false, carts: page.results);
    } catch (e) {
      state = state.copyWith(loading: false, error: e.toString());
    }
  }

  Future<void> updateItemQtyOptimistic({
    required String cartId,
    required String itemId,
    required int qty,
  }) async {
    final current = state.carts;
    final optimistic = current
        .map(
          (cart) => cart.id == cartId
              ? Cart(
                  id: cart.id,
                  title: cart.title,
                  dateCreated: cart.dateCreated,
                  lastModified: cart.lastModified,
                  user: cart.user,
                  items: cart.items
                      .map(
                        (item) => item.id == itemId
                            ? CartItem(
                                id: item.id,
                                cart: item.cart,
                                product: item.product,
                                qty: qty)
                            : item,
                      )
                      .toList(),
                  isCheckedOut: cart.isCheckedOut,
                  orderStatus: cart.orderStatus,
                  shop: cart.shop,
                  checkoutMetadata: cart.checkoutMetadata,
                )
              : cart,
        )
        .toList();

    state = state.copyWith(carts: optimistic, clearError: true);
    try {
      await _cartRepository.updateCartItemQty(cartId, itemId, qty);
    } catch (e) {
      state = state.copyWith(carts: current, error: e.toString());
    }
  }

  Future<void> removeItemOptimistic(
      {required String cartId, required String itemId}) async {
    final current = state.carts;
    final optimistic = current
        .map(
          (cart) => cart.id == cartId
              ? Cart(
                  id: cart.id,
                  title: cart.title,
                  dateCreated: cart.dateCreated,
                  lastModified: cart.lastModified,
                  user: cart.user,
                  items: cart.items.where((item) => item.id != itemId).toList(),
                  isCheckedOut: cart.isCheckedOut,
                  orderStatus: cart.orderStatus,
                  shop: cart.shop,
                  checkoutMetadata: cart.checkoutMetadata,
                )
              : cart,
        )
        .toList();

    state = state.copyWith(carts: optimistic, clearError: true);
    try {
      await _cartRepository.removeCartItem(cartId, itemId);
    } catch (e) {
      state = state.copyWith(carts: current, error: e.toString());
    }
  }

  Future<void> initiateCheckout(String cartId) async {
    state = state.copyWith(loading: true, clearError: true);
    try {
      final response = await _cartRepository.initiateCheckout(cartId)
          as Map<String, dynamic>;
      state = state.copyWith(
        loading: false,
        checkoutResponse: parseCheckoutResponse(response),
      );
    } catch (e) {
      state = state.copyWith(loading: false, error: e.toString());
    }
  }

  Future<void> verifyCheckout(String cartId, String reference) async {
    state = state.copyWith(loading: true, clearError: true);
    try {
      final response = await _cartRepository.verifyCheckoutCallback(
          cartId, reference) as Map<String, dynamic>;
      final callback = parseCheckoutCallbackResponse(response);
      state = state.copyWith(loading: false, checkoutCallback: callback);
      if (callback.status.toLowerCase() == 'success') {
        await refreshCarts();
      }
    } catch (e) {
      state = state.copyWith(loading: false, error: e.toString());
    }
  }
}
