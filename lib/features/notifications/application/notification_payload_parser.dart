import '../../core_api/domain/models/domain_models.dart';

class NotificationPayloadParser {
  const NotificationPayloadParser._();

  static NotificationData parse({
    required Map<String, dynamic> data,
    String? title,
    String? body,
  }) {
    final metadata = _readMetadata(data['metadata']);
    return NotificationData(
      type: _readString(data, const ['type', 'notification_type'],
          fallback: 'GENERAL'),
      title:
          _readString(data, const ['title'], fallback: title ?? 'Notification'),
      message:
          _readString(data, const ['message', 'body'], fallback: body ?? ''),
      imageUrl: _readNullableString(data, const ['image_url', 'imageUrl']),
      actionUrl: _readNullableString(data, const ['action_url', 'actionUrl']),
      orderId: _readNullableString(data, const ['order_id', 'orderId']),
      productId: _readNullableString(data, const ['product_id', 'productId']),
      shopId: _readNullableString(data, const ['shop_id', 'shopId']),
      code: _readNullableString(data, const ['code']),
      deepLink: _readNullableString(
          data, const ['deep_link', 'deepLink', 'deeplink']),
      metadata: metadata,
    );
  }

  static String _readString(
    Map<String, dynamic> data,
    List<String> keys, {
    required String fallback,
  }) {
    for (final key in keys) {
      final value = data[key];
      if (value is String && value.trim().isNotEmpty) {
        return value;
      }
    }
    return fallback;
  }

  static String? _readNullableString(
      Map<String, dynamic> data, List<String> keys) {
    for (final key in keys) {
      final value = data[key];
      if (value is String && value.trim().isNotEmpty) {
        return value;
      }
    }
    return null;
  }

  static Map<String, String>? _readMetadata(dynamic raw) {
    if (raw is Map) {
      return raw.map(
          (key, value) => MapEntry(key.toString(), value?.toString() ?? ''));
    }
    return null;
  }
}
