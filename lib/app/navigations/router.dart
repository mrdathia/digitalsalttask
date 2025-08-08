import 'package:digitalsalttask/app/views/screens/splash.dart';
import 'package:digitalsalttask/app/views/screens/login.dart';
import 'package:flutter/material.dart';

import 'app_routes.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case AppRoutes.login: 
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case AppRoutes.dashboard:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case AppRoutes.searchDetails:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      default:
        return MaterialPageRoute(builder: (context) => SplashScreen());
    }
  }
}
