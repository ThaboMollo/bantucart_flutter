import '../../domain/models/domain_models.dart';

String _readString(Map<String, dynamic> json, String snake, String camel,
    {String fallback = ''}) {
  final value = json[snake] ?? json[camel];
  return value?.toString() ?? fallback;
}

bool _readBool(Map<String, dynamic> json, String snake, String camel,
    {bool fallback = false}) {
  final value = json[snake] ?? json[camel];
  if (value is bool) return value;
  if (value is String) return value.toLowerCase() == 'true';
  return fallback;
}

int _readInt(Map<String, dynamic> json, String snake, String camel,
    {int fallback = 0}) {
  final value = json[snake] ?? json[camel];
  if (value is int) return value;
  return int.tryParse(value?.toString() ?? '') ?? fallback;
}

Map<String, dynamic>? _readMap(
    Map<String, dynamic> json, String snake, String camel) {
  final value = json[snake] ?? json[camel];
  if (value is Map<String, dynamic>) return value;
  return null;
}

List<dynamic> _readList(Map<String, dynamic> json, String snake, String camel) {
  final value = json[snake] ?? json[camel];
  if (value is List<dynamic>) return value;
  return const <dynamic>[];
}

Category parseCategory(Map<String, dynamic> json) {
  return Category(
    id: _readString(json, 'id', 'id'),
    name: _readString(json, 'name', 'name'),
    slug: _readString(json, 'slug', 'slug'),
  );
}

ShopRead parseShopRead(Map<String, dynamic> json) {
  return ShopRead(
    id: _readString(json, 'id', 'id'),
    name: _readString(json, 'name', 'name'),
    rank: (json['rank'] ?? json['rank'])?.toString(),
  );
}

Product parseProduct(Map<String, dynamic> json) {
  final images = _readList(json, 'images', 'images')
      .whereType<Map<String, dynamic>>()
      .map(
        (image) => ProductImage(
          id: _readString(image, 'id', 'id'),
          image: _readString(image, 'image', 'image'),
          uploadDate: _readString(image, 'upload_date', 'uploadDate'),
        ),
      )
      .toList();

  final attributes =
      _readMap(json, 'attributes', 'attributes') ?? const <String, dynamic>{};

  return Product(
    id: _readString(json, 'id', 'id'),
    shop: parseShopRead(
        _readMap(json, 'shop', 'shop') ?? const <String, dynamic>{}),
    name: _readString(json, 'name', 'name'),
    description: _readString(json, 'description', 'description'),
    price: _readString(json, 'price', 'price'),
    isOnSale: _readBool(json, 'is_on_sale', 'isOnSale'),
    salePercentage: _readString(json, 'sale_percentage', 'salePercentage',
        fallback: '0.00'),
    images: images,
    attributes: attributes,
  );
}

CartItem parseCartItem(Map<String, dynamic> json) {
  return CartItem(
    id: _readString(json, 'id', 'id'),
    cart: _readString(json, 'cart', 'cart'),
    product: parseProduct(
        _readMap(json, 'product', 'product') ?? const <String, dynamic>{}),
    qty: _readInt(json, 'qty', 'qty', fallback: 1),
  );
}

Cart parseCart(Map<String, dynamic> json) {
  final items = _readList(json, 'items', 'items')
      .whereType<Map<String, dynamic>>()
      .map(parseCartItem)
      .toList();

  return Cart(
    id: _readString(json, 'id', 'id'),
    title: _readString(json, 'title', 'title'),
    dateCreated: (json['date_created'] ?? json['dateCreated'])?.toString(),
    lastModified: (json['last_modified'] ?? json['lastModified'])?.toString(),
    user: _readString(json, 'user', 'user'),
    items: items,
    isCheckedOut: _readBool(json, 'is_checked_out', 'isCheckedOut'),
    orderStatus: _readString(json, 'order_status', 'orderStatus'),
    shop: _readString(json, 'shop', 'shop'),
    checkoutMetadata: _readMap(json, 'checkout_metadata', 'checkoutMetadata'),
  );
}

CheckoutResponse parseCheckoutResponse(Map<String, dynamic> json) {
  return CheckoutResponse(
    delivery: _readString(json, 'delivery', 'delivery'),
    deliveryProvider:
        _readString(json, 'delivery_provider', 'deliveryProvider'),
    deliveryDetails: null,
    deliveryQuotes: json['delivery_quotes'] ?? json['deliveryQuotes'],
    link: _readString(json, 'link', 'link'),
    reference: _readString(json, 'reference', 'reference'),
    accessCode: _readString(json, 'access_code', 'accessCode'),
    price: _readString(json, 'price', 'price'),
    serviceFee: _readString(json, 'service_fee', 'serviceFee'),
    total: _readString(json, 'total', 'total'),
    courierPayment: _readString(json, 'courier_payment', 'courierPayment'),
    addresses: null,
  );
}

CheckoutCallbackResponse parseCheckoutCallbackResponse(
    Map<String, dynamic> json) {
  return CheckoutCallbackResponse(
    status: _readString(json, 'status', 'status'),
    message: _readString(json, 'message', 'message'),
    cartId: (json['cart_id'] ?? json['cartId'])?.toString(),
    transactionId:
        (json['transaction_id'] ?? json['transactionId'])?.toString(),
  );
}

Address parseAddress(Map<String, dynamic> json) {
  return Address(
    id: _readString(json, 'id', 'id'),
    street: (json['street'] ?? json['street'])?.toString(),
    suburb: (json['suburb'] ?? json['suburb'])?.toString(),
    postalCode: (json['postal_code'] ?? json['postalCode'])?.toString(),
    label: (json['label'] ?? json['label'])?.toString(),
    city: (json['city'] ?? json['city']) is int
        ? (json['city'] as int)
        : int.tryParse((json['city'] ?? '').toString()),
  );
}

BankAccount parseBankAccount(Map<String, dynamic> json) {
  return BankAccount(
    id: _readString(json, 'id', 'id'),
    createdAt: _readString(json, 'created_at', 'createdAt'),
    currency: _readString(json, 'currency', 'currency'),
    status: _readString(json, 'status', 'status'),
    paystackStatus:
        (json['paystack_status'] ?? json['paystackStatus'])?.toString(),
    paystackRecipientCode:
        (json['paystack_recipient_code'] ?? json['paystackRecipientCode'])
            ?.toString(),
    paystackRecipientType:
        (json['paystack_recipient_type'] ?? json['paystackRecipientType'])
            ?.toString(),
    balance: _readString(json, 'balance', 'balance'),
    lifetimeEarnings:
        _readString(json, 'lifetime_earnings', 'lifetimeEarnings'),
    isPrimary: _readBool(json, 'is_primary', 'isPrimary'),
    courier: (json['courier'] ?? json['courier'])?.toString(),
    networkMarketer:
        (json['network_marketer'] ?? json['networkMarketer'])?.toString(),
    shop: (json['shop'] ?? json['shop'])?.toString(),
  );
}

NetworkMarketerDashboard parseNetworkDashboard(Map<String, dynamic> json) {
  final marketer =
      json['marketer'] as Map<String, dynamic>? ?? const <String, dynamic>{};
  final marketerUser =
      marketer['user'] as Map<String, dynamic>? ?? const <String, dynamic>{};
  final summary =
      json['summary'] as Map<String, dynamic>? ?? const <String, dynamic>{};

  final referredShops = _readList(json, 'referred_shops', 'referredShops')
      .whereType<Map<String, dynamic>>()
      .map(
        (shop) => ReferredShop(
          id: _readString(shop, 'id', 'id'),
          name: _readString(shop, 'name', 'name'),
          approvalStatus:
              _readString(shop, 'approval_status', 'approvalStatus'),
          totalOrders: _readInt(shop, 'total_orders', 'totalOrders'),
          commissionEarned:
              _readString(shop, 'commission_earned', 'commissionEarned'),
          lastOrderDate:
              (shop['last_order_date'] ?? shop['lastOrderDate'])?.toString(),
          referredAt: _readString(shop, 'referred_at', 'referredAt'),
          isActive: _readBool(shop, 'is_active', 'isActive'),
        ),
      )
      .toList();

  return NetworkMarketerDashboard(
    marketer: NetworkMarketerInfo(
      id: _readString(marketer, 'id', 'id'),
      referralToken: _readString(marketer, 'referral_token', 'referralToken'),
      user: NetworkMarketerUser(
        id: _readString(marketerUser, 'id', 'id'),
        email: _readString(marketerUser, 'email', 'email'),
        username: _readString(marketerUser, 'username', 'username'),
      ),
      status: _readString(marketer, 'status', 'status'),
      isActive: _readBool(marketer, 'is_active', 'isActive'),
    ),
    summary: DashboardSummary(
      totalEarnings: _readString(summary, 'total_earnings', 'totalEarnings'),
      pendingEarnings:
          _readString(summary, 'pending_earnings', 'pendingEarnings'),
      paidEarnings: _readString(summary, 'paid_earnings', 'paidEarnings'),
      totalShops: _readInt(summary, 'total_shops', 'totalShops'),
      activeShops: _readInt(summary, 'active_shops', 'activeShops'),
      totalOrders: _readInt(summary, 'total_orders', 'totalOrders'),
      thisMonthEarnings:
          _readString(summary, 'this_month_earnings', 'thisMonthEarnings'),
      cachedAt: (summary['cached_at'] ?? summary['cachedAt'])?.toString(),
    ),
    referredShops: referredShops,
    recentEarnings: const <EarningsHistory>[],
  );
}
