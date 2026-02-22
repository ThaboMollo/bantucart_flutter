import 'package:flutter_test/flutter_test.dart';

import 'package:bantucart/features/cart/application/cart_controller.dart';
import 'package:bantucart/features/core_api/domain/models/domain_models.dart';
import 'package:bantucart/features/core_api/domain/repositories/repositories.dart';

class FakeCartRepository implements CartRepository {
  FakeCartRepository({this.failUpdate = false});

  final bool failUpdate;

  @override
  Future addCartItem(String cartId, Map<String, dynamic> body) async => {};

  @override
  Future createCart(Map<String, dynamic> body) async => {};

  @override
  Future getCart(String cartId) async => {};

  @override
  Future getCarts() async => {
        'count': 0,
        'next': null,
        'previous': null,
        'results': [],
      };

  @override
  Future initiateCheckout(String cartId) async => {
        'delivery': '0',
        'delivery_provider': 'none',
        'link': 'https://checkout',
        'reference': 'ref1',
        'access_code': 'acc',
        'price': '10',
        'service_fee': '1',
        'total': '11',
        'courier_payment': '0',
      };

  @override
  Future removeCartItem(String cartId, String itemId) async => {};

  @override
  Future updateCartItemQty(String cartId, String itemId, int qty) async {
    if (failUpdate) {
      throw Exception('update failed');
    }
  }

  @override
  Future verifyCheckoutCallback(String cartId, String reference) async => {
        'status': 'success',
        'message': 'ok',
      };
}

class TestCartController extends CartController {
  TestCartController(super.cartRepository);

  void seed(List<Cart> carts) {
    state = state.copyWith(carts: carts);
  }

  @override
  Future<void> refreshCarts() async {
    // no-op in unit tests
  }
}

void main() {
  test('optimistic qty update rolls back on failure', () async {
    final repo = FakeCartRepository(failUpdate: true);
    final controller = TestCartController(repo)
      ..seed([
        const Cart(
          id: 'c1',
          title: 'Cart 1',
          user: 'u1',
          orderStatus: 'pending',
          shop: 's1',
          items: [
            CartItem(
              id: 'i1',
              cart: 'c1',
              qty: 1,
              product: Product(
                id: 'p1',
                shop: ShopRead(id: 's1', name: 'Shop', rank: '1'),
                name: 'Milk',
                description: 'x',
                price: '10.00',
              ),
            ),
          ],
        ),
      ]);

    expect(controller.state.carts.first.items.first.qty, 1);

    await controller.updateItemQtyOptimistic(
        cartId: 'c1', itemId: 'i1', qty: 2);

    expect(controller.state.carts.first.items.first.qty, 1);
    expect(controller.state.error, isNotNull);
  });

  test('checkout callback success is captured', () async {
    final repo = FakeCartRepository();
    final controller = TestCartController(repo);

    await controller.initiateCheckout('c1');
    expect(controller.state.checkoutResponse?.reference, 'ref1');

    await controller.verifyCheckout('c1', 'ref1');
    expect(controller.state.checkoutCallback?.status, 'success');
  });
}
