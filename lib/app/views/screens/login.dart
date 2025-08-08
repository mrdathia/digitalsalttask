import 'package:digitalsalttask/app/core/app_strings.dart';
import 'package:digitalsalttask/app/navigations/app_routes.dart';
import 'package:digitalsalttask/app/views/atoms/expanded_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/login.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginNotifier = ref.watch(loginNotifierProvider.notifier);
    final state = ref.watch(loginNotifierProvider);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(onChanged: loginNotifier.setUsername),
            TextFormField(
              onChanged: loginNotifier.setPassword,
              obscureText: true,
              decoration: InputDecoration(
                suffixIcon: GestureDetector(
                  onTap: loginNotifier.toggleShowPassword,
                  child: Icon(loginNotifier.showPassword ? Icons.visibility_off : Icons.visibility),
                ),
                hintText: AppStrings.passwordHint,
                //   fillColor: const Color.fromARGB(30, 173, 205, 219),
                //   filled: true,
              ),
            ),
            Row(
              children: [
                ExpandedElevatedButton(
                  childWidget: loginNotifier.isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text("Login"),
                  onPressed: loginNotifier.isLoading
                      ? () {}
                      : () async {
                          await loginNotifier.login();
                          if (loginNotifier.isLoggedIn) {
                            Navigator.pushReplacementNamed(context, AppRoutes.home);
                          }
                        },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
