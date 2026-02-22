import 'package:flutter_test/flutter_test.dart';

import 'package:bantucart/features/core_api/domain/models/domain_models.dart';
import 'package:bantucart/features/routing/notification_route_resolver.dart';

void main() {
  test('maps notification payload to expected deep links', () {
    const notification = NotificationData(
      type: 'ORDER_UPDATE',
      title: 'Order changed',
      message: 'status update',
      orderId: 'o1',
    );

    expect(NotificationRouteResolver.resolve(notification), '/orders/o1');

    const referral = NotificationData(
      type: 'REFERRAL_COMMISSION',
      title: 'Commission',
      message: 'earned',
    );
    expect(NotificationRouteResolver.resolve(referral), '/network/dashboard');

    const fallback = NotificationData(
        type: 'GENERAL', title: 'Notice', message: 'x', deepLink: '/catalog');
    expect(NotificationRouteResolver.resolve(fallback), '/catalog');
  });
}
