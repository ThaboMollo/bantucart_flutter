import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../application/auth_controller.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _email = TextEditingController();
  final _username = TextEditingController();
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _password1 = TextEditingController();
  final _password2 = TextEditingController();
  String _group = 'user';

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(authControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              initialValue: _group,
              items: const [
                DropdownMenuItem(value: 'user', child: Text('User')),
                DropdownMenuItem(value: 'courier', child: Text('Courier')),
                DropdownMenuItem(
                    value: 'network_marketer', child: Text('Network Marketer')),
              ],
              onChanged: (value) => setState(() => _group = value ?? 'user'),
              decoration: const InputDecoration(labelText: 'Role'),
            ),
            const SizedBox(height: 12),
            TextField(
                controller: _email,
                decoration: const InputDecoration(labelText: 'Email')),
            const SizedBox(height: 12),
            TextField(
                controller: _username,
                decoration: const InputDecoration(labelText: 'Username')),
            const SizedBox(height: 12),
            TextField(
                controller: _firstName,
                decoration: const InputDecoration(labelText: 'First name')),
            const SizedBox(height: 12),
            TextField(
                controller: _lastName,
                decoration: const InputDecoration(labelText: 'Last name')),
            const SizedBox(height: 12),
            TextField(
              controller: _password1,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _password2,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Confirm password'),
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
                  : () {
                      final payload = <String, dynamic>{
                        'email': _email.text.trim(),
                        'username': _username.text.trim(),
                        'first_name': _firstName.text.trim(),
                        'last_name': _lastName.text.trim(),
                        'password1': _password1.text,
                        'password2': _password2.text,
                      };
                      ref
                          .read(authControllerProvider.notifier)
                          .register(group: _group, payload: payload);
                    },
              child: state.loading
                  ? const SizedBox.square(
                      dimension: 16, child: CircularProgressIndicator())
                  : const Text('Submit registration'),
            ),
          ],
        ),
      ),
    );
  }
}
