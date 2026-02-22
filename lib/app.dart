import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/error/error_boundary.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'features/notifications/application/notification_providers.dart';
import 'features/session/application/session_providers.dart';
import 'features/session/domain/session_state.dart';

class BantucartApp extends ConsumerStatefulWidget {
  const BantucartApp({super.key});

  @override
  ConsumerState<BantucartApp> createState() => _BantucartAppState();
}

class _BantucartAppState extends ConsumerState<BantucartApp> {
  bool _notificationInitialized = false;

  @override
  Widget build(BuildContext context) {
    final router = ref.watch(appRouterProvider);
    final sessionAsync = ref.watch(sessionControllerProvider);
    final notificationService = ref.read(notificationLifecycleServiceProvider);

    ref.listen<AsyncValue<SessionState>>(sessionControllerProvider,
        (previous, next) {
      final isAuthenticated = next.valueOrNull?.isAuthenticated ?? false;
      notificationService.syncAuthentication(isAuthenticated);
    });

    ref.listen<String?>(notificationRouteProvider, (previous, next) {
      if (next == null || next.isEmpty) {
        return;
      }
      router.go(next);
      ref.read(notificationRouteProvider.notifier).state = null;
    });

    if (!_notificationInitialized) {
      _notificationInitialized = true;
      Future<void>.microtask(() async {
        await notificationService.initialize(
          isAuthenticated: sessionAsync.valueOrNull?.isAuthenticated ?? false,
          onRouteResolved: (route) {
            ref.read(notificationRouteProvider.notifier).state = route;
          },
        );
      });
    }

    return ErrorBoundary(
      child: MaterialApp.router(
        title: 'Bantucart',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        routerConfig: router,
      ),
    );
  }
}
