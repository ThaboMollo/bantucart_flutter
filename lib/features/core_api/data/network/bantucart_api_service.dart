import 'package:dio/dio.dart';

import 'api_client.dart';

class BantucartApiService {
  BantucartApiService(this._client);

  final ApiClient _client;

  // Auth and user
  Future<Response<dynamic>> register(String group, Map<String, dynamic> body) =>
      _client.post('auth/signup/$group/', data: body, excludeAuth: true);
  Future<Response<dynamic>> login(Map<String, dynamic> body) =>
      _client.post('auth/login/', data: body, excludeAuth: true);
  Future<Response<dynamic>> forgotPassword(Map<String, dynamic> body) => _client
      .post('auth/password/reset/request/', data: body, excludeAuth: true);
  Future<Response<dynamic>> syncUser() => _client.get('user');
  Future<Response<dynamic>> fetchUserProfile() =>
      _client.get('api/user/profile/');
  Future<Response<dynamic>> updateUserProfile(Map<String, dynamic> body) =>
      _client.put('user/', data: body);
  Future<Response<dynamic>> logout() => _client.post('auth/logout/');

  // Product, category, shop
  Future<Response<dynamic>> getCategories() =>
      _client.get('product/category/', excludeAuth: true);
  Future<Response<dynamic>> getProducts({Map<String, dynamic>? query}) =>
      _client.get('product/', query: query, excludeAuth: true);
  Future<Response<dynamic>> getShops() =>
      _client.get('shop/', excludeAuth: true);

  // Cart and checkout
  Future<Response<dynamic>> createCart(Map<String, dynamic> body) =>
      _client.post('cart/', data: body);
  Future<Response<dynamic>> addCartItem(
          String cartId, Map<String, dynamic> body) =>
      _client.post('cart/$cartId/item/', data: body);
  Future<Response<dynamic>> getCarts() => _client.get('cart/');
  Future<Response<dynamic>> getCart(String cartId) =>
      _client.get('cart/$cartId/');
  Future<Response<dynamic>> updateCartItemQty(
          String cartId, String itemId, Map<String, dynamic> body) =>
      _client.put('cart/$cartId/item/$itemId/', data: body);
  Future<Response<dynamic>> removeCartItem(String cartId, String itemId) =>
      _client.delete('cart/$cartId/item/$itemId/');
  Future<Response<dynamic>> initiateCheckout(String cartId) =>
      _client.get('cart/checkout/$cartId/');
  Future<Response<dynamic>> verifyCheckoutCallback(
          String cartId, String reference) =>
      _client.get('cart/checkout/callback/$cartId/',
          query: {'reference': reference});

  // Orders and courier
  Future<Response<dynamic>> getUserOrders() => _client.get('cart/order/');
  Future<Response<dynamic>> getCourierAvailableOrders() =>
      _client.get('cart/courier/available-orders/');
  Future<Response<dynamic>> acceptOrder(
          String orderId, Map<String, dynamic> body) =>
      _client.post('cart/courier/accept-order/$orderId/', data: body);
  Future<Response<dynamic>> rejectOrder(
          String orderId, Map<String, dynamic> body) =>
      _client.patch('order/$orderId/reject/', data: body);
  Future<Response<dynamic>> updateOrderStatus(
          String orderId, Map<String, dynamic> body) =>
      _client.put('cart/order-status/$orderId/', data: body);
  Future<Response<dynamic>> cancelOrder(String orderId) =>
      _client.patch('order/$orderId/cancel/', data: <String, dynamic>{});
  Future<Response<dynamic>> createOrder(Map<String, dynamic> body) =>
      _client.post('order/', data: body);

  // Address
  Future<Response<dynamic>> getAddress() => _client.get('address/');
  Future<Response<dynamic>> createAddress(Map<String, dynamic> body) =>
      _client.post('address/', data: body);
  Future<Response<dynamic>> updateAddress(Map<String, dynamic> body) =>
      _client.put('address/', data: body);
  Future<Response<dynamic>> getCountries() => _client.get('address/countries/');
  Future<Response<dynamic>> getProvinces(String countryId) =>
      _client.get('address/province/$countryId/');
  Future<Response<dynamic>> getCities(String provinceId) =>
      _client.get('address/city/$provinceId/');

  // Finance
  Future<Response<dynamic>> getMyAccount() =>
      _client.get('finance/account/my-account/');
  Future<Response<dynamic>> createBankAccount(Map<String, dynamic> body) =>
      _client.post('finance/bank-account/', data: body);
  Future<Response<dynamic>> setPrimaryBankAccount(String accountId) =>
      _client.put('finance/bank-account/$accountId/set-primary/');
  Future<Response<dynamic>> deleteBankAccount(String accountId) =>
      _client.delete('finance/bank-account/$accountId/');
  Future<Response<dynamic>> getMyTransactions(
          {required int page, required int pageSize, String? wallet}) =>
      _client.get('finance/account/my-transaction/', query: {
        'page': page,
        'page_size': pageSize,
        if (wallet != null) 'wallet': wallet,
      });
  Future<Response<dynamic>> getCourierTransactions(
          {required int page, required int pageSize}) =>
      _client.get('finance/accounts/my-transaction/',
          query: {'page': page, 'page_size': pageSize});
  Future<Response<dynamic>> getPaystackBanks(String countryCode) =>
      _client.get('https://api.paystack.co/bank',
          query: {'country': countryCode}, excludeAuth: true);

  // Network marketer
  Future<Response<dynamic>> registerNetworkMarketer({
    required Map<String, String> fields,
    required List<MultipartFilePart> files,
  }) =>
      _client.postMultipart('hub/network-marketer/',
          fields: fields, files: files);

  Future<Response<dynamic>> getDashboard({bool forceRefresh = false}) =>
      _client.get('/hub/dashboard/', query: {'force_refresh': forceRefresh});

  Future<Response<dynamic>> getDashboardEarnings({
    required String period,
    String? startDate,
    String? endDate,
    bool forceRefresh = false,
  }) =>
      _client.get('/hub/dashboard/earnings/', query: {
        'period': period,
        if (startDate != null) 'start_date': startDate,
        if (endDate != null) 'end_date': endDate,
        'force_refresh': forceRefresh,
      });

  Future<Response<dynamic>> getDashboardEarningsHistory({
    required int page,
    required int pageSize,
    String? startDate,
    String? endDate,
    bool forceRefresh = false,
  }) =>
      _client.get('/hub/dashboard/earnings/history/', query: {
        'page': page,
        'page_size': pageSize,
        if (startDate != null) 'start_date': startDate,
        if (endDate != null) 'end_date': endDate,
        'force_refresh': forceRefresh,
      });

  Future<Response<dynamic>> getShareToken() => _client.get('/hub/share-token/');
  Future<Response<dynamic>> getDashboardShops({bool forceRefresh = false}) =>
      _client
          .get('/hub/dashboard/shops/', query: {'force_refresh': forceRefresh});
  Future<Response<dynamic>> invalidateDashboardCache() =>
      _client.post('/hub/dashboard/cache/invalidate/');

  // Notifications
  Future<Response<dynamic>> registerDeviceToken(Map<String, dynamic> body) =>
      _client.post('notifications/device-token/', data: body);
  Future<Response<dynamic>> unregisterDeviceToken(String token) =>
      _client.delete('notifications/device-tokens/$token/');
  Future<Response<dynamic>> markAllNotificationsRead() =>
      _client.post('notifications/mark-all-read/');
  Future<Response<dynamic>> getNotificationPreferences() =>
      _client.get('notifications/preferences/');
  Future<Response<dynamic>> updateNotificationPreferences(
          Map<String, dynamic> body) =>
      _client.put('notifications/preferences/', data: body);
}
