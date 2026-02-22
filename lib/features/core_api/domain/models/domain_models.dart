import 'package:json_annotation/json_annotation.dart';

part 'domain_models.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  const User({
    required this.id,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.group,
    required this.profileImg,
    required this.bio,
  });

  final String id;
  final String username;
  @JsonKey(name: 'first_name')
  final String firstName;
  @JsonKey(name: 'last_name')
  final String lastName;
  final String email;
  final String group;
  @JsonKey(name: 'profile_img')
  final String profileImg;
  final String bio;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class TokenEntity {
  const TokenEntity(
      {required this.id, required this.access, required this.refresh});

  final int id;
  final String access;
  final String refresh;

  factory TokenEntity.fromJson(Map<String, dynamic> json) =>
      _$TokenEntityFromJson(json);
  Map<String, dynamic> toJson() => _$TokenEntityToJson(this);
}

@JsonSerializable()
class AuthPermission {
  const AuthPermission({
    required this.id,
    required this.feature,
    required this.model,
    @JsonKey(name: 'can_view') required this.canView,
    @JsonKey(name: 'can_update') required this.canUpdate,
    @JsonKey(name: 'can_delete') required this.canDelete,
    @JsonKey(name: 'can_create') required this.canCreate,
  });

  final int id;
  final String feature;
  final String model;
  final bool canView;
  final bool canUpdate;
  final bool canDelete;
  final bool canCreate;

  factory AuthPermission.fromJson(Map<String, dynamic> json) =>
      _$AuthPermissionFromJson(json);
  Map<String, dynamic> toJson() => _$AuthPermissionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Address {
  const Address({
    required this.id,
    @JsonKey(name: 'created_at') this.createdAt,
    this.label,
    @JsonKey(name: 'building_name') this.buildingName,
    @JsonKey(name: 'complex_name') this.complexName,
    @JsonKey(name: 'unit_number') this.unitNumber,
    this.floor,
    @JsonKey(name: 'street_number') this.streetNumber,
    this.street,
    this.suburb,
    @JsonKey(name: 'postal_code') this.postalCode,
    this.landmark,
    this.directions,
    this.latitude,
    this.longitude,
    @JsonKey(name: 'created_via_referral') this.createdViaReferral = false,
    this.country,
    this.province,
    this.city,
  });

  final String id;
  final String? createdAt;
  final String? label;
  final String? buildingName;
  final String? complexName;
  final String? unitNumber;
  final String? floor;
  final String? streetNumber;
  final String? street;
  final String? suburb;
  final String? postalCode;
  final String? landmark;
  final String? directions;
  final String? latitude;
  final String? longitude;
  final bool createdViaReferral;
  final int? country;
  final int? province;
  final int? city;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
  Map<String, dynamic> toJson() => _$AddressToJson(this);
}

@JsonSerializable()
class ReadSubscriptionPackage {
  const ReadSubscriptionPackage({
    required this.id,
    @JsonKey(name: 'package_name') required this.packageName,
    @JsonKey(name: 'package_description') required this.packageDescription,
  });

  final String id;
  final String packageName;
  final String packageDescription;

  factory ReadSubscriptionPackage.fromJson(Map<String, dynamic> json) =>
      _$ReadSubscriptionPackageFromJson(json);
  Map<String, dynamic> toJson() => _$ReadSubscriptionPackageToJson(this);
}

@JsonSerializable()
class ShopRead {
  const ShopRead({required this.id, required this.name, this.rank});

  final String id;
  final String name;
  final String? rank;

  factory ShopRead.fromJson(Map<String, dynamic> json) =>
      _$ShopReadFromJson(json);
  Map<String, dynamic> toJson() => _$ShopReadToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Shop {
  const Shop({
    required this.id,
    required this.name,
    required this.description,
    required this.about,
    this.address,
    this.image,
    this.background,
    this.rank,
    @JsonKey(name: 'approval_status') this.approvalStatus,
  });

  final String id;
  final String name;
  final String description;
  final String about;
  final Address? address;
  final String? image;
  final String? background;
  final String? rank;
  final String? approvalStatus;

  factory Shop.fromJson(Map<String, dynamic> json) => _$ShopFromJson(json);
  Map<String, dynamic> toJson() => _$ShopToJson(this);
}

@JsonSerializable()
class Category {
  const Category({required this.id, required this.name, required this.slug});

  final String id;
  final String name;
  final String slug;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Subcategory {
  const Subcategory({
    required this.id,
    required this.category,
    required this.name,
    required this.slug,
  });

  final String id;
  final Category category;
  final String name;
  final String slug;

  factory Subcategory.fromJson(Map<String, dynamic> json) =>
      _$SubcategoryFromJson(json);
  Map<String, dynamic> toJson() => _$SubcategoryToJson(this);
}

@JsonSerializable()
class ProductImage {
  const ProductImage(
      {required this.id,
      required this.image,
      @JsonKey(name: 'upload_date') required this.uploadDate});

  final String id;
  final String image;
  final String uploadDate;

  factory ProductImage.fromJson(Map<String, dynamic> json) =>
      _$ProductImageFromJson(json);
  Map<String, dynamic> toJson() => _$ProductImageToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Product {
  const Product({
    required this.id,
    required this.shop,
    required this.name,
    required this.description,
    required this.price,
    @JsonKey(name: 'is_on_sale') this.isOnSale = false,
    @JsonKey(name: 'sale_percentage') this.salePercentage = '0.00',
    this.images = const <ProductImage>[],
    this.attributes = const <String, dynamic>{},
  });

  final String id;
  final ShopRead shop;
  final String name;
  final String description;
  final String price;
  final bool isOnSale;
  final String salePercentage;
  final List<ProductImage> images;
  final Map<String, dynamic> attributes;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CartItem {
  const CartItem({
    required this.id,
    required this.cart,
    required this.product,
    required this.qty,
  });

  final String id;
  final String cart;
  final Product product;
  final int qty;

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);
  Map<String, dynamic> toJson() => _$CartItemToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Cart {
  const Cart({
    required this.id,
    required this.title,
    @JsonKey(name: 'date_created') this.dateCreated,
    @JsonKey(name: 'last_modified') this.lastModified,
    required this.user,
    this.items = const <CartItem>[],
    @JsonKey(name: 'is_checked_out') this.isCheckedOut = false,
    @JsonKey(name: 'order_status') required this.orderStatus,
    required this.shop,
    @JsonKey(name: 'checkout_metadata') this.checkoutMetadata,
  });

  final String id;
  final String title;
  final String? dateCreated;
  final String? lastModified;
  final String user;
  final List<CartItem> items;
  final bool isCheckedOut;
  final String orderStatus;
  final String shop;
  final Map<String, dynamic>? checkoutMetadata;

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
  Map<String, dynamic> toJson() => _$CartToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AddressInfo {
  const AddressInfo({
    required this.id,
    required this.street,
    required this.city,
    required this.province,
    required this.country,
    @JsonKey(name: 'postal_code') required this.postalCode,
  });

  final String id;
  final String street;
  final String city;
  final String province;
  final String country;
  final String postalCode;

  factory AddressInfo.fromJson(Map<String, dynamic> json) =>
      _$AddressInfoFromJson(json);
  Map<String, dynamic> toJson() => _$AddressInfoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Addresses {
  const Addresses({required this.seller, required this.buyer});

  final AddressInfo seller;
  final AddressInfo buyer;

  factory Addresses.fromJson(Map<String, dynamic> json) =>
      _$AddressesFromJson(json);
  Map<String, dynamic> toJson() => _$AddressesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DeliveryDetails {
  const DeliveryDetails({
    @JsonKey(name: 'distance_km') required this.distanceKm,
    @JsonKey(name: 'customer_pays') required this.customerPays,
    @JsonKey(name: 'courier_earns') required this.courierEarns,
    this.breakdown,
    required this.success,
  });

  final double distanceKm;
  final String customerPays;
  final String courierEarns;
  final Map<String, dynamic>? breakdown;
  final bool success;

  factory DeliveryDetails.fromJson(Map<String, dynamic> json) =>
      _$DeliveryDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$DeliveryDetailsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CheckoutResponse {
  const CheckoutResponse({
    required this.delivery,
    @JsonKey(name: 'delivery_provider') required this.deliveryProvider,
    @JsonKey(name: 'delivery_details') this.deliveryDetails,
    @JsonKey(name: 'delivery_quotes') this.deliveryQuotes,
    required this.link,
    required this.reference,
    @JsonKey(name: 'access_code') required this.accessCode,
    required this.price,
    @JsonKey(name: 'service_fee') required this.serviceFee,
    required this.total,
    @JsonKey(name: 'courier_payment') required this.courierPayment,
    this.addresses,
  });

  final String delivery;
  final String deliveryProvider;
  final DeliveryDetails? deliveryDetails;
  final dynamic deliveryQuotes;
  final String link;
  final String reference;
  final String accessCode;
  final String price;
  final String serviceFee;
  final String total;
  final String courierPayment;
  final Addresses? addresses;

  factory CheckoutResponse.fromJson(Map<String, dynamic> json) =>
      _$CheckoutResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CheckoutResponseToJson(this);
}

@JsonSerializable()
class CheckoutCallbackResponse {
  const CheckoutCallbackResponse({
    required this.status,
    required this.message,
    @JsonKey(name: 'cart_id') this.cartId,
    @JsonKey(name: 'transaction_id') this.transactionId,
  });

  final String status;
  final String message;
  final String? cartId;
  final String? transactionId;

  factory CheckoutCallbackResponse.fromJson(Map<String, dynamic> json) =>
      _$CheckoutCallbackResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CheckoutCallbackResponseToJson(this);
}

@JsonSerializable()
class Courier {
  const Courier({
    required this.id,
    @JsonKey(name: 'userId') required this.userId,
    @JsonKey(name: 'isActive') this.isActive = true,
    @JsonKey(name: 'addressId') required this.addressId,
    @JsonKey(name: 'idDocumentPath') this.idDocumentPath,
    @JsonKey(name: 'licensePath') this.licensePath,
  });

  final String id;
  final String userId;
  final bool isActive;
  final String addressId;
  final String? idDocumentPath;
  final String? licensePath;

  factory Courier.fromJson(Map<String, dynamic> json) =>
      _$CourierFromJson(json);
  Map<String, dynamic> toJson() => _$CourierToJson(this);
}

@JsonSerializable()
class AccountStats {
  const AccountStats({
    @JsonKey(name: 'completed_orders') required this.completedOrders,
    @JsonKey(name: 'total_orders') required this.totalOrders,
    @JsonKey(name: 'pending_earnings') required this.pendingEarnings,
  });

  final int completedOrders;
  final int totalOrders;
  final String pendingEarnings;

  factory AccountStats.fromJson(Map<String, dynamic> json) =>
      _$AccountStatsFromJson(json);
  Map<String, dynamic> toJson() => _$AccountStatsToJson(this);
}

@JsonSerializable()
class BankAccount {
  const BankAccount({
    required this.id,
    @JsonKey(name: 'created_at') required this.createdAt,
    required this.currency,
    required this.status,
    @JsonKey(name: 'paystack_status') this.paystackStatus,
    @JsonKey(name: 'paystack_recipient_code') this.paystackRecipientCode,
    @JsonKey(name: 'paystack_recipient_type') this.paystackRecipientType,
    required this.balance,
    @JsonKey(name: 'lifetime_earnings') required this.lifetimeEarnings,
    @JsonKey(name: 'is_primary') required this.isPrimary,
    this.courier,
    @JsonKey(name: 'network_marketer') this.networkMarketer,
    this.shop,
  });

  final String id;
  final String createdAt;
  final String currency;
  final String status;
  final String? paystackStatus;
  final String? paystackRecipientCode;
  final String? paystackRecipientType;
  final String balance;
  final String lifetimeEarnings;
  final bool isPrimary;
  final String? courier;
  final String? networkMarketer;
  final String? shop;

  factory BankAccount.fromJson(Map<String, dynamic> json) =>
      _$BankAccountFromJson(json);
  Map<String, dynamic> toJson() => _$BankAccountToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CourierAccount {
  const CourierAccount({
    required this.id,
    @JsonKey(name: 'created_at') required this.createdAt,
    required this.currency,
    required this.status,
    @JsonKey(name: 'paystack_status') this.paystackStatus,
    @JsonKey(name: 'paystack_recipient_code') this.paystackRecipientCode,
    @JsonKey(name: 'paystack_recipient_type') this.paystackRecipientType,
    required this.balance,
    @JsonKey(name: 'lifetime_earnings') required this.lifetimeEarnings,
    @JsonKey(name: 'is_primary') required this.isPrimary,
    required this.courier,
    required this.stats,
  });

  final String id;
  final String createdAt;
  final String currency;
  final String status;
  final String? paystackStatus;
  final String? paystackRecipientCode;
  final String? paystackRecipientType;
  final String balance;
  final String lifetimeEarnings;
  final bool isPrimary;
  final String courier;
  final AccountStats stats;

  factory CourierAccount.fromJson(Map<String, dynamic> json) =>
      _$CourierAccountFromJson(json);
  Map<String, dynamic> toJson() => _$CourierAccountToJson(this);
}

@JsonSerializable()
class PaystackBank {
  const PaystackBank({
    required this.name,
    required this.slug,
    required this.code,
    this.longcode,
    this.gateway,
    @JsonKey(name: 'pay_with_bank') required this.payWithBank,
    required this.active,
    @JsonKey(name: 'is_deleted') required this.isDeleted,
    required this.country,
    required this.currency,
    required this.type,
  });

  final String name;
  final String slug;
  final String code;
  final String? longcode;
  final String? gateway;
  final bool payWithBank;
  final bool active;
  final bool isDeleted;
  final String country;
  final String currency;
  final String type;

  factory PaystackBank.fromJson(Map<String, dynamic> json) =>
      _$PaystackBankFromJson(json);
  Map<String, dynamic> toJson() => _$PaystackBankToJson(this);
}

@JsonSerializable(explicitToJson: true)
class NetworkMarketer {
  const NetworkMarketer({
    required this.id,
    @JsonKey(name: 'id_type') required this.idType,
    @JsonKey(name: 'id_number') required this.idNumber,
    @JsonKey(name: 'proof_of_identity') this.proofOfIdentity,
    @JsonKey(name: 'proof_of_residence') this.proofOfResidence,
    this.status,
    @JsonKey(name: 'is_active') this.isActive = true,
    required this.user,
    @JsonKey(name: 'approved_by') required this.approvedBy,
    @JsonKey(name: 'qr_code') this.qrCode,
  });

  final String id;
  final String idType;
  final String idNumber;
  final String? proofOfIdentity;
  final String? proofOfResidence;
  final String? status;
  final bool isActive;
  final User user;
  final String approvedBy;
  final String? qrCode;

  factory NetworkMarketer.fromJson(Map<String, dynamic> json) =>
      _$NetworkMarketerFromJson(json);
  Map<String, dynamic> toJson() => _$NetworkMarketerToJson(this);
}

@JsonSerializable()
class NetworkMarketerUser {
  const NetworkMarketerUser(
      {required this.id, required this.email, required this.username});

  final String id;
  final String email;
  final String username;

  factory NetworkMarketerUser.fromJson(Map<String, dynamic> json) =>
      _$NetworkMarketerUserFromJson(json);
  Map<String, dynamic> toJson() => _$NetworkMarketerUserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class NetworkMarketerInfo {
  const NetworkMarketerInfo({
    required this.id,
    @JsonKey(name: 'referral_token') required this.referralToken,
    required this.user,
    required this.status,
    @JsonKey(name: 'is_active') required this.isActive,
  });

  final String id;
  final String referralToken;
  final NetworkMarketerUser user;
  final String status;
  final bool isActive;

  factory NetworkMarketerInfo.fromJson(Map<String, dynamic> json) =>
      _$NetworkMarketerInfoFromJson(json);
  Map<String, dynamic> toJson() => _$NetworkMarketerInfoToJson(this);
}

@JsonSerializable()
class DashboardSummary {
  const DashboardSummary({
    @JsonKey(name: 'total_earnings') required this.totalEarnings,
    @JsonKey(name: 'pending_earnings') required this.pendingEarnings,
    @JsonKey(name: 'paid_earnings') required this.paidEarnings,
    @JsonKey(name: 'total_shops') required this.totalShops,
    @JsonKey(name: 'active_shops') required this.activeShops,
    @JsonKey(name: 'total_orders') required this.totalOrders,
    @JsonKey(name: 'this_month_earnings') required this.thisMonthEarnings,
    @JsonKey(name: 'cached_at') this.cachedAt,
  });

  final String totalEarnings;
  final String pendingEarnings;
  final String paidEarnings;
  final int totalShops;
  final int activeShops;
  final int totalOrders;
  final String thisMonthEarnings;
  final String? cachedAt;

  factory DashboardSummary.fromJson(Map<String, dynamic> json) =>
      _$DashboardSummaryFromJson(json);
  Map<String, dynamic> toJson() => _$DashboardSummaryToJson(this);
}

@JsonSerializable()
class ReferredShop {
  const ReferredShop({
    required this.id,
    required this.name,
    @JsonKey(name: 'approval_status') required this.approvalStatus,
    @JsonKey(name: 'total_orders') required this.totalOrders,
    @JsonKey(name: 'commission_earned') required this.commissionEarned,
    @JsonKey(name: 'last_order_date') this.lastOrderDate,
    @JsonKey(name: 'referred_at') required this.referredAt,
    @JsonKey(name: 'is_active') required this.isActive,
  });

  final String id;
  final String name;
  final String approvalStatus;
  final int totalOrders;
  final String commissionEarned;
  final String? lastOrderDate;
  final String referredAt;
  final bool isActive;

  factory ReferredShop.fromJson(Map<String, dynamic> json) =>
      _$ReferredShopFromJson(json);
  Map<String, dynamic> toJson() => _$ReferredShopToJson(this);
}

@JsonSerializable()
class EarningsHistory {
  const EarningsHistory({
    required this.id,
    required this.date,
    required this.amount,
    required this.status,
    @JsonKey(name: 'shop_id') required this.shopId,
    @JsonKey(name: 'shop_name') required this.shopName,
    @JsonKey(name: 'order_id') required this.orderId,
    @JsonKey(name: 'transaction_id') required this.transactionId,
    required this.metadata,
  });

  final String id;
  final String date;
  final String amount;
  final String status;
  final String shopId;
  final String shopName;
  final String orderId;
  final String transactionId;
  final Map<String, String> metadata;

  factory EarningsHistory.fromJson(Map<String, dynamic> json) =>
      _$EarningsHistoryFromJson(json);
  Map<String, dynamic> toJson() => _$EarningsHistoryToJson(this);
}

@JsonSerializable()
class EarningsTimeSeriesData {
  const EarningsTimeSeriesData({
    required this.period,
    @JsonKey(name: 'period_key') required this.periodKey,
    @JsonKey(name: 'total_earnings') required this.totalEarnings,
    @JsonKey(name: 'transaction_count') required this.transactionCount,
    @JsonKey(name: 'order_count') required this.orderCount,
  });

  final String period;
  final String periodKey;
  final String totalEarnings;
  final int transactionCount;
  final int orderCount;

  factory EarningsTimeSeriesData.fromJson(Map<String, dynamic> json) =>
      _$EarningsTimeSeriesDataFromJson(json);
  Map<String, dynamic> toJson() => _$EarningsTimeSeriesDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class EarningsTimeSeriesResponse {
  const EarningsTimeSeriesResponse({
    required this.period,
    @JsonKey(name: 'start_date') this.startDate,
    @JsonKey(name: 'end_date') this.endDate,
    required this.data,
    @JsonKey(name: 'total_periods') required this.totalPeriods,
    @JsonKey(name: 'total_earnings') required this.totalEarnings,
  });

  final String period;
  final String? startDate;
  final String? endDate;
  final List<EarningsTimeSeriesData> data;
  final int totalPeriods;
  final String totalEarnings;

  factory EarningsTimeSeriesResponse.fromJson(Map<String, dynamic> json) =>
      _$EarningsTimeSeriesResponseFromJson(json);
  Map<String, dynamic> toJson() => _$EarningsTimeSeriesResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PaginatedEarningsHistory {
  const PaginatedEarningsHistory({
    required this.count,
    required this.page,
    @JsonKey(name: 'page_size') required this.pageSize,
    @JsonKey(name: 'total_pages') required this.totalPages,
    required this.results,
  });

  final int count;
  final int page;
  final int pageSize;
  final int totalPages;
  final List<EarningsHistory> results;

  factory PaginatedEarningsHistory.fromJson(Map<String, dynamic> json) =>
      _$PaginatedEarningsHistoryFromJson(json);
  Map<String, dynamic> toJson() => _$PaginatedEarningsHistoryToJson(this);
}

@JsonSerializable()
class ShopPerformanceSummary {
  const ShopPerformanceSummary({
    @JsonKey(name: 'total_shops') required this.totalShops,
    @JsonKey(name: 'active_shops') required this.activeShops,
    @JsonKey(name: 'total_commission_earned')
    required this.totalCommissionEarned,
    @JsonKey(name: 'total_orders_generated') required this.totalOrdersGenerated,
  });

  final int totalShops;
  final int activeShops;
  final String totalCommissionEarned;
  final int totalOrdersGenerated;

  factory ShopPerformanceSummary.fromJson(Map<String, dynamic> json) =>
      _$ShopPerformanceSummaryFromJson(json);
  Map<String, dynamic> toJson() => _$ShopPerformanceSummaryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ShopPerformanceResponse {
  const ShopPerformanceResponse({required this.shops, required this.summary});

  final List<ReferredShop> shops;
  final ShopPerformanceSummary summary;

  factory ShopPerformanceResponse.fromJson(Map<String, dynamic> json) =>
      _$ShopPerformanceResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ShopPerformanceResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class NetworkMarketerDashboard {
  const NetworkMarketerDashboard({
    required this.marketer,
    required this.summary,
    @JsonKey(name: 'referred_shops') required this.referredShops,
    @JsonKey(name: 'recent_earnings') required this.recentEarnings,
  });

  final NetworkMarketerInfo marketer;
  final DashboardSummary summary;
  final List<ReferredShop> referredShops;
  final List<EarningsHistory> recentEarnings;

  factory NetworkMarketerDashboard.fromJson(Map<String, dynamic> json) =>
      _$NetworkMarketerDashboardFromJson(json);
  Map<String, dynamic> toJson() => _$NetworkMarketerDashboardToJson(this);
}

@JsonSerializable()
class NotificationData {
  const NotificationData({
    required this.type,
    required this.title,
    required this.message,
    @JsonKey(name: 'image_url') this.imageUrl,
    @JsonKey(name: 'action_url') this.actionUrl,
    @JsonKey(name: 'order_id') this.orderId,
    @JsonKey(name: 'product_id') this.productId,
    @JsonKey(name: 'shop_id') this.shopId,
    this.code,
    @JsonKey(name: 'deep_link') this.deepLink,
    this.metadata,
  });

  final String type;
  final String title;
  final String message;
  final String? imageUrl;
  final String? actionUrl;
  final String? orderId;
  final String? productId;
  final String? shopId;
  final String? code;
  final String? deepLink;
  final Map<String, String>? metadata;

  factory NotificationData.fromJson(Map<String, dynamic> json) =>
      _$NotificationDataFromJson(json);
  Map<String, dynamic> toJson() => _$NotificationDataToJson(this);
}
