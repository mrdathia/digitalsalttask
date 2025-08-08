import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginNotifier extends Notifier<void> {
  String username = '';
  String password = '';
  bool isLoggedIn = false;
  bool isLoading = false;
  bool showPassword = false;
  String error = '';

  @override
  void build() {
    // nothing to initialize
  }

  void setUsername(String val) {
    username = val;
  }

  void setPassword(String val) {
    password = val;
  }

  void toggleShowPassword() {
    showPassword = !showPassword;
    state = null; // trigger UI rebuild
  }

  Future<void> login() async {
    isLoading = true;

    // Simulate login
    await Future.delayed(Duration(seconds: 2));

    if (username == 'admin' && password == 'admin') {
      isLoggedIn = true;
      error = '';
    } else {
      isLoggedIn = false;
      error = 'Invalid credentials';
    }

    isLoading = false;
  }

  void logout() {
    isLoggedIn = false;
    username = '';
    password = '';
    error = '';
  }
}

// Riverpod provider
final loginNotifierProvider = NotifierProvider<LoginNotifier, void>(() {
  return LoginNotifier();
});
