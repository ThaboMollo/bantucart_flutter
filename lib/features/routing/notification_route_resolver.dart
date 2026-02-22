import '../core_api/domain/models/domain_models.dart';

class NotificationRouteResolver {
  const NotificationRouteResolver._();

  static String resolve(NotificationData notification) {
    switch (notification.type) {
      case 'ORDER_UPDATE':
      case 'DELIVERY_UPDATE':
      case 'PAYMENT_SUCCESS':
      case 'PAYMENT_FAILED':
        return '/orders${notification.orderId != null ? '/${notification.orderId}' : ''}';
      case 'COURIER_ASSIGNED':
        return '/courier/orders${notification.orderId != null ? '/${notification.orderId}' : ''}';
      case 'SHOP_APPROVED':
      case 'SHOP_REJECTED':
        return '/catalog/shops${notification.shopId != null ? '/${notification.shopId}' : ''}';
      case 'NETWORK_MARKETER_APPROVED':
      case 'NETWORK_MARKETER_REJECTED':
      case 'REFERRAL_COMMISSION':
        return '/network/dashboard';
      case 'PAYOUT_COMPLETED':
        return '/finance/transactions';
      case 'PROMOTIONAL':
        return notification.productId != null
            ? '/catalog/product/${notification.productId}'
            : '/catalog';
      case 'GENERAL':
      case 'ALERT':
      default:
        return notification.deepLink ?? '/home';
    }
  }
}
