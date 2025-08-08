import 'package:digitalsalttask/app/core/app_colors.dart';
import 'package:digitalsalttask/app/navigations/app_routes.dart';
import 'package:digitalsalttask/app/navigations/router.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRoutes.splash,
      onGenerateRoute: AppRouter.generateRoute,
      theme: ThemeData(
        textTheme: TextTheme(
          displayLarge: GoogleFonts.poppins(
            fontSize: 57,
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w900,
            letterSpacing: 0.5,
            shadows: [const Shadow(blurRadius: 5.0, color: Colors.grey, offset: Offset(2, 2))],
          ),
          displayMedium: GoogleFonts.poppins(
            fontSize: 45,
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.4,
          ),
          displaySmall: GoogleFonts.poppins(
            fontSize: 36,
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.3,
          ),
          headlineLarge: GoogleFonts.poppins(
            fontSize: 32,
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.3,
          ),
          headlineMedium: GoogleFonts.poppins(fontSize: 28, color: Colors.blueAccent, fontWeight: FontWeight.w500),
          headlineSmall: GoogleFonts.poppins(fontSize: 24, color: Colors.blueAccent, fontWeight: FontWeight.w500),
          titleLarge: GoogleFonts.poppins(
            fontSize: 22,
            color: AppColors.textSecondary,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.2,
          ),
          titleMedium: GoogleFonts.poppins(fontSize: 16, color: AppColors.textPrimary, fontWeight: FontWeight.w500),
          titleSmall: GoogleFonts.poppins(fontSize: 14, color: AppColors.textPrimary, fontWeight: FontWeight.w500),
          bodyLarge: GoogleFonts.poppins(
            fontSize: 16,
            color: AppColors.textPrimary,
            fontWeight: FontWeight.normal,
            letterSpacing: 0.4,
          ),
          bodyMedium: GoogleFonts.poppins(
            fontSize: 14,
            color: AppColors.textPrimary,
            fontWeight: FontWeight.normal,
            letterSpacing: 0.1,
          ),
          bodySmall: GoogleFonts.poppins(
            fontSize: 12,
            color: AppColors.textPrimary,
            fontWeight: FontWeight.normal,
            letterSpacing: 0.1,
          ),
          labelLarge: GoogleFonts.poppins(
            fontSize: 14,
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
          ),
          labelMedium: GoogleFonts.poppins(fontSize: 12, color: AppColors.textPrimary, fontWeight: FontWeight.bold),
          labelSmall: GoogleFonts.poppins(fontSize: 11, color: AppColors.textPrimary, fontWeight: FontWeight.bold),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
      ),
    );
  }
}
