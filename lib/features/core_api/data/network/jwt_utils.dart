import 'dart:convert';

class JwtUtils {
  const JwtUtils._();

  static bool isExpired(String? token, {DateTime? now}) {
    if (token == null || token.isEmpty) {
      return true;
    }

    final parts = token.split('.');
    if (parts.length != 3) {
      return true;
    }

    try {
      final payloadBytes = base64Url.decode(base64Url.normalize(parts[1]));
      final payload =
          json.decode(utf8.decode(payloadBytes)) as Map<String, dynamic>;
      final exp = payload['exp'];
      if (exp is! num) {
        return true;
      }
      final expiry =
          DateTime.fromMillisecondsSinceEpoch(exp.toInt() * 1000, isUtc: true);
      final checkTime = (now ?? DateTime.now()).toUtc();
      return !checkTime.isBefore(expiry);
    } catch (_) {
      return true;
    }
  }
}
