import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import '../logging/app_logger.dart';
import 'app_env.dart';

class AppConfig {
  AppConfig._();

  static final AppEnv env = AppEnvX.fromString(
    const String.fromEnvironment('APP_ENV', defaultValue: 'dev'),
  );

  static const String apiBaseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'https://api-dev.bantucart.com/',
  );

  static const bool enableAnalytics = bool.fromEnvironment(
    'ENABLE_ANALYTICS',
    defaultValue: false,
  );

  static const bool enableCrashlytics = bool.fromEnvironment(
    'ENABLE_CRASHLYTICS',
    defaultValue: false,
  );

  static Future<void> initializeFirebase() async {
    try {
      await Firebase.initializeApp();

      if (enableCrashlytics) {
        await FirebaseCrashlytics.instance
            .setCrashlyticsCollectionEnabled(true);
      }

      if (enableAnalytics) {
        await FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);
      }

      AppLogger.info('Firebase initialized for ${env.name}');
    } catch (error, stack) {
      // Keep app boot resilient even if Firebase is missing/not configured yet.
      AppLogger.warn('Firebase init skipped: $error', stack);
    }
  }
}
