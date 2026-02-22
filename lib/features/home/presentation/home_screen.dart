import 'package:flutter/material.dart';

import '../../../core/config/app_config.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bantucart')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Environment: ${AppConfig.env.name}'),
            const SizedBox(height: 8),
            const Text('API: ${AppConfig.apiBaseUrl}'),
            const SizedBox(height: 24),
            const Text('Phase 1 app shell initialized.'),
          ],
        ),
      ),
    );
  }
}
