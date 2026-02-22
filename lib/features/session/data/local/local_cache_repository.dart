import 'package:drift/drift.dart' as drift;

import '../../../core_api/domain/models/domain_models.dart';
import 'app_database.dart';

class LocalCacheRepository {
  LocalCacheRepository(this._db);

  final AppDatabase _db;

  Future<void> saveUser(User user) async {
    await _db.into(_db.cachedUsers).insertOnConflictUpdate(
          CachedUsersCompanion(
            id: drift.Value(user.id),
            username: drift.Value(user.username),
            firstName: drift.Value(user.firstName),
            lastName: drift.Value(user.lastName),
            email: drift.Value(user.email),
            groupName: drift.Value(user.group),
            profileImg: drift.Value(user.profileImg),
            bio: drift.Value(user.bio),
          ),
        );
  }

  Future<User?> getUser() async {
    final row = await (_db.select(_db.cachedUsers)..limit(1)).getSingleOrNull();
    if (row == null) {
      return null;
    }

    return User(
      id: row.id,
      username: row.username,
      firstName: row.firstName,
      lastName: row.lastName,
      email: row.email,
      group: row.groupName,
      profileImg: row.profileImg,
      bio: row.bio,
    );
  }

  Future<void> saveCarts(List<Cart> carts) async {
    await _db.transaction(() async {
      await _db.delete(_db.cachedCartItems).go();
      await _db.delete(_db.cachedCarts).go();

      for (final cart in carts) {
        await _db.into(_db.cachedCarts).insert(
              CachedCartsCompanion.insert(
                id: cart.id,
                title: cart.title,
                userId: cart.user,
                orderStatus: cart.orderStatus,
                isCheckedOut: drift.Value(cart.isCheckedOut),
              ),
            );

        for (final item in cart.items) {
          await _db.into(_db.cachedCartItems).insert(
                CachedCartItemsCompanion.insert(
                  id: item.id,
                  cartId: cart.id,
                  productId: item.product.id,
                  qty: item.qty,
                ),
              );
        }
      }
    });
  }

  Future<List<CachedCart>> getCachedCarts() =>
      _db.select(_db.cachedCarts).get();

  Future<void> clearAll() async {
    await _db.transaction(() async {
      await _db.delete(_db.cachedCartItems).go();
      await _db.delete(_db.cachedCarts).go();
      await _db.delete(_db.cachedAddresses).go();
      await _db.delete(_db.cachedUsers).go();
      await _db.delete(_db.cachedTokens).go();
    });
  }
}
