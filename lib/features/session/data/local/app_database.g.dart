// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $CachedUsersTable extends CachedUsers
    with TableInfo<$CachedUsersTable, CachedUser> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedUsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _usernameMeta =
      const VerificationMeta('username');
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
      'username', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _firstNameMeta =
      const VerificationMeta('firstName');
  @override
  late final GeneratedColumn<String> firstName = GeneratedColumn<String>(
      'first_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _lastNameMeta =
      const VerificationMeta('lastName');
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
      'last_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _groupNameMeta =
      const VerificationMeta('groupName');
  @override
  late final GeneratedColumn<String> groupName = GeneratedColumn<String>(
      'group_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _profileImgMeta =
      const VerificationMeta('profileImg');
  @override
  late final GeneratedColumn<String> profileImg = GeneratedColumn<String>(
      'profile_img', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _bioMeta = const VerificationMeta('bio');
  @override
  late final GeneratedColumn<String> bio = GeneratedColumn<String>(
      'bio', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  @override
  List<GeneratedColumn> get $columns =>
      [id, username, firstName, lastName, email, groupName, profileImg, bio];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_users';
  @override
  VerificationContext validateIntegrity(Insertable<CachedUser> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('username')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['username']!, _usernameMeta));
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('first_name')) {
      context.handle(_firstNameMeta,
          firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta));
    } else if (isInserting) {
      context.missing(_firstNameMeta);
    }
    if (data.containsKey('last_name')) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta));
    } else if (isInserting) {
      context.missing(_lastNameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('group_name')) {
      context.handle(_groupNameMeta,
          groupName.isAcceptableOrUnknown(data['group_name']!, _groupNameMeta));
    } else if (isInserting) {
      context.missing(_groupNameMeta);
    }
    if (data.containsKey('profile_img')) {
      context.handle(
          _profileImgMeta,
          profileImg.isAcceptableOrUnknown(
              data['profile_img']!, _profileImgMeta));
    }
    if (data.containsKey('bio')) {
      context.handle(
          _bioMeta, bio.isAcceptableOrUnknown(data['bio']!, _bioMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CachedUser map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedUser(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      username: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}username'])!,
      firstName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}first_name'])!,
      lastName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_name'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      groupName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}group_name'])!,
      profileImg: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}profile_img'])!,
      bio: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}bio'])!,
    );
  }

  @override
  $CachedUsersTable createAlias(String alias) {
    return $CachedUsersTable(attachedDatabase, alias);
  }
}

class CachedUser extends DataClass implements Insertable<CachedUser> {
  final String id;
  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final String groupName;
  final String profileImg;
  final String bio;
  const CachedUser(
      {required this.id,
      required this.username,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.groupName,
      required this.profileImg,
      required this.bio});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['username'] = Variable<String>(username);
    map['first_name'] = Variable<String>(firstName);
    map['last_name'] = Variable<String>(lastName);
    map['email'] = Variable<String>(email);
    map['group_name'] = Variable<String>(groupName);
    map['profile_img'] = Variable<String>(profileImg);
    map['bio'] = Variable<String>(bio);
    return map;
  }

  CachedUsersCompanion toCompanion(bool nullToAbsent) {
    return CachedUsersCompanion(
      id: Value(id),
      username: Value(username),
      firstName: Value(firstName),
      lastName: Value(lastName),
      email: Value(email),
      groupName: Value(groupName),
      profileImg: Value(profileImg),
      bio: Value(bio),
    );
  }

  factory CachedUser.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedUser(
      id: serializer.fromJson<String>(json['id']),
      username: serializer.fromJson<String>(json['username']),
      firstName: serializer.fromJson<String>(json['firstName']),
      lastName: serializer.fromJson<String>(json['lastName']),
      email: serializer.fromJson<String>(json['email']),
      groupName: serializer.fromJson<String>(json['groupName']),
      profileImg: serializer.fromJson<String>(json['profileImg']),
      bio: serializer.fromJson<String>(json['bio']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'username': serializer.toJson<String>(username),
      'firstName': serializer.toJson<String>(firstName),
      'lastName': serializer.toJson<String>(lastName),
      'email': serializer.toJson<String>(email),
      'groupName': serializer.toJson<String>(groupName),
      'profileImg': serializer.toJson<String>(profileImg),
      'bio': serializer.toJson<String>(bio),
    };
  }

  CachedUser copyWith(
          {String? id,
          String? username,
          String? firstName,
          String? lastName,
          String? email,
          String? groupName,
          String? profileImg,
          String? bio}) =>
      CachedUser(
        id: id ?? this.id,
        username: username ?? this.username,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        groupName: groupName ?? this.groupName,
        profileImg: profileImg ?? this.profileImg,
        bio: bio ?? this.bio,
      );
  CachedUser copyWithCompanion(CachedUsersCompanion data) {
    return CachedUser(
      id: data.id.present ? data.id.value : this.id,
      username: data.username.present ? data.username.value : this.username,
      firstName: data.firstName.present ? data.firstName.value : this.firstName,
      lastName: data.lastName.present ? data.lastName.value : this.lastName,
      email: data.email.present ? data.email.value : this.email,
      groupName: data.groupName.present ? data.groupName.value : this.groupName,
      profileImg:
          data.profileImg.present ? data.profileImg.value : this.profileImg,
      bio: data.bio.present ? data.bio.value : this.bio,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedUser(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('email: $email, ')
          ..write('groupName: $groupName, ')
          ..write('profileImg: $profileImg, ')
          ..write('bio: $bio')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, username, firstName, lastName, email, groupName, profileImg, bio);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedUser &&
          other.id == this.id &&
          other.username == this.username &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName &&
          other.email == this.email &&
          other.groupName == this.groupName &&
          other.profileImg == this.profileImg &&
          other.bio == this.bio);
}

class CachedUsersCompanion extends UpdateCompanion<CachedUser> {
  final Value<String> id;
  final Value<String> username;
  final Value<String> firstName;
  final Value<String> lastName;
  final Value<String> email;
  final Value<String> groupName;
  final Value<String> profileImg;
  final Value<String> bio;
  final Value<int> rowid;
  const CachedUsersCompanion({
    this.id = const Value.absent(),
    this.username = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.email = const Value.absent(),
    this.groupName = const Value.absent(),
    this.profileImg = const Value.absent(),
    this.bio = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CachedUsersCompanion.insert({
    required String id,
    required String username,
    required String firstName,
    required String lastName,
    required String email,
    required String groupName,
    this.profileImg = const Value.absent(),
    this.bio = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        username = Value(username),
        firstName = Value(firstName),
        lastName = Value(lastName),
        email = Value(email),
        groupName = Value(groupName);
  static Insertable<CachedUser> custom({
    Expression<String>? id,
    Expression<String>? username,
    Expression<String>? firstName,
    Expression<String>? lastName,
    Expression<String>? email,
    Expression<String>? groupName,
    Expression<String>? profileImg,
    Expression<String>? bio,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (username != null) 'username': username,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (email != null) 'email': email,
      if (groupName != null) 'group_name': groupName,
      if (profileImg != null) 'profile_img': profileImg,
      if (bio != null) 'bio': bio,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CachedUsersCompanion copyWith(
      {Value<String>? id,
      Value<String>? username,
      Value<String>? firstName,
      Value<String>? lastName,
      Value<String>? email,
      Value<String>? groupName,
      Value<String>? profileImg,
      Value<String>? bio,
      Value<int>? rowid}) {
    return CachedUsersCompanion(
      id: id ?? this.id,
      username: username ?? this.username,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      groupName: groupName ?? this.groupName,
      profileImg: profileImg ?? this.profileImg,
      bio: bio ?? this.bio,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (groupName.present) {
      map['group_name'] = Variable<String>(groupName.value);
    }
    if (profileImg.present) {
      map['profile_img'] = Variable<String>(profileImg.value);
    }
    if (bio.present) {
      map['bio'] = Variable<String>(bio.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedUsersCompanion(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('email: $email, ')
          ..write('groupName: $groupName, ')
          ..write('profileImg: $profileImg, ')
          ..write('bio: $bio, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CachedTokensTable extends CachedTokens
    with TableInfo<$CachedTokensTable, CachedToken> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedTokensTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _accessMeta = const VerificationMeta('access');
  @override
  late final GeneratedColumn<String> access = GeneratedColumn<String>(
      'access', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _refreshMeta =
      const VerificationMeta('refresh');
  @override
  late final GeneratedColumn<String> refresh = GeneratedColumn<String>(
      'refresh', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, access, refresh];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_tokens';
  @override
  VerificationContext validateIntegrity(Insertable<CachedToken> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('access')) {
      context.handle(_accessMeta,
          access.isAcceptableOrUnknown(data['access']!, _accessMeta));
    } else if (isInserting) {
      context.missing(_accessMeta);
    }
    if (data.containsKey('refresh')) {
      context.handle(_refreshMeta,
          refresh.isAcceptableOrUnknown(data['refresh']!, _refreshMeta));
    } else if (isInserting) {
      context.missing(_refreshMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CachedToken map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedToken(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      access: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}access'])!,
      refresh: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}refresh'])!,
    );
  }

  @override
  $CachedTokensTable createAlias(String alias) {
    return $CachedTokensTable(attachedDatabase, alias);
  }
}

class CachedToken extends DataClass implements Insertable<CachedToken> {
  final int id;
  final String access;
  final String refresh;
  const CachedToken(
      {required this.id, required this.access, required this.refresh});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['access'] = Variable<String>(access);
    map['refresh'] = Variable<String>(refresh);
    return map;
  }

  CachedTokensCompanion toCompanion(bool nullToAbsent) {
    return CachedTokensCompanion(
      id: Value(id),
      access: Value(access),
      refresh: Value(refresh),
    );
  }

  factory CachedToken.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedToken(
      id: serializer.fromJson<int>(json['id']),
      access: serializer.fromJson<String>(json['access']),
      refresh: serializer.fromJson<String>(json['refresh']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'access': serializer.toJson<String>(access),
      'refresh': serializer.toJson<String>(refresh),
    };
  }

  CachedToken copyWith({int? id, String? access, String? refresh}) =>
      CachedToken(
        id: id ?? this.id,
        access: access ?? this.access,
        refresh: refresh ?? this.refresh,
      );
  CachedToken copyWithCompanion(CachedTokensCompanion data) {
    return CachedToken(
      id: data.id.present ? data.id.value : this.id,
      access: data.access.present ? data.access.value : this.access,
      refresh: data.refresh.present ? data.refresh.value : this.refresh,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedToken(')
          ..write('id: $id, ')
          ..write('access: $access, ')
          ..write('refresh: $refresh')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, access, refresh);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedToken &&
          other.id == this.id &&
          other.access == this.access &&
          other.refresh == this.refresh);
}

class CachedTokensCompanion extends UpdateCompanion<CachedToken> {
  final Value<int> id;
  final Value<String> access;
  final Value<String> refresh;
  const CachedTokensCompanion({
    this.id = const Value.absent(),
    this.access = const Value.absent(),
    this.refresh = const Value.absent(),
  });
  CachedTokensCompanion.insert({
    this.id = const Value.absent(),
    required String access,
    required String refresh,
  })  : access = Value(access),
        refresh = Value(refresh);
  static Insertable<CachedToken> custom({
    Expression<int>? id,
    Expression<String>? access,
    Expression<String>? refresh,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (access != null) 'access': access,
      if (refresh != null) 'refresh': refresh,
    });
  }

  CachedTokensCompanion copyWith(
      {Value<int>? id, Value<String>? access, Value<String>? refresh}) {
    return CachedTokensCompanion(
      id: id ?? this.id,
      access: access ?? this.access,
      refresh: refresh ?? this.refresh,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (access.present) {
      map['access'] = Variable<String>(access.value);
    }
    if (refresh.present) {
      map['refresh'] = Variable<String>(refresh.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedTokensCompanion(')
          ..write('id: $id, ')
          ..write('access: $access, ')
          ..write('refresh: $refresh')
          ..write(')'))
        .toString();
  }
}

class $CachedAddressesTable extends CachedAddresses
    with TableInfo<$CachedAddressesTable, CachedAddressesData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedAddressesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _labelMeta = const VerificationMeta('label');
  @override
  late final GeneratedColumn<String> label = GeneratedColumn<String>(
      'label', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _streetMeta = const VerificationMeta('street');
  @override
  late final GeneratedColumn<String> street = GeneratedColumn<String>(
      'street', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _suburbMeta = const VerificationMeta('suburb');
  @override
  late final GeneratedColumn<String> suburb = GeneratedColumn<String>(
      'suburb', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _postalCodeMeta =
      const VerificationMeta('postalCode');
  @override
  late final GeneratedColumn<String> postalCode = GeneratedColumn<String>(
      'postal_code', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _cityMeta = const VerificationMeta('city');
  @override
  late final GeneratedColumn<String> city = GeneratedColumn<String>(
      'city', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, label, street, suburb, postalCode, city];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_addresses';
  @override
  VerificationContext validateIntegrity(
      Insertable<CachedAddressesData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('label')) {
      context.handle(
          _labelMeta, label.isAcceptableOrUnknown(data['label']!, _labelMeta));
    }
    if (data.containsKey('street')) {
      context.handle(_streetMeta,
          street.isAcceptableOrUnknown(data['street']!, _streetMeta));
    }
    if (data.containsKey('suburb')) {
      context.handle(_suburbMeta,
          suburb.isAcceptableOrUnknown(data['suburb']!, _suburbMeta));
    }
    if (data.containsKey('postal_code')) {
      context.handle(
          _postalCodeMeta,
          postalCode.isAcceptableOrUnknown(
              data['postal_code']!, _postalCodeMeta));
    }
    if (data.containsKey('city')) {
      context.handle(
          _cityMeta, city.isAcceptableOrUnknown(data['city']!, _cityMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CachedAddressesData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedAddressesData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      label: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}label']),
      street: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}street']),
      suburb: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}suburb']),
      postalCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}postal_code']),
      city: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}city']),
    );
  }

  @override
  $CachedAddressesTable createAlias(String alias) {
    return $CachedAddressesTable(attachedDatabase, alias);
  }
}

class CachedAddressesData extends DataClass
    implements Insertable<CachedAddressesData> {
  final String id;
  final String? label;
  final String? street;
  final String? suburb;
  final String? postalCode;
  final String? city;
  const CachedAddressesData(
      {required this.id,
      this.label,
      this.street,
      this.suburb,
      this.postalCode,
      this.city});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || label != null) {
      map['label'] = Variable<String>(label);
    }
    if (!nullToAbsent || street != null) {
      map['street'] = Variable<String>(street);
    }
    if (!nullToAbsent || suburb != null) {
      map['suburb'] = Variable<String>(suburb);
    }
    if (!nullToAbsent || postalCode != null) {
      map['postal_code'] = Variable<String>(postalCode);
    }
    if (!nullToAbsent || city != null) {
      map['city'] = Variable<String>(city);
    }
    return map;
  }

  CachedAddressesCompanion toCompanion(bool nullToAbsent) {
    return CachedAddressesCompanion(
      id: Value(id),
      label:
          label == null && nullToAbsent ? const Value.absent() : Value(label),
      street:
          street == null && nullToAbsent ? const Value.absent() : Value(street),
      suburb:
          suburb == null && nullToAbsent ? const Value.absent() : Value(suburb),
      postalCode: postalCode == null && nullToAbsent
          ? const Value.absent()
          : Value(postalCode),
      city: city == null && nullToAbsent ? const Value.absent() : Value(city),
    );
  }

  factory CachedAddressesData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedAddressesData(
      id: serializer.fromJson<String>(json['id']),
      label: serializer.fromJson<String?>(json['label']),
      street: serializer.fromJson<String?>(json['street']),
      suburb: serializer.fromJson<String?>(json['suburb']),
      postalCode: serializer.fromJson<String?>(json['postalCode']),
      city: serializer.fromJson<String?>(json['city']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'label': serializer.toJson<String?>(label),
      'street': serializer.toJson<String?>(street),
      'suburb': serializer.toJson<String?>(suburb),
      'postalCode': serializer.toJson<String?>(postalCode),
      'city': serializer.toJson<String?>(city),
    };
  }

  CachedAddressesData copyWith(
          {String? id,
          Value<String?> label = const Value.absent(),
          Value<String?> street = const Value.absent(),
          Value<String?> suburb = const Value.absent(),
          Value<String?> postalCode = const Value.absent(),
          Value<String?> city = const Value.absent()}) =>
      CachedAddressesData(
        id: id ?? this.id,
        label: label.present ? label.value : this.label,
        street: street.present ? street.value : this.street,
        suburb: suburb.present ? suburb.value : this.suburb,
        postalCode: postalCode.present ? postalCode.value : this.postalCode,
        city: city.present ? city.value : this.city,
      );
  CachedAddressesData copyWithCompanion(CachedAddressesCompanion data) {
    return CachedAddressesData(
      id: data.id.present ? data.id.value : this.id,
      label: data.label.present ? data.label.value : this.label,
      street: data.street.present ? data.street.value : this.street,
      suburb: data.suburb.present ? data.suburb.value : this.suburb,
      postalCode:
          data.postalCode.present ? data.postalCode.value : this.postalCode,
      city: data.city.present ? data.city.value : this.city,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedAddressesData(')
          ..write('id: $id, ')
          ..write('label: $label, ')
          ..write('street: $street, ')
          ..write('suburb: $suburb, ')
          ..write('postalCode: $postalCode, ')
          ..write('city: $city')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, label, street, suburb, postalCode, city);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedAddressesData &&
          other.id == this.id &&
          other.label == this.label &&
          other.street == this.street &&
          other.suburb == this.suburb &&
          other.postalCode == this.postalCode &&
          other.city == this.city);
}

class CachedAddressesCompanion extends UpdateCompanion<CachedAddressesData> {
  final Value<String> id;
  final Value<String?> label;
  final Value<String?> street;
  final Value<String?> suburb;
  final Value<String?> postalCode;
  final Value<String?> city;
  final Value<int> rowid;
  const CachedAddressesCompanion({
    this.id = const Value.absent(),
    this.label = const Value.absent(),
    this.street = const Value.absent(),
    this.suburb = const Value.absent(),
    this.postalCode = const Value.absent(),
    this.city = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CachedAddressesCompanion.insert({
    required String id,
    this.label = const Value.absent(),
    this.street = const Value.absent(),
    this.suburb = const Value.absent(),
    this.postalCode = const Value.absent(),
    this.city = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id);
  static Insertable<CachedAddressesData> custom({
    Expression<String>? id,
    Expression<String>? label,
    Expression<String>? street,
    Expression<String>? suburb,
    Expression<String>? postalCode,
    Expression<String>? city,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (label != null) 'label': label,
      if (street != null) 'street': street,
      if (suburb != null) 'suburb': suburb,
      if (postalCode != null) 'postal_code': postalCode,
      if (city != null) 'city': city,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CachedAddressesCompanion copyWith(
      {Value<String>? id,
      Value<String?>? label,
      Value<String?>? street,
      Value<String?>? suburb,
      Value<String?>? postalCode,
      Value<String?>? city,
      Value<int>? rowid}) {
    return CachedAddressesCompanion(
      id: id ?? this.id,
      label: label ?? this.label,
      street: street ?? this.street,
      suburb: suburb ?? this.suburb,
      postalCode: postalCode ?? this.postalCode,
      city: city ?? this.city,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (label.present) {
      map['label'] = Variable<String>(label.value);
    }
    if (street.present) {
      map['street'] = Variable<String>(street.value);
    }
    if (suburb.present) {
      map['suburb'] = Variable<String>(suburb.value);
    }
    if (postalCode.present) {
      map['postal_code'] = Variable<String>(postalCode.value);
    }
    if (city.present) {
      map['city'] = Variable<String>(city.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedAddressesCompanion(')
          ..write('id: $id, ')
          ..write('label: $label, ')
          ..write('street: $street, ')
          ..write('suburb: $suburb, ')
          ..write('postalCode: $postalCode, ')
          ..write('city: $city, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CachedCartsTable extends CachedCarts
    with TableInfo<$CachedCartsTable, CachedCart> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedCartsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isCheckedOutMeta =
      const VerificationMeta('isCheckedOut');
  @override
  late final GeneratedColumn<bool> isCheckedOut = GeneratedColumn<bool>(
      'is_checked_out', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_checked_out" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _orderStatusMeta =
      const VerificationMeta('orderStatus');
  @override
  late final GeneratedColumn<String> orderStatus = GeneratedColumn<String>(
      'order_status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, userId, isCheckedOut, orderStatus];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_carts';
  @override
  VerificationContext validateIntegrity(Insertable<CachedCart> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('is_checked_out')) {
      context.handle(
          _isCheckedOutMeta,
          isCheckedOut.isAcceptableOrUnknown(
              data['is_checked_out']!, _isCheckedOutMeta));
    }
    if (data.containsKey('order_status')) {
      context.handle(
          _orderStatusMeta,
          orderStatus.isAcceptableOrUnknown(
              data['order_status']!, _orderStatusMeta));
    } else if (isInserting) {
      context.missing(_orderStatusMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CachedCart map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedCart(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      isCheckedOut: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_checked_out'])!,
      orderStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}order_status'])!,
    );
  }

  @override
  $CachedCartsTable createAlias(String alias) {
    return $CachedCartsTable(attachedDatabase, alias);
  }
}

class CachedCart extends DataClass implements Insertable<CachedCart> {
  final String id;
  final String title;
  final String userId;
  final bool isCheckedOut;
  final String orderStatus;
  const CachedCart(
      {required this.id,
      required this.title,
      required this.userId,
      required this.isCheckedOut,
      required this.orderStatus});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['user_id'] = Variable<String>(userId);
    map['is_checked_out'] = Variable<bool>(isCheckedOut);
    map['order_status'] = Variable<String>(orderStatus);
    return map;
  }

  CachedCartsCompanion toCompanion(bool nullToAbsent) {
    return CachedCartsCompanion(
      id: Value(id),
      title: Value(title),
      userId: Value(userId),
      isCheckedOut: Value(isCheckedOut),
      orderStatus: Value(orderStatus),
    );
  }

  factory CachedCart.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedCart(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      userId: serializer.fromJson<String>(json['userId']),
      isCheckedOut: serializer.fromJson<bool>(json['isCheckedOut']),
      orderStatus: serializer.fromJson<String>(json['orderStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'userId': serializer.toJson<String>(userId),
      'isCheckedOut': serializer.toJson<bool>(isCheckedOut),
      'orderStatus': serializer.toJson<String>(orderStatus),
    };
  }

  CachedCart copyWith(
          {String? id,
          String? title,
          String? userId,
          bool? isCheckedOut,
          String? orderStatus}) =>
      CachedCart(
        id: id ?? this.id,
        title: title ?? this.title,
        userId: userId ?? this.userId,
        isCheckedOut: isCheckedOut ?? this.isCheckedOut,
        orderStatus: orderStatus ?? this.orderStatus,
      );
  CachedCart copyWithCompanion(CachedCartsCompanion data) {
    return CachedCart(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      userId: data.userId.present ? data.userId.value : this.userId,
      isCheckedOut: data.isCheckedOut.present
          ? data.isCheckedOut.value
          : this.isCheckedOut,
      orderStatus:
          data.orderStatus.present ? data.orderStatus.value : this.orderStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedCart(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('userId: $userId, ')
          ..write('isCheckedOut: $isCheckedOut, ')
          ..write('orderStatus: $orderStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, userId, isCheckedOut, orderStatus);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedCart &&
          other.id == this.id &&
          other.title == this.title &&
          other.userId == this.userId &&
          other.isCheckedOut == this.isCheckedOut &&
          other.orderStatus == this.orderStatus);
}

class CachedCartsCompanion extends UpdateCompanion<CachedCart> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> userId;
  final Value<bool> isCheckedOut;
  final Value<String> orderStatus;
  final Value<int> rowid;
  const CachedCartsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.userId = const Value.absent(),
    this.isCheckedOut = const Value.absent(),
    this.orderStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CachedCartsCompanion.insert({
    required String id,
    required String title,
    required String userId,
    this.isCheckedOut = const Value.absent(),
    required String orderStatus,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title),
        userId = Value(userId),
        orderStatus = Value(orderStatus);
  static Insertable<CachedCart> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? userId,
    Expression<bool>? isCheckedOut,
    Expression<String>? orderStatus,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (userId != null) 'user_id': userId,
      if (isCheckedOut != null) 'is_checked_out': isCheckedOut,
      if (orderStatus != null) 'order_status': orderStatus,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CachedCartsCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<String>? userId,
      Value<bool>? isCheckedOut,
      Value<String>? orderStatus,
      Value<int>? rowid}) {
    return CachedCartsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      userId: userId ?? this.userId,
      isCheckedOut: isCheckedOut ?? this.isCheckedOut,
      orderStatus: orderStatus ?? this.orderStatus,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (isCheckedOut.present) {
      map['is_checked_out'] = Variable<bool>(isCheckedOut.value);
    }
    if (orderStatus.present) {
      map['order_status'] = Variable<String>(orderStatus.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedCartsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('userId: $userId, ')
          ..write('isCheckedOut: $isCheckedOut, ')
          ..write('orderStatus: $orderStatus, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CachedCartItemsTable extends CachedCartItems
    with TableInfo<$CachedCartItemsTable, CachedCartItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedCartItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _cartIdMeta = const VerificationMeta('cartId');
  @override
  late final GeneratedColumn<String> cartId = GeneratedColumn<String>(
      'cart_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES cached_carts (id)'));
  static const VerificationMeta _productIdMeta =
      const VerificationMeta('productId');
  @override
  late final GeneratedColumn<String> productId = GeneratedColumn<String>(
      'product_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _qtyMeta = const VerificationMeta('qty');
  @override
  late final GeneratedColumn<int> qty = GeneratedColumn<int>(
      'qty', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, cartId, productId, qty];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_cart_items';
  @override
  VerificationContext validateIntegrity(Insertable<CachedCartItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('cart_id')) {
      context.handle(_cartIdMeta,
          cartId.isAcceptableOrUnknown(data['cart_id']!, _cartIdMeta));
    } else if (isInserting) {
      context.missing(_cartIdMeta);
    }
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('qty')) {
      context.handle(
          _qtyMeta, qty.isAcceptableOrUnknown(data['qty']!, _qtyMeta));
    } else if (isInserting) {
      context.missing(_qtyMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CachedCartItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedCartItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      cartId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cart_id'])!,
      productId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}product_id'])!,
      qty: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}qty'])!,
    );
  }

  @override
  $CachedCartItemsTable createAlias(String alias) {
    return $CachedCartItemsTable(attachedDatabase, alias);
  }
}

class CachedCartItem extends DataClass implements Insertable<CachedCartItem> {
  final String id;
  final String cartId;
  final String productId;
  final int qty;
  const CachedCartItem(
      {required this.id,
      required this.cartId,
      required this.productId,
      required this.qty});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['cart_id'] = Variable<String>(cartId);
    map['product_id'] = Variable<String>(productId);
    map['qty'] = Variable<int>(qty);
    return map;
  }

  CachedCartItemsCompanion toCompanion(bool nullToAbsent) {
    return CachedCartItemsCompanion(
      id: Value(id),
      cartId: Value(cartId),
      productId: Value(productId),
      qty: Value(qty),
    );
  }

  factory CachedCartItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedCartItem(
      id: serializer.fromJson<String>(json['id']),
      cartId: serializer.fromJson<String>(json['cartId']),
      productId: serializer.fromJson<String>(json['productId']),
      qty: serializer.fromJson<int>(json['qty']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'cartId': serializer.toJson<String>(cartId),
      'productId': serializer.toJson<String>(productId),
      'qty': serializer.toJson<int>(qty),
    };
  }

  CachedCartItem copyWith(
          {String? id, String? cartId, String? productId, int? qty}) =>
      CachedCartItem(
        id: id ?? this.id,
        cartId: cartId ?? this.cartId,
        productId: productId ?? this.productId,
        qty: qty ?? this.qty,
      );
  CachedCartItem copyWithCompanion(CachedCartItemsCompanion data) {
    return CachedCartItem(
      id: data.id.present ? data.id.value : this.id,
      cartId: data.cartId.present ? data.cartId.value : this.cartId,
      productId: data.productId.present ? data.productId.value : this.productId,
      qty: data.qty.present ? data.qty.value : this.qty,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedCartItem(')
          ..write('id: $id, ')
          ..write('cartId: $cartId, ')
          ..write('productId: $productId, ')
          ..write('qty: $qty')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, cartId, productId, qty);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedCartItem &&
          other.id == this.id &&
          other.cartId == this.cartId &&
          other.productId == this.productId &&
          other.qty == this.qty);
}

class CachedCartItemsCompanion extends UpdateCompanion<CachedCartItem> {
  final Value<String> id;
  final Value<String> cartId;
  final Value<String> productId;
  final Value<int> qty;
  final Value<int> rowid;
  const CachedCartItemsCompanion({
    this.id = const Value.absent(),
    this.cartId = const Value.absent(),
    this.productId = const Value.absent(),
    this.qty = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CachedCartItemsCompanion.insert({
    required String id,
    required String cartId,
    required String productId,
    required int qty,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        cartId = Value(cartId),
        productId = Value(productId),
        qty = Value(qty);
  static Insertable<CachedCartItem> custom({
    Expression<String>? id,
    Expression<String>? cartId,
    Expression<String>? productId,
    Expression<int>? qty,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (cartId != null) 'cart_id': cartId,
      if (productId != null) 'product_id': productId,
      if (qty != null) 'qty': qty,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CachedCartItemsCompanion copyWith(
      {Value<String>? id,
      Value<String>? cartId,
      Value<String>? productId,
      Value<int>? qty,
      Value<int>? rowid}) {
    return CachedCartItemsCompanion(
      id: id ?? this.id,
      cartId: cartId ?? this.cartId,
      productId: productId ?? this.productId,
      qty: qty ?? this.qty,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (cartId.present) {
      map['cart_id'] = Variable<String>(cartId.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (qty.present) {
      map['qty'] = Variable<int>(qty.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedCartItemsCompanion(')
          ..write('id: $id, ')
          ..write('cartId: $cartId, ')
          ..write('productId: $productId, ')
          ..write('qty: $qty, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CachedUsersTable cachedUsers = $CachedUsersTable(this);
  late final $CachedTokensTable cachedTokens = $CachedTokensTable(this);
  late final $CachedAddressesTable cachedAddresses =
      $CachedAddressesTable(this);
  late final $CachedCartsTable cachedCarts = $CachedCartsTable(this);
  late final $CachedCartItemsTable cachedCartItems =
      $CachedCartItemsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        cachedUsers,
        cachedTokens,
        cachedAddresses,
        cachedCarts,
        cachedCartItems
      ];
}

typedef $$CachedUsersTableCreateCompanionBuilder = CachedUsersCompanion
    Function({
  required String id,
  required String username,
  required String firstName,
  required String lastName,
  required String email,
  required String groupName,
  Value<String> profileImg,
  Value<String> bio,
  Value<int> rowid,
});
typedef $$CachedUsersTableUpdateCompanionBuilder = CachedUsersCompanion
    Function({
  Value<String> id,
  Value<String> username,
  Value<String> firstName,
  Value<String> lastName,
  Value<String> email,
  Value<String> groupName,
  Value<String> profileImg,
  Value<String> bio,
  Value<int> rowid,
});

class $$CachedUsersTableFilterComposer
    extends Composer<_$AppDatabase, $CachedUsersTable> {
  $$CachedUsersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get username => $composableBuilder(
      column: $table.username, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get firstName => $composableBuilder(
      column: $table.firstName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lastName => $composableBuilder(
      column: $table.lastName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get groupName => $composableBuilder(
      column: $table.groupName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get profileImg => $composableBuilder(
      column: $table.profileImg, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get bio => $composableBuilder(
      column: $table.bio, builder: (column) => ColumnFilters(column));
}

class $$CachedUsersTableOrderingComposer
    extends Composer<_$AppDatabase, $CachedUsersTable> {
  $$CachedUsersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get username => $composableBuilder(
      column: $table.username, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get firstName => $composableBuilder(
      column: $table.firstName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lastName => $composableBuilder(
      column: $table.lastName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get groupName => $composableBuilder(
      column: $table.groupName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get profileImg => $composableBuilder(
      column: $table.profileImg, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get bio => $composableBuilder(
      column: $table.bio, builder: (column) => ColumnOrderings(column));
}

class $$CachedUsersTableAnnotationComposer
    extends Composer<_$AppDatabase, $CachedUsersTable> {
  $$CachedUsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get username =>
      $composableBuilder(column: $table.username, builder: (column) => column);

  GeneratedColumn<String> get firstName =>
      $composableBuilder(column: $table.firstName, builder: (column) => column);

  GeneratedColumn<String> get lastName =>
      $composableBuilder(column: $table.lastName, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get groupName =>
      $composableBuilder(column: $table.groupName, builder: (column) => column);

  GeneratedColumn<String> get profileImg => $composableBuilder(
      column: $table.profileImg, builder: (column) => column);

  GeneratedColumn<String> get bio =>
      $composableBuilder(column: $table.bio, builder: (column) => column);
}

class $$CachedUsersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CachedUsersTable,
    CachedUser,
    $$CachedUsersTableFilterComposer,
    $$CachedUsersTableOrderingComposer,
    $$CachedUsersTableAnnotationComposer,
    $$CachedUsersTableCreateCompanionBuilder,
    $$CachedUsersTableUpdateCompanionBuilder,
    (CachedUser, BaseReferences<_$AppDatabase, $CachedUsersTable, CachedUser>),
    CachedUser,
    PrefetchHooks Function()> {
  $$CachedUsersTableTableManager(_$AppDatabase db, $CachedUsersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedUsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedUsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CachedUsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> username = const Value.absent(),
            Value<String> firstName = const Value.absent(),
            Value<String> lastName = const Value.absent(),
            Value<String> email = const Value.absent(),
            Value<String> groupName = const Value.absent(),
            Value<String> profileImg = const Value.absent(),
            Value<String> bio = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CachedUsersCompanion(
            id: id,
            username: username,
            firstName: firstName,
            lastName: lastName,
            email: email,
            groupName: groupName,
            profileImg: profileImg,
            bio: bio,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String username,
            required String firstName,
            required String lastName,
            required String email,
            required String groupName,
            Value<String> profileImg = const Value.absent(),
            Value<String> bio = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CachedUsersCompanion.insert(
            id: id,
            username: username,
            firstName: firstName,
            lastName: lastName,
            email: email,
            groupName: groupName,
            profileImg: profileImg,
            bio: bio,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CachedUsersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CachedUsersTable,
    CachedUser,
    $$CachedUsersTableFilterComposer,
    $$CachedUsersTableOrderingComposer,
    $$CachedUsersTableAnnotationComposer,
    $$CachedUsersTableCreateCompanionBuilder,
    $$CachedUsersTableUpdateCompanionBuilder,
    (CachedUser, BaseReferences<_$AppDatabase, $CachedUsersTable, CachedUser>),
    CachedUser,
    PrefetchHooks Function()>;
typedef $$CachedTokensTableCreateCompanionBuilder = CachedTokensCompanion
    Function({
  Value<int> id,
  required String access,
  required String refresh,
});
typedef $$CachedTokensTableUpdateCompanionBuilder = CachedTokensCompanion
    Function({
  Value<int> id,
  Value<String> access,
  Value<String> refresh,
});

class $$CachedTokensTableFilterComposer
    extends Composer<_$AppDatabase, $CachedTokensTable> {
  $$CachedTokensTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get access => $composableBuilder(
      column: $table.access, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get refresh => $composableBuilder(
      column: $table.refresh, builder: (column) => ColumnFilters(column));
}

class $$CachedTokensTableOrderingComposer
    extends Composer<_$AppDatabase, $CachedTokensTable> {
  $$CachedTokensTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get access => $composableBuilder(
      column: $table.access, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get refresh => $composableBuilder(
      column: $table.refresh, builder: (column) => ColumnOrderings(column));
}

class $$CachedTokensTableAnnotationComposer
    extends Composer<_$AppDatabase, $CachedTokensTable> {
  $$CachedTokensTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get access =>
      $composableBuilder(column: $table.access, builder: (column) => column);

  GeneratedColumn<String> get refresh =>
      $composableBuilder(column: $table.refresh, builder: (column) => column);
}

class $$CachedTokensTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CachedTokensTable,
    CachedToken,
    $$CachedTokensTableFilterComposer,
    $$CachedTokensTableOrderingComposer,
    $$CachedTokensTableAnnotationComposer,
    $$CachedTokensTableCreateCompanionBuilder,
    $$CachedTokensTableUpdateCompanionBuilder,
    (
      CachedToken,
      BaseReferences<_$AppDatabase, $CachedTokensTable, CachedToken>
    ),
    CachedToken,
    PrefetchHooks Function()> {
  $$CachedTokensTableTableManager(_$AppDatabase db, $CachedTokensTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedTokensTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedTokensTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CachedTokensTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> access = const Value.absent(),
            Value<String> refresh = const Value.absent(),
          }) =>
              CachedTokensCompanion(
            id: id,
            access: access,
            refresh: refresh,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String access,
            required String refresh,
          }) =>
              CachedTokensCompanion.insert(
            id: id,
            access: access,
            refresh: refresh,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CachedTokensTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CachedTokensTable,
    CachedToken,
    $$CachedTokensTableFilterComposer,
    $$CachedTokensTableOrderingComposer,
    $$CachedTokensTableAnnotationComposer,
    $$CachedTokensTableCreateCompanionBuilder,
    $$CachedTokensTableUpdateCompanionBuilder,
    (
      CachedToken,
      BaseReferences<_$AppDatabase, $CachedTokensTable, CachedToken>
    ),
    CachedToken,
    PrefetchHooks Function()>;
typedef $$CachedAddressesTableCreateCompanionBuilder = CachedAddressesCompanion
    Function({
  required String id,
  Value<String?> label,
  Value<String?> street,
  Value<String?> suburb,
  Value<String?> postalCode,
  Value<String?> city,
  Value<int> rowid,
});
typedef $$CachedAddressesTableUpdateCompanionBuilder = CachedAddressesCompanion
    Function({
  Value<String> id,
  Value<String?> label,
  Value<String?> street,
  Value<String?> suburb,
  Value<String?> postalCode,
  Value<String?> city,
  Value<int> rowid,
});

class $$CachedAddressesTableFilterComposer
    extends Composer<_$AppDatabase, $CachedAddressesTable> {
  $$CachedAddressesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get label => $composableBuilder(
      column: $table.label, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get street => $composableBuilder(
      column: $table.street, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get suburb => $composableBuilder(
      column: $table.suburb, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get postalCode => $composableBuilder(
      column: $table.postalCode, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get city => $composableBuilder(
      column: $table.city, builder: (column) => ColumnFilters(column));
}

class $$CachedAddressesTableOrderingComposer
    extends Composer<_$AppDatabase, $CachedAddressesTable> {
  $$CachedAddressesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get label => $composableBuilder(
      column: $table.label, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get street => $composableBuilder(
      column: $table.street, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get suburb => $composableBuilder(
      column: $table.suburb, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get postalCode => $composableBuilder(
      column: $table.postalCode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get city => $composableBuilder(
      column: $table.city, builder: (column) => ColumnOrderings(column));
}

class $$CachedAddressesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CachedAddressesTable> {
  $$CachedAddressesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get label =>
      $composableBuilder(column: $table.label, builder: (column) => column);

  GeneratedColumn<String> get street =>
      $composableBuilder(column: $table.street, builder: (column) => column);

  GeneratedColumn<String> get suburb =>
      $composableBuilder(column: $table.suburb, builder: (column) => column);

  GeneratedColumn<String> get postalCode => $composableBuilder(
      column: $table.postalCode, builder: (column) => column);

  GeneratedColumn<String> get city =>
      $composableBuilder(column: $table.city, builder: (column) => column);
}

class $$CachedAddressesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CachedAddressesTable,
    CachedAddressesData,
    $$CachedAddressesTableFilterComposer,
    $$CachedAddressesTableOrderingComposer,
    $$CachedAddressesTableAnnotationComposer,
    $$CachedAddressesTableCreateCompanionBuilder,
    $$CachedAddressesTableUpdateCompanionBuilder,
    (
      CachedAddressesData,
      BaseReferences<_$AppDatabase, $CachedAddressesTable, CachedAddressesData>
    ),
    CachedAddressesData,
    PrefetchHooks Function()> {
  $$CachedAddressesTableTableManager(
      _$AppDatabase db, $CachedAddressesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedAddressesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedAddressesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CachedAddressesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String?> label = const Value.absent(),
            Value<String?> street = const Value.absent(),
            Value<String?> suburb = const Value.absent(),
            Value<String?> postalCode = const Value.absent(),
            Value<String?> city = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CachedAddressesCompanion(
            id: id,
            label: label,
            street: street,
            suburb: suburb,
            postalCode: postalCode,
            city: city,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            Value<String?> label = const Value.absent(),
            Value<String?> street = const Value.absent(),
            Value<String?> suburb = const Value.absent(),
            Value<String?> postalCode = const Value.absent(),
            Value<String?> city = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CachedAddressesCompanion.insert(
            id: id,
            label: label,
            street: street,
            suburb: suburb,
            postalCode: postalCode,
            city: city,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CachedAddressesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CachedAddressesTable,
    CachedAddressesData,
    $$CachedAddressesTableFilterComposer,
    $$CachedAddressesTableOrderingComposer,
    $$CachedAddressesTableAnnotationComposer,
    $$CachedAddressesTableCreateCompanionBuilder,
    $$CachedAddressesTableUpdateCompanionBuilder,
    (
      CachedAddressesData,
      BaseReferences<_$AppDatabase, $CachedAddressesTable, CachedAddressesData>
    ),
    CachedAddressesData,
    PrefetchHooks Function()>;
typedef $$CachedCartsTableCreateCompanionBuilder = CachedCartsCompanion
    Function({
  required String id,
  required String title,
  required String userId,
  Value<bool> isCheckedOut,
  required String orderStatus,
  Value<int> rowid,
});
typedef $$CachedCartsTableUpdateCompanionBuilder = CachedCartsCompanion
    Function({
  Value<String> id,
  Value<String> title,
  Value<String> userId,
  Value<bool> isCheckedOut,
  Value<String> orderStatus,
  Value<int> rowid,
});

final class $$CachedCartsTableReferences
    extends BaseReferences<_$AppDatabase, $CachedCartsTable, CachedCart> {
  $$CachedCartsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$CachedCartItemsTable, List<CachedCartItem>>
      _cachedCartItemsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.cachedCartItems,
              aliasName: $_aliasNameGenerator(
                  db.cachedCarts.id, db.cachedCartItems.cartId));

  $$CachedCartItemsTableProcessedTableManager get cachedCartItemsRefs {
    final manager =
        $$CachedCartItemsTableTableManager($_db, $_db.cachedCartItems)
            .filter((f) => f.cartId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_cachedCartItemsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$CachedCartsTableFilterComposer
    extends Composer<_$AppDatabase, $CachedCartsTable> {
  $$CachedCartsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isCheckedOut => $composableBuilder(
      column: $table.isCheckedOut, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get orderStatus => $composableBuilder(
      column: $table.orderStatus, builder: (column) => ColumnFilters(column));

  Expression<bool> cachedCartItemsRefs(
      Expression<bool> Function($$CachedCartItemsTableFilterComposer f) f) {
    final $$CachedCartItemsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.cachedCartItems,
        getReferencedColumn: (t) => t.cartId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CachedCartItemsTableFilterComposer(
              $db: $db,
              $table: $db.cachedCartItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$CachedCartsTableOrderingComposer
    extends Composer<_$AppDatabase, $CachedCartsTable> {
  $$CachedCartsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isCheckedOut => $composableBuilder(
      column: $table.isCheckedOut,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get orderStatus => $composableBuilder(
      column: $table.orderStatus, builder: (column) => ColumnOrderings(column));
}

class $$CachedCartsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CachedCartsTable> {
  $$CachedCartsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<bool> get isCheckedOut => $composableBuilder(
      column: $table.isCheckedOut, builder: (column) => column);

  GeneratedColumn<String> get orderStatus => $composableBuilder(
      column: $table.orderStatus, builder: (column) => column);

  Expression<T> cachedCartItemsRefs<T extends Object>(
      Expression<T> Function($$CachedCartItemsTableAnnotationComposer a) f) {
    final $$CachedCartItemsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.cachedCartItems,
        getReferencedColumn: (t) => t.cartId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CachedCartItemsTableAnnotationComposer(
              $db: $db,
              $table: $db.cachedCartItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$CachedCartsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CachedCartsTable,
    CachedCart,
    $$CachedCartsTableFilterComposer,
    $$CachedCartsTableOrderingComposer,
    $$CachedCartsTableAnnotationComposer,
    $$CachedCartsTableCreateCompanionBuilder,
    $$CachedCartsTableUpdateCompanionBuilder,
    (CachedCart, $$CachedCartsTableReferences),
    CachedCart,
    PrefetchHooks Function({bool cachedCartItemsRefs})> {
  $$CachedCartsTableTableManager(_$AppDatabase db, $CachedCartsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedCartsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedCartsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CachedCartsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> userId = const Value.absent(),
            Value<bool> isCheckedOut = const Value.absent(),
            Value<String> orderStatus = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CachedCartsCompanion(
            id: id,
            title: title,
            userId: userId,
            isCheckedOut: isCheckedOut,
            orderStatus: orderStatus,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String title,
            required String userId,
            Value<bool> isCheckedOut = const Value.absent(),
            required String orderStatus,
            Value<int> rowid = const Value.absent(),
          }) =>
              CachedCartsCompanion.insert(
            id: id,
            title: title,
            userId: userId,
            isCheckedOut: isCheckedOut,
            orderStatus: orderStatus,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$CachedCartsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({cachedCartItemsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (cachedCartItemsRefs) db.cachedCartItems
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (cachedCartItemsRefs)
                    await $_getPrefetchedData<CachedCart, $CachedCartsTable,
                            CachedCartItem>(
                        currentTable: table,
                        referencedTable: $$CachedCartsTableReferences
                            ._cachedCartItemsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CachedCartsTableReferences(db, table, p0)
                                .cachedCartItemsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.cartId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$CachedCartsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CachedCartsTable,
    CachedCart,
    $$CachedCartsTableFilterComposer,
    $$CachedCartsTableOrderingComposer,
    $$CachedCartsTableAnnotationComposer,
    $$CachedCartsTableCreateCompanionBuilder,
    $$CachedCartsTableUpdateCompanionBuilder,
    (CachedCart, $$CachedCartsTableReferences),
    CachedCart,
    PrefetchHooks Function({bool cachedCartItemsRefs})>;
typedef $$CachedCartItemsTableCreateCompanionBuilder = CachedCartItemsCompanion
    Function({
  required String id,
  required String cartId,
  required String productId,
  required int qty,
  Value<int> rowid,
});
typedef $$CachedCartItemsTableUpdateCompanionBuilder = CachedCartItemsCompanion
    Function({
  Value<String> id,
  Value<String> cartId,
  Value<String> productId,
  Value<int> qty,
  Value<int> rowid,
});

final class $$CachedCartItemsTableReferences extends BaseReferences<
    _$AppDatabase, $CachedCartItemsTable, CachedCartItem> {
  $$CachedCartItemsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $CachedCartsTable _cartIdTable(_$AppDatabase db) =>
      db.cachedCarts.createAlias(
          $_aliasNameGenerator(db.cachedCartItems.cartId, db.cachedCarts.id));

  $$CachedCartsTableProcessedTableManager get cartId {
    final $_column = $_itemColumn<String>('cart_id')!;

    final manager = $$CachedCartsTableTableManager($_db, $_db.cachedCarts)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_cartIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$CachedCartItemsTableFilterComposer
    extends Composer<_$AppDatabase, $CachedCartItemsTable> {
  $$CachedCartItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get productId => $composableBuilder(
      column: $table.productId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get qty => $composableBuilder(
      column: $table.qty, builder: (column) => ColumnFilters(column));

  $$CachedCartsTableFilterComposer get cartId {
    final $$CachedCartsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.cartId,
        referencedTable: $db.cachedCarts,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CachedCartsTableFilterComposer(
              $db: $db,
              $table: $db.cachedCarts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$CachedCartItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $CachedCartItemsTable> {
  $$CachedCartItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get productId => $composableBuilder(
      column: $table.productId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get qty => $composableBuilder(
      column: $table.qty, builder: (column) => ColumnOrderings(column));

  $$CachedCartsTableOrderingComposer get cartId {
    final $$CachedCartsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.cartId,
        referencedTable: $db.cachedCarts,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CachedCartsTableOrderingComposer(
              $db: $db,
              $table: $db.cachedCarts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$CachedCartItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CachedCartItemsTable> {
  $$CachedCartItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get productId =>
      $composableBuilder(column: $table.productId, builder: (column) => column);

  GeneratedColumn<int> get qty =>
      $composableBuilder(column: $table.qty, builder: (column) => column);

  $$CachedCartsTableAnnotationComposer get cartId {
    final $$CachedCartsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.cartId,
        referencedTable: $db.cachedCarts,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CachedCartsTableAnnotationComposer(
              $db: $db,
              $table: $db.cachedCarts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$CachedCartItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CachedCartItemsTable,
    CachedCartItem,
    $$CachedCartItemsTableFilterComposer,
    $$CachedCartItemsTableOrderingComposer,
    $$CachedCartItemsTableAnnotationComposer,
    $$CachedCartItemsTableCreateCompanionBuilder,
    $$CachedCartItemsTableUpdateCompanionBuilder,
    (CachedCartItem, $$CachedCartItemsTableReferences),
    CachedCartItem,
    PrefetchHooks Function({bool cartId})> {
  $$CachedCartItemsTableTableManager(
      _$AppDatabase db, $CachedCartItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedCartItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedCartItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CachedCartItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> cartId = const Value.absent(),
            Value<String> productId = const Value.absent(),
            Value<int> qty = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CachedCartItemsCompanion(
            id: id,
            cartId: cartId,
            productId: productId,
            qty: qty,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String cartId,
            required String productId,
            required int qty,
            Value<int> rowid = const Value.absent(),
          }) =>
              CachedCartItemsCompanion.insert(
            id: id,
            cartId: cartId,
            productId: productId,
            qty: qty,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$CachedCartItemsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({cartId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (cartId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.cartId,
                    referencedTable:
                        $$CachedCartItemsTableReferences._cartIdTable(db),
                    referencedColumn:
                        $$CachedCartItemsTableReferences._cartIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$CachedCartItemsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CachedCartItemsTable,
    CachedCartItem,
    $$CachedCartItemsTableFilterComposer,
    $$CachedCartItemsTableOrderingComposer,
    $$CachedCartItemsTableAnnotationComposer,
    $$CachedCartItemsTableCreateCompanionBuilder,
    $$CachedCartItemsTableUpdateCompanionBuilder,
    (CachedCartItem, $$CachedCartItemsTableReferences),
    CachedCartItem,
    PrefetchHooks Function({bool cartId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CachedUsersTableTableManager get cachedUsers =>
      $$CachedUsersTableTableManager(_db, _db.cachedUsers);
  $$CachedTokensTableTableManager get cachedTokens =>
      $$CachedTokensTableTableManager(_db, _db.cachedTokens);
  $$CachedAddressesTableTableManager get cachedAddresses =>
      $$CachedAddressesTableTableManager(_db, _db.cachedAddresses);
  $$CachedCartsTableTableManager get cachedCarts =>
      $$CachedCartsTableTableManager(_db, _db.cachedCarts);
  $$CachedCartItemsTableTableManager get cachedCartItems =>
      $$CachedCartItemsTableTableManager(_db, _db.cachedCartItems);
}
