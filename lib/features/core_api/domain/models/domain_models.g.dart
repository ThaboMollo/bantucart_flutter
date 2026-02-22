// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'domain_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String,
      username: json['username'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      email: json['email'] as String,
      group: json['group'] as String,
      profileImg: json['profile_img'] as String,
      bio: json['bio'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'group': instance.group,
      'profile_img': instance.profileImg,
      'bio': instance.bio,
    };

TokenEntity _$TokenEntityFromJson(Map<String, dynamic> json) => TokenEntity(
      id: (json['id'] as num).toInt(),
      access: json['access'] as String,
      refresh: json['refresh'] as String,
    );

Map<String, dynamic> _$TokenEntityToJson(TokenEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'access': instance.access,
      'refresh': instance.refresh,
    };

AuthPermission _$AuthPermissionFromJson(Map<String, dynamic> json) =>
    AuthPermission(
      id: (json['id'] as num).toInt(),
      feature: json['feature'] as String,
      model: json['model'] as String,
      canView: json['canView'] as bool,
      canUpdate: json['canUpdate'] as bool,
      canDelete: json['canDelete'] as bool,
      canCreate: json['canCreate'] as bool,
    );

Map<String, dynamic> _$AuthPermissionToJson(AuthPermission instance) =>
    <String, dynamic>{
      'id': instance.id,
      'feature': instance.feature,
      'model': instance.model,
      'canView': instance.canView,
      'canUpdate': instance.canUpdate,
      'canDelete': instance.canDelete,
      'canCreate': instance.canCreate,
    };

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      id: json['id'] as String,
      createdAt: json['createdAt'] as String?,
      label: json['label'] as String?,
      buildingName: json['buildingName'] as String?,
      complexName: json['complexName'] as String?,
      unitNumber: json['unitNumber'] as String?,
      floor: json['floor'] as String?,
      streetNumber: json['streetNumber'] as String?,
      street: json['street'] as String?,
      suburb: json['suburb'] as String?,
      postalCode: json['postalCode'] as String?,
      landmark: json['landmark'] as String?,
      directions: json['directions'] as String?,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      createdViaReferral: json['createdViaReferral'] as bool? ?? false,
      country: (json['country'] as num?)?.toInt(),
      province: (json['province'] as num?)?.toInt(),
      city: (json['city'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'label': instance.label,
      'buildingName': instance.buildingName,
      'complexName': instance.complexName,
      'unitNumber': instance.unitNumber,
      'floor': instance.floor,
      'streetNumber': instance.streetNumber,
      'street': instance.street,
      'suburb': instance.suburb,
      'postalCode': instance.postalCode,
      'landmark': instance.landmark,
      'directions': instance.directions,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'createdViaReferral': instance.createdViaReferral,
      'country': instance.country,
      'province': instance.province,
      'city': instance.city,
    };

ReadSubscriptionPackage _$ReadSubscriptionPackageFromJson(
        Map<String, dynamic> json) =>
    ReadSubscriptionPackage(
      id: json['id'] as String,
      packageName: json['packageName'] as String,
      packageDescription: json['packageDescription'] as String,
    );

Map<String, dynamic> _$ReadSubscriptionPackageToJson(
        ReadSubscriptionPackage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'packageName': instance.packageName,
      'packageDescription': instance.packageDescription,
    };

ShopRead _$ShopReadFromJson(Map<String, dynamic> json) => ShopRead(
      id: json['id'] as String,
      name: json['name'] as String,
      rank: json['rank'] as String?,
    );

Map<String, dynamic> _$ShopReadToJson(ShopRead instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'rank': instance.rank,
    };

Shop _$ShopFromJson(Map<String, dynamic> json) => Shop(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      about: json['about'] as String,
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      image: json['image'] as String?,
      background: json['background'] as String?,
      rank: json['rank'] as String?,
      approvalStatus: json['approvalStatus'] as String?,
    );

Map<String, dynamic> _$ShopToJson(Shop instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'about': instance.about,
      'address': instance.address?.toJson(),
      'image': instance.image,
      'background': instance.background,
      'rank': instance.rank,
      'approvalStatus': instance.approvalStatus,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: json['id'] as String,
      name: json['name'] as String,
      slug: json['slug'] as String,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
    };

Subcategory _$SubcategoryFromJson(Map<String, dynamic> json) => Subcategory(
      id: json['id'] as String,
      category: Category.fromJson(json['category'] as Map<String, dynamic>),
      name: json['name'] as String,
      slug: json['slug'] as String,
    );

Map<String, dynamic> _$SubcategoryToJson(Subcategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': instance.category.toJson(),
      'name': instance.name,
      'slug': instance.slug,
    };

ProductImage _$ProductImageFromJson(Map<String, dynamic> json) => ProductImage(
      id: json['id'] as String,
      image: json['image'] as String,
      uploadDate: json['uploadDate'] as String,
    );

Map<String, dynamic> _$ProductImageToJson(ProductImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'uploadDate': instance.uploadDate,
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as String,
      shop: ShopRead.fromJson(json['shop'] as Map<String, dynamic>),
      name: json['name'] as String,
      description: json['description'] as String,
      price: json['price'] as String,
      isOnSale: json['isOnSale'] as bool? ?? false,
      salePercentage: json['salePercentage'] as String? ?? '0.00',
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => ProductImage.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ProductImage>[],
      attributes: json['attributes'] as Map<String, dynamic>? ??
          const <String, dynamic>{},
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'shop': instance.shop.toJson(),
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'isOnSale': instance.isOnSale,
      'salePercentage': instance.salePercentage,
      'images': instance.images.map((e) => e.toJson()).toList(),
      'attributes': instance.attributes,
    };

CartItem _$CartItemFromJson(Map<String, dynamic> json) => CartItem(
      id: json['id'] as String,
      cart: json['cart'] as String,
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
      qty: (json['qty'] as num).toInt(),
    );

Map<String, dynamic> _$CartItemToJson(CartItem instance) => <String, dynamic>{
      'id': instance.id,
      'cart': instance.cart,
      'product': instance.product.toJson(),
      'qty': instance.qty,
    };

Cart _$CartFromJson(Map<String, dynamic> json) => Cart(
      id: json['id'] as String,
      title: json['title'] as String,
      dateCreated: json['dateCreated'] as String?,
      lastModified: json['lastModified'] as String?,
      user: json['user'] as String,
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => CartItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <CartItem>[],
      isCheckedOut: json['isCheckedOut'] as bool? ?? false,
      orderStatus: json['orderStatus'] as String,
      shop: json['shop'] as String,
      checkoutMetadata: json['checkoutMetadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$CartToJson(Cart instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'dateCreated': instance.dateCreated,
      'lastModified': instance.lastModified,
      'user': instance.user,
      'items': instance.items.map((e) => e.toJson()).toList(),
      'isCheckedOut': instance.isCheckedOut,
      'orderStatus': instance.orderStatus,
      'shop': instance.shop,
      'checkoutMetadata': instance.checkoutMetadata,
    };

AddressInfo _$AddressInfoFromJson(Map<String, dynamic> json) => AddressInfo(
      id: json['id'] as String,
      street: json['street'] as String,
      city: json['city'] as String,
      province: json['province'] as String,
      country: json['country'] as String,
      postalCode: json['postalCode'] as String,
    );

Map<String, dynamic> _$AddressInfoToJson(AddressInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'street': instance.street,
      'city': instance.city,
      'province': instance.province,
      'country': instance.country,
      'postalCode': instance.postalCode,
    };

Addresses _$AddressesFromJson(Map<String, dynamic> json) => Addresses(
      seller: AddressInfo.fromJson(json['seller'] as Map<String, dynamic>),
      buyer: AddressInfo.fromJson(json['buyer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddressesToJson(Addresses instance) => <String, dynamic>{
      'seller': instance.seller.toJson(),
      'buyer': instance.buyer.toJson(),
    };

DeliveryDetails _$DeliveryDetailsFromJson(Map<String, dynamic> json) =>
    DeliveryDetails(
      distanceKm: (json['distanceKm'] as num).toDouble(),
      customerPays: json['customerPays'] as String,
      courierEarns: json['courierEarns'] as String,
      breakdown: json['breakdown'] as Map<String, dynamic>?,
      success: json['success'] as bool,
    );

Map<String, dynamic> _$DeliveryDetailsToJson(DeliveryDetails instance) =>
    <String, dynamic>{
      'distanceKm': instance.distanceKm,
      'customerPays': instance.customerPays,
      'courierEarns': instance.courierEarns,
      'breakdown': instance.breakdown,
      'success': instance.success,
    };

CheckoutResponse _$CheckoutResponseFromJson(Map<String, dynamic> json) =>
    CheckoutResponse(
      delivery: json['delivery'] as String,
      deliveryProvider: json['deliveryProvider'] as String,
      deliveryDetails: json['deliveryDetails'] == null
          ? null
          : DeliveryDetails.fromJson(
              json['deliveryDetails'] as Map<String, dynamic>),
      deliveryQuotes: json['deliveryQuotes'],
      link: json['link'] as String,
      reference: json['reference'] as String,
      accessCode: json['accessCode'] as String,
      price: json['price'] as String,
      serviceFee: json['serviceFee'] as String,
      total: json['total'] as String,
      courierPayment: json['courierPayment'] as String,
      addresses: json['addresses'] == null
          ? null
          : Addresses.fromJson(json['addresses'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CheckoutResponseToJson(CheckoutResponse instance) =>
    <String, dynamic>{
      'delivery': instance.delivery,
      'deliveryProvider': instance.deliveryProvider,
      'deliveryDetails': instance.deliveryDetails?.toJson(),
      'deliveryQuotes': instance.deliveryQuotes,
      'link': instance.link,
      'reference': instance.reference,
      'accessCode': instance.accessCode,
      'price': instance.price,
      'serviceFee': instance.serviceFee,
      'total': instance.total,
      'courierPayment': instance.courierPayment,
      'addresses': instance.addresses?.toJson(),
    };

CheckoutCallbackResponse _$CheckoutCallbackResponseFromJson(
        Map<String, dynamic> json) =>
    CheckoutCallbackResponse(
      status: json['status'] as String,
      message: json['message'] as String,
      cartId: json['cartId'] as String?,
      transactionId: json['transactionId'] as String?,
    );

Map<String, dynamic> _$CheckoutCallbackResponseToJson(
        CheckoutCallbackResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'cartId': instance.cartId,
      'transactionId': instance.transactionId,
    };

Courier _$CourierFromJson(Map<String, dynamic> json) => Courier(
      id: json['id'] as String,
      userId: json['userId'] as String,
      isActive: json['isActive'] as bool? ?? true,
      addressId: json['addressId'] as String,
      idDocumentPath: json['idDocumentPath'] as String?,
      licensePath: json['licensePath'] as String?,
    );

Map<String, dynamic> _$CourierToJson(Courier instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'isActive': instance.isActive,
      'addressId': instance.addressId,
      'idDocumentPath': instance.idDocumentPath,
      'licensePath': instance.licensePath,
    };

AccountStats _$AccountStatsFromJson(Map<String, dynamic> json) => AccountStats(
      completedOrders: (json['completedOrders'] as num).toInt(),
      totalOrders: (json['totalOrders'] as num).toInt(),
      pendingEarnings: json['pendingEarnings'] as String,
    );

Map<String, dynamic> _$AccountStatsToJson(AccountStats instance) =>
    <String, dynamic>{
      'completedOrders': instance.completedOrders,
      'totalOrders': instance.totalOrders,
      'pendingEarnings': instance.pendingEarnings,
    };

BankAccount _$BankAccountFromJson(Map<String, dynamic> json) => BankAccount(
      id: json['id'] as String,
      createdAt: json['createdAt'] as String,
      currency: json['currency'] as String,
      status: json['status'] as String,
      paystackStatus: json['paystackStatus'] as String?,
      paystackRecipientCode: json['paystackRecipientCode'] as String?,
      paystackRecipientType: json['paystackRecipientType'] as String?,
      balance: json['balance'] as String,
      lifetimeEarnings: json['lifetimeEarnings'] as String,
      isPrimary: json['isPrimary'] as bool,
      courier: json['courier'] as String?,
      networkMarketer: json['networkMarketer'] as String?,
      shop: json['shop'] as String?,
    );

Map<String, dynamic> _$BankAccountToJson(BankAccount instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'currency': instance.currency,
      'status': instance.status,
      'paystackStatus': instance.paystackStatus,
      'paystackRecipientCode': instance.paystackRecipientCode,
      'paystackRecipientType': instance.paystackRecipientType,
      'balance': instance.balance,
      'lifetimeEarnings': instance.lifetimeEarnings,
      'isPrimary': instance.isPrimary,
      'courier': instance.courier,
      'networkMarketer': instance.networkMarketer,
      'shop': instance.shop,
    };

CourierAccount _$CourierAccountFromJson(Map<String, dynamic> json) =>
    CourierAccount(
      id: json['id'] as String,
      createdAt: json['createdAt'] as String,
      currency: json['currency'] as String,
      status: json['status'] as String,
      paystackStatus: json['paystackStatus'] as String?,
      paystackRecipientCode: json['paystackRecipientCode'] as String?,
      paystackRecipientType: json['paystackRecipientType'] as String?,
      balance: json['balance'] as String,
      lifetimeEarnings: json['lifetimeEarnings'] as String,
      isPrimary: json['isPrimary'] as bool,
      courier: json['courier'] as String,
      stats: AccountStats.fromJson(json['stats'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CourierAccountToJson(CourierAccount instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'currency': instance.currency,
      'status': instance.status,
      'paystackStatus': instance.paystackStatus,
      'paystackRecipientCode': instance.paystackRecipientCode,
      'paystackRecipientType': instance.paystackRecipientType,
      'balance': instance.balance,
      'lifetimeEarnings': instance.lifetimeEarnings,
      'isPrimary': instance.isPrimary,
      'courier': instance.courier,
      'stats': instance.stats.toJson(),
    };

PaystackBank _$PaystackBankFromJson(Map<String, dynamic> json) => PaystackBank(
      name: json['name'] as String,
      slug: json['slug'] as String,
      code: json['code'] as String,
      longcode: json['longcode'] as String?,
      gateway: json['gateway'] as String?,
      payWithBank: json['payWithBank'] as bool,
      active: json['active'] as bool,
      isDeleted: json['isDeleted'] as bool,
      country: json['country'] as String,
      currency: json['currency'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$PaystackBankToJson(PaystackBank instance) =>
    <String, dynamic>{
      'name': instance.name,
      'slug': instance.slug,
      'code': instance.code,
      'longcode': instance.longcode,
      'gateway': instance.gateway,
      'payWithBank': instance.payWithBank,
      'active': instance.active,
      'isDeleted': instance.isDeleted,
      'country': instance.country,
      'currency': instance.currency,
      'type': instance.type,
    };

NetworkMarketer _$NetworkMarketerFromJson(Map<String, dynamic> json) =>
    NetworkMarketer(
      id: json['id'] as String,
      idType: json['idType'] as String,
      idNumber: json['idNumber'] as String,
      proofOfIdentity: json['proofOfIdentity'] as String?,
      proofOfResidence: json['proofOfResidence'] as String?,
      status: json['status'] as String?,
      isActive: json['isActive'] as bool? ?? true,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      approvedBy: json['approvedBy'] as String,
      qrCode: json['qrCode'] as String?,
    );

Map<String, dynamic> _$NetworkMarketerToJson(NetworkMarketer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idType': instance.idType,
      'idNumber': instance.idNumber,
      'proofOfIdentity': instance.proofOfIdentity,
      'proofOfResidence': instance.proofOfResidence,
      'status': instance.status,
      'isActive': instance.isActive,
      'user': instance.user.toJson(),
      'approvedBy': instance.approvedBy,
      'qrCode': instance.qrCode,
    };

NetworkMarketerUser _$NetworkMarketerUserFromJson(Map<String, dynamic> json) =>
    NetworkMarketerUser(
      id: json['id'] as String,
      email: json['email'] as String,
      username: json['username'] as String,
    );

Map<String, dynamic> _$NetworkMarketerUserToJson(
        NetworkMarketerUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'username': instance.username,
    };

NetworkMarketerInfo _$NetworkMarketerInfoFromJson(Map<String, dynamic> json) =>
    NetworkMarketerInfo(
      id: json['id'] as String,
      referralToken: json['referralToken'] as String,
      user: NetworkMarketerUser.fromJson(json['user'] as Map<String, dynamic>),
      status: json['status'] as String,
      isActive: json['isActive'] as bool,
    );

Map<String, dynamic> _$NetworkMarketerInfoToJson(
        NetworkMarketerInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'referralToken': instance.referralToken,
      'user': instance.user.toJson(),
      'status': instance.status,
      'isActive': instance.isActive,
    };

DashboardSummary _$DashboardSummaryFromJson(Map<String, dynamic> json) =>
    DashboardSummary(
      totalEarnings: json['totalEarnings'] as String,
      pendingEarnings: json['pendingEarnings'] as String,
      paidEarnings: json['paidEarnings'] as String,
      totalShops: (json['totalShops'] as num).toInt(),
      activeShops: (json['activeShops'] as num).toInt(),
      totalOrders: (json['totalOrders'] as num).toInt(),
      thisMonthEarnings: json['thisMonthEarnings'] as String,
      cachedAt: json['cachedAt'] as String?,
    );

Map<String, dynamic> _$DashboardSummaryToJson(DashboardSummary instance) =>
    <String, dynamic>{
      'totalEarnings': instance.totalEarnings,
      'pendingEarnings': instance.pendingEarnings,
      'paidEarnings': instance.paidEarnings,
      'totalShops': instance.totalShops,
      'activeShops': instance.activeShops,
      'totalOrders': instance.totalOrders,
      'thisMonthEarnings': instance.thisMonthEarnings,
      'cachedAt': instance.cachedAt,
    };

ReferredShop _$ReferredShopFromJson(Map<String, dynamic> json) => ReferredShop(
      id: json['id'] as String,
      name: json['name'] as String,
      approvalStatus: json['approvalStatus'] as String,
      totalOrders: (json['totalOrders'] as num).toInt(),
      commissionEarned: json['commissionEarned'] as String,
      lastOrderDate: json['lastOrderDate'] as String?,
      referredAt: json['referredAt'] as String,
      isActive: json['isActive'] as bool,
    );

Map<String, dynamic> _$ReferredShopToJson(ReferredShop instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'approvalStatus': instance.approvalStatus,
      'totalOrders': instance.totalOrders,
      'commissionEarned': instance.commissionEarned,
      'lastOrderDate': instance.lastOrderDate,
      'referredAt': instance.referredAt,
      'isActive': instance.isActive,
    };

EarningsHistory _$EarningsHistoryFromJson(Map<String, dynamic> json) =>
    EarningsHistory(
      id: json['id'] as String,
      date: json['date'] as String,
      amount: json['amount'] as String,
      status: json['status'] as String,
      shopId: json['shopId'] as String,
      shopName: json['shopName'] as String,
      orderId: json['orderId'] as String,
      transactionId: json['transactionId'] as String,
      metadata: Map<String, String>.from(json['metadata'] as Map),
    );

Map<String, dynamic> _$EarningsHistoryToJson(EarningsHistory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'amount': instance.amount,
      'status': instance.status,
      'shopId': instance.shopId,
      'shopName': instance.shopName,
      'orderId': instance.orderId,
      'transactionId': instance.transactionId,
      'metadata': instance.metadata,
    };

EarningsTimeSeriesData _$EarningsTimeSeriesDataFromJson(
        Map<String, dynamic> json) =>
    EarningsTimeSeriesData(
      period: json['period'] as String,
      periodKey: json['periodKey'] as String,
      totalEarnings: json['totalEarnings'] as String,
      transactionCount: (json['transactionCount'] as num).toInt(),
      orderCount: (json['orderCount'] as num).toInt(),
    );

Map<String, dynamic> _$EarningsTimeSeriesDataToJson(
        EarningsTimeSeriesData instance) =>
    <String, dynamic>{
      'period': instance.period,
      'periodKey': instance.periodKey,
      'totalEarnings': instance.totalEarnings,
      'transactionCount': instance.transactionCount,
      'orderCount': instance.orderCount,
    };

EarningsTimeSeriesResponse _$EarningsTimeSeriesResponseFromJson(
        Map<String, dynamic> json) =>
    EarningsTimeSeriesResponse(
      period: json['period'] as String,
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      data: (json['data'] as List<dynamic>)
          .map(
              (e) => EarningsTimeSeriesData.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPeriods: (json['totalPeriods'] as num).toInt(),
      totalEarnings: json['totalEarnings'] as String,
    );

Map<String, dynamic> _$EarningsTimeSeriesResponseToJson(
        EarningsTimeSeriesResponse instance) =>
    <String, dynamic>{
      'period': instance.period,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'data': instance.data.map((e) => e.toJson()).toList(),
      'totalPeriods': instance.totalPeriods,
      'totalEarnings': instance.totalEarnings,
    };

PaginatedEarningsHistory _$PaginatedEarningsHistoryFromJson(
        Map<String, dynamic> json) =>
    PaginatedEarningsHistory(
      count: (json['count'] as num).toInt(),
      page: (json['page'] as num).toInt(),
      pageSize: (json['pageSize'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
      results: (json['results'] as List<dynamic>)
          .map((e) => EarningsHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PaginatedEarningsHistoryToJson(
        PaginatedEarningsHistory instance) =>
    <String, dynamic>{
      'count': instance.count,
      'page': instance.page,
      'pageSize': instance.pageSize,
      'totalPages': instance.totalPages,
      'results': instance.results.map((e) => e.toJson()).toList(),
    };

ShopPerformanceSummary _$ShopPerformanceSummaryFromJson(
        Map<String, dynamic> json) =>
    ShopPerformanceSummary(
      totalShops: (json['totalShops'] as num).toInt(),
      activeShops: (json['activeShops'] as num).toInt(),
      totalCommissionEarned: json['totalCommissionEarned'] as String,
      totalOrdersGenerated: (json['totalOrdersGenerated'] as num).toInt(),
    );

Map<String, dynamic> _$ShopPerformanceSummaryToJson(
        ShopPerformanceSummary instance) =>
    <String, dynamic>{
      'totalShops': instance.totalShops,
      'activeShops': instance.activeShops,
      'totalCommissionEarned': instance.totalCommissionEarned,
      'totalOrdersGenerated': instance.totalOrdersGenerated,
    };

ShopPerformanceResponse _$ShopPerformanceResponseFromJson(
        Map<String, dynamic> json) =>
    ShopPerformanceResponse(
      shops: (json['shops'] as List<dynamic>)
          .map((e) => ReferredShop.fromJson(e as Map<String, dynamic>))
          .toList(),
      summary: ShopPerformanceSummary.fromJson(
          json['summary'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ShopPerformanceResponseToJson(
        ShopPerformanceResponse instance) =>
    <String, dynamic>{
      'shops': instance.shops.map((e) => e.toJson()).toList(),
      'summary': instance.summary.toJson(),
    };

NetworkMarketerDashboard _$NetworkMarketerDashboardFromJson(
        Map<String, dynamic> json) =>
    NetworkMarketerDashboard(
      marketer: NetworkMarketerInfo.fromJson(
          json['marketer'] as Map<String, dynamic>),
      summary:
          DashboardSummary.fromJson(json['summary'] as Map<String, dynamic>),
      referredShops: (json['referredShops'] as List<dynamic>)
          .map((e) => ReferredShop.fromJson(e as Map<String, dynamic>))
          .toList(),
      recentEarnings: (json['recentEarnings'] as List<dynamic>)
          .map((e) => EarningsHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NetworkMarketerDashboardToJson(
        NetworkMarketerDashboard instance) =>
    <String, dynamic>{
      'marketer': instance.marketer.toJson(),
      'summary': instance.summary.toJson(),
      'referredShops': instance.referredShops.map((e) => e.toJson()).toList(),
      'recentEarnings': instance.recentEarnings.map((e) => e.toJson()).toList(),
    };

NotificationData _$NotificationDataFromJson(Map<String, dynamic> json) =>
    NotificationData(
      type: json['type'] as String,
      title: json['title'] as String,
      message: json['message'] as String,
      imageUrl: json['imageUrl'] as String?,
      actionUrl: json['actionUrl'] as String?,
      orderId: json['orderId'] as String?,
      productId: json['productId'] as String?,
      shopId: json['shopId'] as String?,
      code: json['code'] as String?,
      deepLink: json['deepLink'] as String?,
      metadata: (json['metadata'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
    );

Map<String, dynamic> _$NotificationDataToJson(NotificationData instance) =>
    <String, dynamic>{
      'type': instance.type,
      'title': instance.title,
      'message': instance.message,
      'imageUrl': instance.imageUrl,
      'actionUrl': instance.actionUrl,
      'orderId': instance.orderId,
      'productId': instance.productId,
      'shopId': instance.shopId,
      'code': instance.code,
      'deepLink': instance.deepLink,
      'metadata': instance.metadata,
    };
