import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core_api/data/network/auth_token_store.dart';
import '../../core_api/domain/models/domain_models.dart';
import '../../core_api/domain/repositories/repositories.dart';
import '../../core_api/domain/repositories/repository_providers.dart';
import '../../session/application/session_providers.dart';
import '../../session/data/local/local_cache_repository.dart';
import 'auth_form_state.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, AuthFormState>((ref) {
  return AuthController(
    ref: ref,
    authRepository: ref.watch(authRepositoryProvider),
    tokenStore: ref.watch(authTokenStoreProvider),
    cache: ref.watch(localCacheRepositoryProvider),
  );
});

class AuthController extends StateNotifier<AuthFormState> {
  AuthController({
    required Ref ref,
    required AuthRepository authRepository,
    required AuthTokenStore tokenStore,
    required LocalCacheRepository cache,
  })  : _ref = ref,
        _authRepository = authRepository,
        _tokenStore = tokenStore,
        _cache = cache,
        super(const AuthFormState());

  final Ref _ref;
  final AuthRepository _authRepository;
  final AuthTokenStore _tokenStore;
  final LocalCacheRepository _cache;

  Future<bool> login({required String email, required String password}) async {
    state = state.copyWith(loading: true, clearError: true, clearMessage: true);
    try {
      final response =
          await _authRepository.login({'email': email, 'password': password})
              as Map<String, dynamic>;

      final access = response['access']?.toString() ?? '';
      final refresh = response['refresh']?.toString() ?? '';
      final userJson = response['user'] as Map<String, dynamic>?;
      if (access.isEmpty || refresh.isEmpty || userJson == null) {
        state = state.copyWith(loading: false, error: 'Invalid login response');
        return false;
      }

      final user = _normalizeUser(userJson);
      await _tokenStore.saveTokens(access: access, refresh: refresh);
      await _cache.saveUser(user);
      _ref
          .read(sessionControllerProvider.notifier)
          .markAuthenticated(userId: user.id, role: user.group);
      state = state.copyWith(loading: false, message: 'Login successful');
      return true;
    } catch (e) {
      state = state.copyWith(loading: false, error: e.toString());
      return false;
    }
  }

  Future<bool> register(
      {required String group, required Map<String, dynamic> payload}) async {
    state = state.copyWith(loading: true, clearError: true, clearMessage: true);
    try {
      await _authRepository.register(group, payload);
      state = state.copyWith(loading: false, message: 'Registration submitted');
      return true;
    } catch (e) {
      state = state.copyWith(loading: false, error: e.toString());
      return false;
    }
  }

  Future<bool> forgotPassword(String email) async {
    state = state.copyWith(loading: true, clearError: true, clearMessage: true);
    try {
      await _authRepository.forgotPassword({'email': email});
      state = state.copyWith(
          loading: false, message: 'If account exists, reset email was sent');
      return true;
    } catch (_) {
      // Android parity: still report success for privacy.
      state = state.copyWith(
          loading: false, message: 'If account exists, reset email was sent');
      return true;
    }
  }

  User _normalizeUser(Map<String, dynamic> json) {
    var group = json['group']?.toString() ?? 'user';
    final groups = json['groups'];
    if (groups is List && groups.isNotEmpty) {
      final first = groups.first;
      if (first is Map<String, dynamic> && first['name'] is String) {
        group = first['name'] as String;
      }
    }

    return User(
      id: json['id']?.toString() ?? '',
      username: json['username']?.toString() ?? '',
      firstName: json['first_name']?.toString() ?? '',
      lastName: json['last_name']?.toString() ?? '',
      email: json['email']?.toString() ?? '',
      group: group,
      profileImg: json['profile_img']?.toString() ?? '',
      bio: json['bio']?.toString() ?? '',
    );
  }
}
