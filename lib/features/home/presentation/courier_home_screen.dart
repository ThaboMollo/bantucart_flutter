import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CourierHomeScreen extends StatelessWidget {
  const CourierHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Courier Home')),
      body: ListView(
        children: [
          ListTile(
              title: const Text('Courier Orders'),
              onTap: () => context.go('/orders')),
          ListTile(
              title: const Text('Transactions'),
              onTap: () => context.go('/finance')),
        ],
      ),
    );
  }
}
