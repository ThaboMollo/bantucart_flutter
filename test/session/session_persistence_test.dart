import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:bantucart/features/core_api/data/network/auth_token_store.dart';
import 'package:bantucart/features/core_api/domain/models/domain_models.dart';
import 'package:bantucart/features/core_api/domain/repositories/repositories.dart';
import 'package:bantucart/features/session/application/session_service.dart';
import 'package:bantucart/features/session/data/local/app_database.dart';
import 'package:bantucart/features/session/data/local/local_cache_repository.dart';

class InMemoryTokenStore implements AuthTokenStore {
  InMemoryTokenStore({this.access, this.refresh});

  String? access;
  String? refresh;

  @override
  Future<void> clear() async {
    access = null;
    refresh = null;
  }

  @override
  Future<String?> getAccessToken() async => access;

  @override
  Future<String?> getRefreshToken() async => refresh;

  @override
  Future<void> saveTokens(
      {required String access, required String refresh}) async {
    this.access = access;
    this.refresh = refresh;
  }

  @override
  Future<void> updateAccessToken(String access) async {
    this.access = access;
  }
}

class FakeAuthRepository implements AuthRepository {
  FakeAuthRepository(this.payload);

  final Map<String, dynamic> payload;

  @override
  Future forgotPassword(Map<String, dynamic> body) async => {};

  @override
  Future login(Map<String, dynamic> body) async => {};

  @override
  Future register(String group, Map<String, dynamic> body) async => {};

  @override
  Future syncUser() async => payload;
}

void main() {
  test(
      'session bootstrap loads authenticated user and logout clears cache/tokens',
      () async {
    final db = AppDatabase(NativeDatabase.memory());
    final cache = LocalCacheRepository(db);
    final tokenStore =
        InMemoryTokenStore(access: 'access-token', refresh: 'refresh-token');
    final authRepo = FakeAuthRepository({
      'id': 'u1',
      'username': 'demo',
      'first_name': 'Demo',
      'last_name': 'User',
      'email': 'demo@example.com',
      'groups': [
        {'name': 'user'}
      ],
      'profile_img': '',
      'bio': '',
    });

    final service = SessionService(
      tokenStore: tokenStore,
      authRepository: authRepo,
      cache: cache,
    );

    final session = await service.bootstrap();
    expect(session.isAuthenticated, isTrue);
    expect(session.role, 'user');

    final savedUser = await cache.getUser();
    expect(savedUser?.id, 'u1');

    await cache.saveCarts([
      const Cart(
        id: 'c1',
        title: 'cart',
        user: 'u1',
        orderStatus: 'pending',
        shop: 's1',
        items: [],
      ),
    ]);
    expect((await cache.getCachedCarts()).length, 1);

    final logoutService = LogoutService(tokenStore: tokenStore, cache: cache);
    await logoutService.clearSession();

    expect(await tokenStore.getAccessToken(), isNull);
    expect(await cache.getUser(), isNull);
    expect((await cache.getCachedCarts()).length, 0);

    await db.close();
  });
}
