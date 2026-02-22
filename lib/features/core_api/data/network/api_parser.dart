import 'dart:convert';

import 'package:dio/dio.dart';

import '../../domain/errors/api_failure.dart';
import '../../domain/models/paginated_response.dart';

class ApiParser {
  const ApiParser._();

  static Map<String, dynamic> parseObject(String source) =>
      json.decode(source) as Map<String, dynamic>;

  static List<dynamic> parseList(String source) =>
      json.decode(source) as List<dynamic>;

  static PaginatedResponse<T> parsePaginated<T>(
    String source,
    T Function(Map<String, dynamic> json) fromJson,
  ) {
    final map = parseObject(source);
    return PaginatedResponse<T>.fromJson(
      map,
      (value) => fromJson(value as Map<String, dynamic>),
    );
  }

  static ApiFailure mapDioError(DioException error) {
    if (error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.sendTimeout ||
        error.type == DioExceptionType.receiveTimeout ||
        error.type == DioExceptionType.connectionError) {
      return const ApiFailure.network('Network request failed');
    }

    final statusCode = error.response?.statusCode;
    final message = _extractMessage(error.response?.data) ??
        error.message ??
        'Unknown error';

    switch (statusCode) {
      case 400:
        return ApiFailure.badRequest('Bad Request: $message');
      case 401:
        return ApiFailure.unauthorized('Unauthorized: $message');
      case 403:
        return ApiFailure.forbidden('Forbidden: $message');
      case 404:
        return ApiFailure.notFound('Not Found: $message');
      case 500:
        return ApiFailure.server('Server Error: $message');
      default:
        return ApiFailure.unknown('Error ${statusCode ?? 'unknown'}: $message');
    }
  }

  static String? _extractMessage(dynamic data) {
    if (data is String) {
      try {
        return _extractMessage(parseObject(data));
      } catch (_) {
        return data;
      }
    }

    if (data is! Map<String, dynamic>) {
      return null;
    }

    final direct = data['detail'] ?? data['message'] ?? data['error'];
    if (direct is String && direct.isNotEmpty) {
      return direct;
    }

    final entries = <String>[];
    data.forEach((key, value) {
      if (value is List) {
        for (final item in value) {
          entries.add('$key: $item');
        }
      } else {
        entries.add('$key: $value');
      }
    });
    return entries.isEmpty ? null : entries.join(', ');
  }
}
