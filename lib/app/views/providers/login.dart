import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginNotifier extends Notifier<void> {
  String username = '';
  String password = '';
  bool isLoggedIn = false;
  bool isLoading = false;
  String error = '';

  @override
  void build() {
    // no state to initialize
  }

  void setUsername(String val) {
    username = val;
  }

  void setPassword(String val) {
    password = val;
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
