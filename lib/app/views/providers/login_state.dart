class LoginState {
  final String username;
  final String password;
  final bool isFresh;
  final bool isLoggedIn;
  final bool isCheckingSession;
  final bool isLoading;
  final bool showPassword;
  final String error;

  const LoginState({
    this.username = '',
    this.password = '',
    this.isFresh = false,
    this.isLoggedIn = false,
    this.isCheckingSession = true,
    this.isLoading = false,
    this.showPassword = false,
    this.error = '',
  });

  LoginState copyWith({
    String? username,
    String? password,
    bool? isFresh,
    bool? isLoggedIn,
    bool? isCheckingSession,
    bool? isLoading,
    bool? showPassword,
    String? error,
  }) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      isFresh: isFresh ?? this.isFresh,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      isCheckingSession: isCheckingSession ?? this.isCheckingSession,
      isLoading: isLoading ?? this.isLoading,
      showPassword: showPassword ?? this.showPassword,
      error: error ?? this.error,
    );
  }
}
