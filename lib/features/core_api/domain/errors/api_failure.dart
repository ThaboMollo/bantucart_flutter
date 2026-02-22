import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_failure.freezed.dart';

@freezed
class ApiFailure with _$ApiFailure {
  const factory ApiFailure.network(String message) = _Network;
  const factory ApiFailure.unauthorized(String message) = _Unauthorized;
  const factory ApiFailure.forbidden(String message) = _Forbidden;
  const factory ApiFailure.notFound(String message) = _NotFound;
  const factory ApiFailure.badRequest(String message) = _BadRequest;
  const factory ApiFailure.server(String message) = _Server;
  const factory ApiFailure.unknown(String message) = _Unknown;
}
