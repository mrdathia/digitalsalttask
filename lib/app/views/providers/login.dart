import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../navigations/app_routes.dart';
import 'login_state.dart';

class LoginNotifier extends Notifier<LoginState> {
  @override
  LoginState build() => const LoginState();

  void setUsername(String val) => state = state.copyWith(username: val);

  void setPassword(String val) => state = state.copyWith(password: val);

  void toggleShowPassword() => state = state.copyWith(showPassword: !state.showPassword);

  void checkIsLoggedIn(BuildContext context) {
    state = state.copyWith(isCheckingSession: false);
    if (state.isLoggedIn && context.mounted) {
      Navigator.of(context).pushReplacementNamed(AppRoutes.home);
    }
  }

  Future<void> signUp() async {
    state = state.copyWith(isLoading: true);

    await Future.delayed(const Duration(seconds: 2));

    if (state.username == 'admin' && state.password == 'admin') {
      state = state.copyWith(isLoggedIn: true, error: '', isLoading: false);
    } else {
      state = state.copyWith(isLoggedIn: false, error: 'Invalid credentials', isLoading: false);
    }
  }

  Future<void> login() async {
    state = state.copyWith(isLoading: true);

    await Future.delayed(const Duration(seconds: 2));

    if (state.username == 'admin' && state.password == 'admin') {
      state = state.copyWith(isLoggedIn: true, error: '', isLoading: false);
    } else {
      state = state.copyWith(isLoggedIn: false, error: 'Invalid credentials', isLoading: false);
    }
  }

  void logout() => state = const LoginState();
}

final loginNotifierProvider = NotifierProvider<LoginNotifier, LoginState>(LoginNotifier.new);
