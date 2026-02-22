import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'core/config/app_config.dart';
import 'core/logging/app_logger.dart';

Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppConfig.initializeFirebase();

  FlutterError.onError = (details) {
    AppLogger.error(
        'Flutter framework error', details.exception, details.stack);
  };

  runZonedGuarded(
    () => runApp(const ProviderScope(child: BantucartApp())),
    (error, stack) => AppLogger.error('Uncaught zone error', error, stack),
  );
}
