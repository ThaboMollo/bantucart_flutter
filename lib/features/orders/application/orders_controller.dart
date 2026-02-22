import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core_api/domain/models/domain_models.dart';
import '../../core_api/domain/models/paginated_response.dart';
import '../../core_api/data/network/model_parsers.dart';
import '../../core_api/domain/repositories/repositories.dart';
import '../../core_api/domain/repositories/repository_providers.dart';

class OrdersState {
  const OrdersState({
    this.loading = false,
    this.userOrders = const <Cart>[],
    this.courierOrders = const <Cart>[],
    this.error,
  });

  final bool loading;
  final List<Cart> userOrders;
  final List<Cart> courierOrders;
  final String? error;

  OrdersState copyWith({
    bool? loading,
    List<Cart>? userOrders,
    List<Cart>? courierOrders,
    String? error,
    bool clearError = false,
  }) {
    return OrdersState(
      loading: loading ?? this.loading,
      userOrders: userOrders ?? this.userOrders,
      courierOrders: courierOrders ?? this.courierOrders,
      error: clearError ? null : (error ?? this.error),
    );
  }
}

final ordersControllerProvider =
    StateNotifierProvider<OrdersController, OrdersState>((ref) {
  return OrdersController(ref.watch(orderRepositoryProvider));
});

class OrdersController extends StateNotifier<OrdersState> {
  OrdersController(this._orderRepository) : super(const OrdersState()) {
    loadOrders();
  }

  final OrderRepository _orderRepository;

  Future<void> loadOrders() async {
    state = state.copyWith(loading: true, clearError: true);
    try {
      final userJson =
          await _orderRepository.getUserOrders() as Map<String, dynamic>;
      final courierJson = await _orderRepository.getCourierAvailableOrders()
          as Map<String, dynamic>;
      final userPage = PaginatedResponse<Cart>.fromJson(
        userJson,
        (obj) => parseCart(obj! as Map<String, dynamic>),
      );
      final courierPage = PaginatedResponse<Cart>.fromJson(
        courierJson,
        (obj) => parseCart(obj! as Map<String, dynamic>),
      );
      state = state.copyWith(
        loading: false,
        userOrders: userPage.results,
        courierOrders: courierPage.results,
      );
    } catch (e) {
      state = state.copyWith(loading: false, error: e.toString());
    }
  }

  Future<void> acceptOrder(String orderId, String courierId) async {
    await _orderRepository.acceptOrder(orderId, courierId);
    await loadOrders();
  }

  Future<void> rejectOrder(String orderId, String courierId,
      {String? reason}) async {
    await _orderRepository.rejectOrder(orderId, courierId, reason: reason);
    await loadOrders();
  }

  Future<void> updateOrderStatus(String orderId, String status) async {
    await _orderRepository.updateOrderStatus(orderId, status);
    await loadOrders();
  }
}
