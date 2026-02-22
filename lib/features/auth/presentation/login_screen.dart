import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../application/auth_controller.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(authControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
                controller: _email,
                decoration: const InputDecoration(labelText: 'Email')),
            const SizedBox(height: 12),
            TextField(
              controller: _password,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            if (state.error != null)
              Text(state.error!, style: const TextStyle(color: Colors.red)),
            if (state.message != null)
              Text(state.message!, style: const TextStyle(color: Colors.green)),
            const SizedBox(height: 8),
            FilledButton(
              onPressed: state.loading
                  ? null
                  : () async {
                      final router = GoRouter.of(context);
                      final ok =
                          await ref.read(authControllerProvider.notifier).login(
                                email: _email.text.trim(),
                                password: _password.text,
                              );
                      if (!mounted) return;
                      if (ok) router.go('/home');
                    },
              child: state.loading
                  ? const SizedBox.square(
                      dimension: 16, child: CircularProgressIndicator())
                  : const Text('Login'),
            ),
            TextButton(
              onPressed: () => context.go('/forgot-password'),
              child: const Text('Forgot password'),
            ),
            TextButton(
              onPressed: () => context.go('/register'),
              child: const Text('Create account'),
            ),
          ],
        ),
      ),
    );
  }
}
