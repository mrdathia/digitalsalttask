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
    return Column(
      children: [
        Container(height: kToolbarHeight + MediaQuery.of(context).padding.top),
        Text(AppStrings.password, style: Theme.of(context).textTheme.bodyMedium),
        TextFormField(
          onChanged: loginNotifier.setUsername,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 20), // Internal padding
          ),
        ),
        SizedBox(height: 24),
        Text(AppStrings.password, style: Theme.of(context).textTheme.bodyMedium),
        TextFormField(
          onChanged: loginNotifier.setPassword,
          obscureText: !ref.watch(loginNotifierProvider.select((s) => s.showPassword)),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 20), // Internal padding
            suffixIcon: GestureDetector(
              onTap: loginNotifier.toggleShowPassword,
              child: Icon(
                !ref.watch(loginNotifierProvider.select((s) => s.showPassword))
                    ? Icons.visibility_off
                    : Icons.visibility,
              ),
            ),
            hintText: AppStrings.passwordHint,
            //   fillColor: const Color.fromARGB(30, 173, 205, 219),
            //   filled: true,
          ),
        ),
        Row(
          children: [
            ExpandedElevatedButton(
              childWidget: !ref.watch(loginNotifierProvider.select((s) => s.isLoggedIn))
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text(AppStrings.createAC),
              onPressed: ref.watch(loginNotifierProvider.select((s) => s.isLoggedIn))
                  ? () {}
                  : () async {
                      await loginNotifier.signUp();
                      if (ref.watch(loginNotifierProvider.select((s) => s.isLoggedIn))) {
                        if (context.mounted) {
                          Navigator.pushReplacementNamed(context, AppRoutes.home);
                        }
                      }
                    },
            ),
          ],
        ),
      ],
    );
  }
}
