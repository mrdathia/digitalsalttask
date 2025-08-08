import 'package:digitalsalttask/app/core/app_strings.dart';
import 'package:digitalsalttask/app/navigations/app_routes.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onDoubleTap: () {
            Navigator.of(context).pushReplacementNamed(AppRoutes.home);
          },
          child: Text(AppStrings.splash),
        ),
      ),
    );
  }
}
