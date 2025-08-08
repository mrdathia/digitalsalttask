import 'package:digitalsalttask/app/core/app_colors.dart';
import 'package:digitalsalttask/app/navigations/app_routes.dart';
import 'package:digitalsalttask/app/navigations/router.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRoutes.splash,
      onGenerateRoute: AppRouter.generateRoute,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
      ),

    );
  }
}