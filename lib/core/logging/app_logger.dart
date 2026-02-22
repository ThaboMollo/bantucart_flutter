import 'package:flutter/foundation.dart';

class AppLogger {
  AppLogger._();

  static void info(String message) {
    debugPrint('[INFO] $message');
  }

  static void warn(String message, [StackTrace? stack]) {
    debugPrint('[WARN] $message');
    if (stack != null) {
      debugPrint(stack.toString());
    }
  }

  static void error(String message, Object error, [StackTrace? stack]) {
    debugPrint('[ERROR] $message');
    debugPrint('  error: $error');
    if (stack != null) {
      debugPrint(stack.toString());
    }
  }
}
