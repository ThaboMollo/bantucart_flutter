import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/courier_registration_screen.dart';
import '../../features/auth/presentation/forgot_password_screen.dart';
import '../../features/auth/presentation/login_screen.dart';
import '../../features/auth/presentation/network_marketer_registration_screen.dart';
import '../../features/auth/presentation/register_screen.dart';
import '../../features/cart/presentation/cart_screen.dart';
import '../../features/catalog/presentation/catalog_screen.dart';
import '../../features/finance/presentation/finance_address_screen.dart';
import '../../features/home/presentation/courier_home_screen.dart';
import '../../features/home/presentation/user_home_screen.dart';
import '../../features/home/presentation/welcome_screen.dart';
import '../../features/network_marketer/presentation/network_dashboard_screen.dart';
import '../../features/orders/presentation/orders_screen.dart';
import '../../features/routing/permission_gate_screen.dart';
import '../../features/session/application/session_providers.dart';
import '../../features/session/domain/session_state.dart';
import '../../features/shared/presentation/placeholder_screen.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  final sessionAsync = ref.watch(sessionControllerProvider);
  return createAppRouter(sessionAsync);
});

GoRouter createAppRouter(AsyncValue<SessionState> sessionAsync) {
  return GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) =>
            const Scaffold(body: Center(child: CircularProgressIndicator())),
      ),
      GoRoute(
          path: '/welcome', builder: (context, state) => const WelcomeScreen()),
      GoRoute(
        path: '/permissions',
        builder: (context, state) =>
            PermissionGateScreen(onContinue: () => context.go('/home')),
      ),
      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
      GoRoute(
          path: '/forgot-password',
          builder: (context, state) => const ForgotPasswordScreen()),
      GoRoute(
          path: '/register',
          builder: (context, state) => const RegisterScreen()),
      GoRoute(
          path: '/register/courier',
          builder: (context, state) => const CourierRegistrationScreen()),
      GoRoute(
        path: '/register/network-marketer',
        builder: (context, state) => const NetworkMarketerRegistrationScreen(),
      ),
      GoRoute(
          path: '/home', builder: (context, state) => const UserHomeScreen()),
      GoRoute(
          path: '/courier/home',
          builder: (context, state) => const CourierHomeScreen()),
      GoRoute(
          path: '/catalog', builder: (context, state) => const CatalogScreen()),
      GoRoute(
          path: '/catalog/product/:id',
          builder: (context, state) {
            return PlaceholderScreen(
                title: 'Product', subtitle: state.pathParameters['id']);
          }),
      GoRoute(
          path: '/catalog/shops/:id',
          builder: (context, state) {
            return PlaceholderScreen(
                title: 'Shop', subtitle: state.pathParameters['id']);
          }),
      GoRoute(path: '/cart', builder: (context, state) => const CartScreen()),
      GoRoute(
          path: '/orders', builder: (context, state) => const OrdersScreen()),
      GoRoute(
          path: '/orders/:id',
          builder: (context, state) {
            return PlaceholderScreen(
                title: 'Order', subtitle: state.pathParameters['id']);
          }),
      GoRoute(
          path: '/courier/orders/:id',
          builder: (context, state) {
            return PlaceholderScreen(
                title: 'Courier Order', subtitle: state.pathParameters['id']);
          }),
      GoRoute(
          path: '/finance',
          builder: (context, state) => const FinanceAddressScreen()),
      GoRoute(
        path: '/finance/transactions',
        builder: (context, state) =>
            const PlaceholderScreen(title: 'Transactions'),
      ),
      GoRoute(
          path: '/network/dashboard',
          builder: (context, state) => const NetworkDashboardScreen()),
      GoRoute(
          path: '/error',
          builder: (context, state) => const PlaceholderScreen(title: 'Error')),
    ],
    redirect: (context, state) {
      return resolveAppRedirect(
          sessionAsync: sessionAsync, location: state.matchedLocation);
    },
  );
}

String? resolveAppRedirect(
    {required AsyncValue<SessionState> sessionAsync,
    required String location}) {
  final isPublic = location == '/welcome' ||
      location == '/login' ||
      location == '/register' ||
      location == '/forgot-password' ||
      location == '/register/courier' ||
      location == '/register/network-marketer';

  if (sessionAsync.isLoading || sessionAsync.value == null) {
    return location == '/splash' ? null : '/splash';
  }

  final session = sessionAsync.value!;
  if (!session.isAuthenticated) {
    return isPublic ? null : '/welcome';
  }

  if (location == '/splash' || isPublic || location == '/welcome') {
    if (session.role == 'courier') {
      return '/courier/home';
    }
    return '/permissions';
  }

  return null;
}
