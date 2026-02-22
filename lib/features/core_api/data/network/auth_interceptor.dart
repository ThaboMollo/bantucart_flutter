import 'package:dio/dio.dart';

import 'auth_token_store.dart';
import 'jwt_utils.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor({
    required Dio refreshDio,
    required AuthTokenStore tokenStore,
    this.refreshPath = 'auth/token/refresh/',
  })  : _refreshDio = refreshDio,
        _tokenStore = tokenStore;

  final Dio _refreshDio;
  final AuthTokenStore _tokenStore;
  final String refreshPath;

  Future<bool>? _refreshInFlight;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final excludeAuth = options.extra['excludeAuth'] == true;

    options.headers.putIfAbsent('Accept', () => '*/*');
    options.headers.putIfAbsent('Content-Type', () => 'application/json');

    if (excludeAuth) {
      handler.next(options);
      return;
    }

    var accessToken = await _tokenStore.getAccessToken();
    if (JwtUtils.isExpired(accessToken)) {
      final refreshed = await _refreshToken();
      if (refreshed) {
        accessToken = await _tokenStore.getAccessToken();
      }
    }

    if (accessToken != null && accessToken.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }

    handler.next(options);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    final request = err.requestOptions;
    final excludeAuth = request.extra['excludeAuth'] == true;
    final isRetry = request.extra['auth_retry'] == true;

    if (!excludeAuth && !isRetry && err.response?.statusCode == 401) {
      final refreshed = await _refreshToken();
      if (refreshed) {
        final token = await _tokenStore.getAccessToken();
        final retry = request.copyWith(
          headers: {
            ...request.headers,
            if (token != null && token.isNotEmpty)
              'Authorization': 'Bearer $token',
          },
          extra: {...request.extra, 'auth_retry': true},
        );

        try {
          final response = await _refreshDio.fetch<dynamic>(retry);
          handler.resolve(response);
          return;
        } on DioException catch (retryError) {
          handler.next(retryError);
          return;
        }
      }
    }

    handler.next(err);
  }

  Future<bool> _refreshToken() {
    final inFlight = _refreshInFlight;
    if (inFlight != null) {
      return inFlight;
    }

    final future = _doRefresh();
    _refreshInFlight = future;
    return future.whenComplete(() => _refreshInFlight = null);
  }

  Future<bool> _doRefresh() async {
    final refreshToken = await _tokenStore.getRefreshToken();
    if (refreshToken == null || refreshToken.isEmpty) {
      return false;
    }

    try {
      final response = await _refreshDio.post<Map<String, dynamic>>(
        refreshPath,
        data: <String, dynamic>{'refresh': refreshToken},
        options: Options(headers: const {'Content-Type': 'application/json'}),
      );

      final data = response.data;
      final access = data?['access'];
      if (access is String && access.isNotEmpty) {
        await _tokenStore.updateAccessToken(access);
        return true;
      }
      return false;
    } on DioException {
      return false;
    }
  }
}
