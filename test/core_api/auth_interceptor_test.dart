import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:bantucart/features/core_api/data/network/api_client.dart';
import 'package:bantucart/features/core_api/data/network/auth_token_store.dart';

class MemoryTokenStore implements AuthTokenStore {
  MemoryTokenStore({required this.access, required this.refresh});

  String? access;
  String? refresh;

  @override
  Future<void> clear() async {
    access = null;
    refresh = null;
  }

  @override
  Future<String?> getAccessToken() async => access;

  @override
  Future<String?> getRefreshToken() async => refresh;

  @override
  Future<void> saveTokens(
      {required String access, required String refresh}) async {
    this.access = access;
    this.refresh = refresh;
  }

  @override
  Future<void> updateAccessToken(String access) async {
    this.access = access;
  }
}

class FakeHttpClientAdapter implements HttpClientAdapter {
  FakeHttpClientAdapter(this._handler);

  final Future<ResponseBody> Function(RequestOptions options) _handler;

  @override
  void close({bool force = false}) {}

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<List<int>>? requestStream,
    Future<void>? cancelFuture,
  ) =>
      _handler(options);
}

String jwtWithExpSeconds(int exp) {
  final header = base64Url.encode(utf8.encode('{"alg":"HS256","typ":"JWT"}'));
  final payload = base64Url.encode(utf8.encode('{"exp":$exp}'));
  return '$header.$payload.signature';
}

void main() {
  group('AuthInterceptor', () {
    test('refreshes expired token before request', () async {
      final now = DateTime.now().toUtc();
      final expired = jwtWithExpSeconds(
          now.subtract(const Duration(minutes: 1)).millisecondsSinceEpoch ~/
              1000);
      final refreshed = jwtWithExpSeconds(
          now.add(const Duration(minutes: 10)).millisecondsSinceEpoch ~/ 1000);
      final tokenStore =
          MemoryTokenStore(access: expired, refresh: 'refresh-token');

      final adapter = FakeHttpClientAdapter((options) async {
        if (options.path.contains('auth/token/refresh/')) {
          return ResponseBody.fromString('{"access":"$refreshed"}', 200,
              headers: {
                Headers.contentTypeHeader: [Headers.jsonContentType],
              });
        }

        expect(options.headers['Authorization'], 'Bearer $refreshed');
        return ResponseBody.fromString('{"ok":true}', 200, headers: {
          Headers.contentTypeHeader: [Headers.jsonContentType],
        });
      });

      final dio = Dio(BaseOptions(baseUrl: 'https://api.bantucart.com/'));
      dio.httpClientAdapter = adapter;

      final client = ApiClient(
        baseUrl: 'https://api.bantucart.com/',
        tokenStore: tokenStore,
        dio: dio,
      );
      client.dio.httpClientAdapter = adapter;

      final response = await client.get<dynamic>('protected/endpoint/');

      expect(response.statusCode, 200);
      expect(tokenStore.access, refreshed);
    });

    test('retries once after 401 with refreshed token', () async {
      final now = DateTime.now().toUtc();
      final valid = jwtWithExpSeconds(
          now.add(const Duration(minutes: 10)).millisecondsSinceEpoch ~/ 1000);
      final refreshed = jwtWithExpSeconds(
          now.add(const Duration(minutes: 30)).millisecondsSinceEpoch ~/ 1000);
      final tokenStore =
          MemoryTokenStore(access: valid, refresh: 'refresh-token');

      var hitCount = 0;
      final adapter = FakeHttpClientAdapter((options) async {
        if (options.path.contains('auth/token/refresh/')) {
          return ResponseBody.fromString('{"access":"$refreshed"}', 200,
              headers: {
                Headers.contentTypeHeader: [Headers.jsonContentType],
              });
        }

        hitCount += 1;
        if (hitCount == 1) {
          return ResponseBody.fromString('{"detail":"expired"}', 401, headers: {
            Headers.contentTypeHeader: [Headers.jsonContentType],
          });
        }

        expect(options.headers['Authorization'], 'Bearer $refreshed');
        return ResponseBody.fromString('{"ok":true}', 200, headers: {
          Headers.contentTypeHeader: [Headers.jsonContentType],
        });
      });

      final dio = Dio(BaseOptions(baseUrl: 'https://api.bantucart.com/'));
      dio.httpClientAdapter = adapter;

      final client = ApiClient(
        baseUrl: 'https://api.bantucart.com/',
        tokenStore: tokenStore,
        dio: dio,
      );
      client.dio.httpClientAdapter = adapter;

      final response = await client.get<dynamic>('protected/endpoint/');

      expect(response.statusCode, 200);
      expect(hitCount, 2);
      expect(tokenStore.access, refreshed);
    });

    test('fails when refresh cannot recover 401', () async {
      final now = DateTime.now().toUtc();
      final valid = jwtWithExpSeconds(
          now.add(const Duration(minutes: 10)).millisecondsSinceEpoch ~/ 1000);
      final tokenStore =
          MemoryTokenStore(access: valid, refresh: 'refresh-token');

      final adapter = FakeHttpClientAdapter((options) async {
        if (options.path.contains('auth/token/refresh/')) {
          return ResponseBody.fromString('{"detail":"invalid refresh"}', 401,
              headers: {
                Headers.contentTypeHeader: [Headers.jsonContentType],
              });
        }

        return ResponseBody.fromString('{"detail":"expired"}', 401, headers: {
          Headers.contentTypeHeader: [Headers.jsonContentType],
        });
      });

      final dio = Dio(BaseOptions(baseUrl: 'https://api.bantucart.com/'));
      dio.httpClientAdapter = adapter;

      final client = ApiClient(
        baseUrl: 'https://api.bantucart.com/',
        tokenStore: tokenStore,
        dio: dio,
      );
      client.dio.httpClientAdapter = adapter;

      expect(
        () => client.get<dynamic>('protected/endpoint/'),
        throwsA(isA<DioException>()),
      );
    });
  });
}
