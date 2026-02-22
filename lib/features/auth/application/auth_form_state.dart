class AuthFormState {
  const AuthFormState({
    this.loading = false,
    this.error,
    this.message,
  });

  final bool loading;
  final String? error;
  final String? message;

  AuthFormState copyWith({
    bool? loading,
    String? error,
    String? message,
    bool clearError = false,
    bool clearMessage = false,
  }) {
    return AuthFormState(
      loading: loading ?? this.loading,
      error: clearError ? null : (error ?? this.error),
      message: clearMessage ? null : (message ?? this.message),
    );
  }
}
