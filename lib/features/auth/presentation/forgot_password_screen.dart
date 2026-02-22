import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../application/auth_controller.dart';

class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  ConsumerState<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen> {
  final _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(authControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Forgot Password')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
                controller: _email,
                decoration: const InputDecoration(labelText: 'Email')),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: state.loading
                  ? null
                  : () => ref
                      .read(authControllerProvider.notifier)
                      .forgotPassword(_email.text.trim()),
              child: state.loading
                  ? const SizedBox.square(
                      dimension: 16, child: CircularProgressIndicator())
                  : const Text('Send reset request'),
            ),
            const SizedBox(height: 8),
            if (state.message != null)
              Text(state.message!, style: const TextStyle(color: Colors.green)),
          ],
        ),
      ),
    );
  }
}
