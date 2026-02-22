import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core_api/domain/repositories/repository_providers.dart';
import '../../notifications/application/notification_providers.dart';
import '../data/local/app_database.dart';
import '../data/local/local_cache_repository.dart';
import '../domain/session_state.dart';
import 'session_service.dart';

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
});

final localCacheRepositoryProvider = Provider<LocalCacheRepository>((ref) {
  return LocalCacheRepository(ref.watch(appDatabaseProvider));
});

final sessionServiceProvider = Provider<SessionService>((ref) {
  return SessionService(
    tokenStore: ref.watch(authTokenStoreProvider),
    authRepository: ref.watch(authRepositoryProvider),
    cache: ref.watch(localCacheRepositoryProvider),
  );
});

final logoutServiceProvider = Provider<LogoutService>((ref) {
  return LogoutService(
    tokenStore: ref.watch(authTokenStoreProvider),
    cache: ref.watch(localCacheRepositoryProvider),
  );
});

final sessionControllerProvider =
    AsyncNotifierProvider<SessionController, SessionState>(
        SessionController.new);

class SessionController extends AsyncNotifier<SessionState> {
  @override
  Future<SessionState> build() async {
    final service = ref.watch(sessionServiceProvider);
    return service.bootstrap();
  }

  Future<void> refreshSession() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
        () => ref.read(sessionServiceProvider).bootstrap());
  }

  Future<void> logout() async {
    await ref.read(notificationLifecycleServiceProvider).unregisterOnLogout();
    await ref.read(logoutServiceProvider).clearSession();
    state = const AsyncData(SessionState.unauthenticated);
  }

  void markAuthenticated({required String userId, required String role}) {
    state = AsyncData(
      SessionState(
          status: SessionStatus.authenticated, userId: userId, role: role),
    );
  }
}
