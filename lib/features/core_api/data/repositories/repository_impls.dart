import '../network/bantucart_api_service.dart';
import '../../domain/repositories/repositories.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._api);
  final BantucartApiService _api;

  @override
  Future<dynamic> login(Map<String, dynamic> body) async =>
      (await _api.login(body)).data;

  @override
  Future<dynamic> register(String group, Map<String, dynamic> body) async =>
      (await _api.register(group, body)).data;

  @override
  Future<dynamic> forgotPassword(Map<String, dynamic> body) async =>
      (await _api.forgotPassword(body)).data;

  @override
  Future<dynamic> syncUser() async => (await _api.syncUser()).data;
}

class CatalogRepositoryImpl implements CatalogRepository {
  CatalogRepositoryImpl(this._api);
  final BantucartApiService _api;

  @override
  Future<dynamic> getCategories() async => (await _api.getCategories()).data;

  @override
  Future<dynamic> getProducts({Map<String, dynamic>? query}) async =>
      (await _api.getProducts(query: query)).data;

  @override
  Future<dynamic> getShops() async => (await _api.getShops()).data;
}

class CartRepositoryImpl implements CartRepository {
  CartRepositoryImpl(this._api);
  final BantucartApiService _api;

  @override
  Future<dynamic> getCarts() async => (await _api.getCarts()).data;

  @override
  Future<dynamic> getCart(String cartId) async =>
      (await _api.getCart(cartId)).data;

  @override
  Future<dynamic> createCart(Map<String, dynamic> body) async =>
      (await _api.createCart(body)).data;

  @override
  Future<dynamic> addCartItem(String cartId, Map<String, dynamic> body) async =>
      (await _api.addCartItem(cartId, body)).data;

  @override
  Future<dynamic> updateCartItemQty(
          String cartId, String itemId, int qty) async =>
      (await _api
              .updateCartItemQty(cartId, itemId, <String, dynamic>{'qty': qty}))
          .data;

  @override
  Future<dynamic> removeCartItem(String cartId, String itemId) async =>
      (await _api.removeCartItem(cartId, itemId)).data;

  @override
  Future<dynamic> initiateCheckout(String cartId) async =>
      (await _api.initiateCheckout(cartId)).data;

  @override
  Future<dynamic> verifyCheckoutCallback(
          String cartId, String reference) async =>
      (await _api.verifyCheckoutCallback(cartId, reference)).data;
}

class OrderRepositoryImpl implements OrderRepository {
  OrderRepositoryImpl(this._api);
  final BantucartApiService _api;

  @override
  Future<dynamic> getUserOrders() async => (await _api.getUserOrders()).data;

  @override
  Future<dynamic> getCourierAvailableOrders() async =>
      (await _api.getCourierAvailableOrders()).data;

  @override
  Future<dynamic> acceptOrder(String orderId, String courierId) async =>
      (await _api
              .acceptOrder(orderId, <String, dynamic>{'courier_id': courierId}))
          .data;

  @override
  Future<dynamic> rejectOrder(String orderId, String courierId,
          {String? reason}) async =>
      (await _api.rejectOrder(orderId, <String, dynamic>{
        'courier_id': courierId,
        if (reason != null && reason.isNotEmpty) 'reason': reason,
      }))
          .data;

  @override
  Future<dynamic> updateOrderStatus(String orderId, String status) async =>
      (await _api.updateOrderStatus(
              orderId, <String, dynamic>{'order_status': status}))
          .data;
}

class AddressRepositoryImpl implements AddressRepository {
  AddressRepositoryImpl(this._api);
  final BantucartApiService _api;

  @override
  Future<dynamic> getAddress() async => (await _api.getAddress()).data;

  @override
  Future<dynamic> createAddress(Map<String, dynamic> body) async =>
      (await _api.createAddress(body)).data;

  @override
  Future<dynamic> updateAddress(Map<String, dynamic> body) async =>
      (await _api.updateAddress(body)).data;

  @override
  Future<dynamic> getCountries() async => (await _api.getCountries()).data;

  @override
  Future<dynamic> getProvinces(String countryId) async =>
      (await _api.getProvinces(countryId)).data;

  @override
  Future<dynamic> getCities(String provinceId) async =>
      (await _api.getCities(provinceId)).data;
}

class FinanceRepositoryImpl implements FinanceRepository {
  FinanceRepositoryImpl(this._api);
  final BantucartApiService _api;

  @override
  Future<dynamic> getMyAccount() async => (await _api.getMyAccount()).data;

  @override
  Future<dynamic> createBankAccount(Map<String, dynamic> body) async =>
      (await _api.createBankAccount(body)).data;

  @override
  Future<dynamic> setPrimaryBankAccount(String accountId) async =>
      (await _api.setPrimaryBankAccount(accountId)).data;

  @override
  Future<dynamic> deleteBankAccount(String accountId) async =>
      (await _api.deleteBankAccount(accountId)).data;

  @override
  Future<dynamic> getMyTransactions(
          {required int page, required int pageSize, String? wallet}) async =>
      (await _api.getMyTransactions(
              page: page, pageSize: pageSize, wallet: wallet))
          .data;
}

class NetworkMarketerRepositoryImpl implements NetworkMarketerRepository {
  NetworkMarketerRepositoryImpl(this._api);
  final BantucartApiService _api;

  @override
  Future<dynamic> getDashboard({bool forceRefresh = false}) async =>
      (await _api.getDashboard(forceRefresh: forceRefresh)).data;

  @override
  Future<dynamic> getShareToken() async => (await _api.getShareToken()).data;

  @override
  Future<dynamic> invalidateDashboardCache() async =>
      (await _api.invalidateDashboardCache()).data;
}

class NotificationRepositoryImpl implements NotificationRepository {
  NotificationRepositoryImpl(this._api);
  final BantucartApiService _api;

  @override
  Future<dynamic> registerDeviceToken(Map<String, dynamic> body) async =>
      (await _api.registerDeviceToken(body)).data;

  @override
  Future<dynamic> unregisterDeviceToken(String token) async =>
      (await _api.unregisterDeviceToken(token)).data;

  @override
  Future<dynamic> getNotificationPreferences() async =>
      (await _api.getNotificationPreferences()).data;

  @override
  Future<dynamic> updateNotificationPreferences(
          Map<String, dynamic> body) async =>
      (await _api.updateNotificationPreferences(body)).data;
}
