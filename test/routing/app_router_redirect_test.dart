import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:bantucart/core/router/app_router.dart';
import 'package:bantucart/features/session/domain/session_state.dart';

void main() {
  test('redirects unauthenticated users to welcome', () {
    final redirect = resolveAppRedirect(
      sessionAsync: const AsyncData(SessionState.unauthenticated),
      location: '/home',
    );

    expect(redirect, '/welcome');
  });

  test('redirects courier authenticated users to courier home from splash', () {
    final redirect = resolveAppRedirect(
      sessionAsync: const AsyncData(
        SessionState(
            status: SessionStatus.authenticated, userId: 'u1', role: 'courier'),
      ),
      location: '/splash',
    );

    expect(redirect, '/courier/home');
  });

  test('sends regular authenticated users through permission gate', () {
    final redirect = resolveAppRedirect(
      sessionAsync: const AsyncData(
        SessionState(
            status: SessionStatus.authenticated, userId: 'u1', role: 'user'),
      ),
      location: '/splash',
    );

    expect(redirect, '/permissions');
  });
}
