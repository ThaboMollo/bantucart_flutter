import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Home')),
      body: ListView(
        children: [
          ListTile(
              title: const Text('Catalog'),
              onTap: () => context.go('/catalog')),
          ListTile(title: const Text('Cart'), onTap: () => context.go('/cart')),
          ListTile(
              title: const Text('Orders'), onTap: () => context.go('/orders')),
          ListTile(
              title: const Text('Finance + Address'),
              onTap: () => context.go('/finance')),
          ListTile(
              title: const Text('Network Dashboard'),
              onTap: () => context.go('/network/dashboard')),
        ],
      ),
    );
  }
}
