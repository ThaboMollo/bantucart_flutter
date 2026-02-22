enum SessionStatus { loading, authenticated, unauthenticated }

class SessionState {
  const SessionState({
    required this.status,
    this.userId,
    this.role,
  });

  final SessionStatus status;
  final String? userId;
  final String? role;

  static const loading = SessionState(status: SessionStatus.loading);
  static const unauthenticated =
      SessionState(status: SessionStatus.unauthenticated);

  bool get isAuthenticated => status == SessionStatus.authenticated;
}
