import '../../data/network/bantucart_api_service.dart';

abstract class AuthRepository {
  Future<dynamic> login(Map<String, dynamic> body);
  Future<dynamic> register(String group, Map<String, dynamic> body);
  Future<dynamic> forgotPassword(Map<String, dynamic> body);
  Future<dynamic> syncUser();
}

abstract class CatalogRepository {
  Future<dynamic> getCategories();
  Future<dynamic> getProducts({Map<String, dynamic>? query});
  Future<dynamic> getShops();
}

abstract class CartRepository {
  Future<dynamic> getCarts();
  Future<dynamic> getCart(String cartId);
  Future<dynamic> createCart(Map<String, dynamic> body);
  Future<dynamic> addCartItem(String cartId, Map<String, dynamic> body);
  Future<dynamic> updateCartItemQty(String cartId, String itemId, int qty);
  Future<dynamic> removeCartItem(String cartId, String itemId);
  Future<dynamic> initiateCheckout(String cartId);
  Future<dynamic> verifyCheckoutCallback(String cartId, String reference);
}

abstract class OrderRepository {
  Future<dynamic> getUserOrders();
  Future<dynamic> getCourierAvailableOrders();
  Future<dynamic> acceptOrder(String orderId, String courierId);
  Future<dynamic> rejectOrder(String orderId, String courierId,
      {String? reason});
  Future<dynamic> updateOrderStatus(String orderId, String status);
}

abstract class AddressRepository {
  Future<dynamic> getAddress();
  Future<dynamic> createAddress(Map<String, dynamic> body);
  Future<dynamic> updateAddress(Map<String, dynamic> body);
  Future<dynamic> getCountries();
  Future<dynamic> getProvinces(String countryId);
  Future<dynamic> getCities(String provinceId);
}

abstract class FinanceRepository {
  Future<dynamic> getMyAccount();
  Future<dynamic> createBankAccount(Map<String, dynamic> body);
  Future<dynamic> setPrimaryBankAccount(String accountId);
  Future<dynamic> deleteBankAccount(String accountId);
  Future<dynamic> getMyTransactions(
      {required int page, required int pageSize, String? wallet});
}

abstract class NetworkMarketerRepository {
  Future<dynamic> getDashboard({bool forceRefresh});
  Future<dynamic> getShareToken();
  Future<dynamic> invalidateDashboardCache();
}

abstract class NotificationRepository {
  Future<dynamic> registerDeviceToken(Map<String, dynamic> body);
  Future<dynamic> unregisterDeviceToken(String token);
  Future<dynamic> getNotificationPreferences();
  Future<dynamic> updateNotificationPreferences(Map<String, dynamic> body);
}

typedef ApiServiceFactory = BantucartApiService Function();
