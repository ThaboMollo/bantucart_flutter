import '../../core_api/data/network/auth_token_store.dart';
import '../../core_api/domain/models/domain_models.dart';
import '../../core_api/domain/repositories/repositories.dart';
import '../data/local/local_cache_repository.dart';
import '../domain/session_state.dart';

class SessionService {
  SessionService({
    required AuthTokenStore tokenStore,
    required AuthRepository authRepository,
    required LocalCacheRepository cache,
  })  : _tokenStore = tokenStore,
        _authRepository = authRepository,
        _cache = cache;

  final AuthTokenStore _tokenStore;
  final AuthRepository _authRepository;
  final LocalCacheRepository _cache;

  Future<SessionState> bootstrap() async {
    final access = await _tokenStore.getAccessToken();
    if (access == null || access.isEmpty) {
      return SessionState.unauthenticated;
    }

    final cachedUser = await _cache.getUser();
    if (cachedUser != null) {
      return SessionState(
        status: SessionStatus.authenticated,
        userId: cachedUser.id,
        role: cachedUser.group,
      );
    }

    try {
      final payload = await _authRepository.syncUser() as Map<String, dynamic>;
      final user = _extractUser(payload);
      await _cache.saveUser(user);
      return SessionState(
        status: SessionStatus.authenticated,
        userId: user.id,
        role: user.group,
      );
    } catch (_) {
      return SessionState.unauthenticated;
    }
  }

  User _extractUser(Map<String, dynamic> payload) {
    final groups = payload['groups'];
    var role = payload['group']?.toString() ?? 'user';
    if (groups is List && groups.isNotEmpty) {
      final first = groups.first;
      if (first is Map<String, dynamic> && first['name'] is String) {
        role = first['name'] as String;
      }
    }

    return User(
      id: payload['id']?.toString() ?? '',
      username: payload['username']?.toString() ?? '',
      firstName: payload['first_name']?.toString() ?? '',
      lastName: payload['last_name']?.toString() ?? '',
      email: payload['email']?.toString() ?? '',
      group: role,
      profileImg: payload['profile_img']?.toString() ?? '',
      bio: payload['bio']?.toString() ?? '',
    );
  }
}

class LogoutService {
  LogoutService({
    required AuthTokenStore tokenStore,
    required LocalCacheRepository cache,
  })  : _tokenStore = tokenStore,
        _cache = cache;

  final AuthTokenStore _tokenStore;
  final LocalCacheRepository _cache;

  Future<void> clearSession() async {
    await _tokenStore.clear();
    await _cache.clearAll();
  }
}
