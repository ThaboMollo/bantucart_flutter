import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart';

class CachedUsers extends Table {
  TextColumn get id => text()();
  TextColumn get username => text()();
  TextColumn get firstName => text().named('first_name')();
  TextColumn get lastName => text().named('last_name')();
  TextColumn get email => text()();
  TextColumn get groupName => text().named('group_name')();
  TextColumn get profileImg =>
      text().named('profile_img').withDefault(const Constant(''))();
  TextColumn get bio => text().withDefault(const Constant(''))();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class CachedTokens extends Table {
  IntColumn get id => integer()();
  TextColumn get access => text()();
  TextColumn get refresh => text()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class CachedAddresses extends Table {
  TextColumn get id => text()();
  TextColumn get label => text().nullable()();
  TextColumn get street => text().nullable()();
  TextColumn get suburb => text().nullable()();
  TextColumn get postalCode => text().named('postal_code').nullable()();
  TextColumn get city => text().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class CachedCarts extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get userId => text().named('user_id')();
  BoolColumn get isCheckedOut =>
      boolean().named('is_checked_out').withDefault(const Constant(false))();
  TextColumn get orderStatus => text().named('order_status')();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class CachedCartItems extends Table {
  TextColumn get id => text()();
  TextColumn get cartId =>
      text().named('cart_id').references(CachedCarts, #id)();
  TextColumn get productId => text().named('product_id')();
  IntColumn get qty => integer()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'bantucart_local.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}

@DriftDatabase(
  tables: [
    CachedUsers,
    CachedTokens,
    CachedAddresses,
    CachedCarts,
    CachedCartItems,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;
}
