import 'package:dio/dio.dart';

import 'auth_interceptor.dart';
import 'auth_token_store.dart';

class ApiClient {
  ApiClient({
    required String baseUrl,
    required AuthTokenStore tokenStore,
    Dio? dio,
  })  : _dio = dio ?? Dio(BaseOptions(baseUrl: baseUrl)),
        _refreshDio = Dio(BaseOptions(baseUrl: baseUrl)) {
    _refreshDio.httpClientAdapter = _dio.httpClientAdapter;
    _dio.interceptors.add(
      AuthInterceptor(refreshDio: _refreshDio, tokenStore: tokenStore),
    );
  }

  final Dio _dio;
  final Dio _refreshDio;

  Dio get dio => _dio;

  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? query,
    bool excludeAuth = false,
  }) {
    return _dio.get<T>(
      path,
      queryParameters: query,
      options: Options(extra: {'excludeAuth': excludeAuth}),
    );
  }

  Future<Response<T>> post<T>(
    String path, {
    Object? data,
    bool excludeAuth = false,
  }) {
    return _dio.post<T>(
      path,
      data: data,
      options: Options(extra: {'excludeAuth': excludeAuth}),
    );
  }

  Future<Response<T>> put<T>(
    String path, {
    Object? data,
    bool excludeAuth = false,
  }) {
    return _dio.put<T>(
      path,
      data: data,
      options: Options(extra: {'excludeAuth': excludeAuth}),
    );
  }

  Future<Response<T>> patch<T>(
    String path, {
    Object? data,
    bool excludeAuth = false,
  }) {
    return _dio.patch<T>(
      path,
      data: data,
      options: Options(extra: {'excludeAuth': excludeAuth}),
    );
  }

  Future<Response<T>> delete<T>(
    String path, {
    Object? data,
    bool excludeAuth = false,
  }) {
    return _dio.delete<T>(
      path,
      data: data,
      options: Options(extra: {'excludeAuth': excludeAuth}),
    );
  }

  Future<Response<T>> postMultipart<T>(
    String path, {
    required Map<String, String> fields,
    required List<MultipartFilePart> files,
    bool excludeAuth = false,
  }) {
    final formData = FormData();
    for (final entry in fields.entries) {
      formData.fields.add(MapEntry(entry.key, entry.value));
    }
    for (final file in files) {
      formData.files.add(MapEntry(file.fieldName, file.file));
    }

    return _dio.post<T>(
      path,
      data: formData,
      options: Options(extra: {'excludeAuth': excludeAuth}),
    );
  }
}

class MultipartFilePart {
  const MultipartFilePart({required this.fieldName, required this.file});

  final String fieldName;
  final MultipartFile file;
}
