import 'package:digitalsalttask/app/core/app_colors.dart';
import 'package:digitalsalttask/app/core/app_images.dart';
import 'package:digitalsalttask/app/core/app_strings.dart';
import 'package:digitalsalttask/app/navigations/app_routes.dart';
import 'package:digitalsalttask/app/views/atoms/expanded_elevated_button.dart';
import 'package:digitalsalttask/app/views/providers/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(AppImages.splashPic, height: 260),
              Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Text(
                      AppStrings.splash,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    AppStrings.splashText,
                    textAlign: TextAlign.center,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary, fontSize: 16),
                  ),
                ],
              ),
              Consumer(
                builder: (BuildContext context, WidgetRef ref, _) {
                  final _ = ref.watch(loginNotifierProvider); // watch for rebuilds

                  final loginNotifier = ref.watch(loginNotifierProvider.notifier);
                  return !ref.watch(loginNotifierProvider.select((s) => s.isCheckingSession)) &&
                          !ref.watch(loginNotifierProvider.select((s) => s.isLoggedIn))
                      ? Row(
                          children: [
                            ExpandedElevatedButton(
                              childWidget: Text(
                                AppStrings.signUp,
                                style: Theme.of(
                                  context,
                                ).textTheme.bodyMedium?.copyWith(color: AppColors.textOnPrimary, fontSize: 24),
                              ),
                              onPressed: () {
                                Navigator.of(context).pushReplacementNamed(AppRoutes.login);
                              },
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: SizedBox(
                                  height: 55,
                                  width: MediaQuery.of(context).size.width,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.background,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pushReplacementNamed(AppRoutes.login);
                                    },
                                    child: Text(
                                      AppStrings.login,
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodyMedium?.copyWith(color: AppColors.textPrimary, fontSize: 24),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: SizedBox(
                                  height: 55,
                                  width: MediaQuery.of(context).size.width,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.primaryDark,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                    ),
                                    onPressed: () => loginNotifier.checkIsLoggedIn(context),
                                    child: Text(
                                      AppStrings.checkingSession,
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodyMedium?.copyWith(color: AppColors.textOnPrimary, fontSize: 24),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
