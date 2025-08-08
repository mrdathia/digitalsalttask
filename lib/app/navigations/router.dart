import 'package:flutter/material.dart';

import 'app_routes.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:

      case AppRoutes.login:

      case AppRoutes.dashboard:

      case AppRoutes.searchDetails:
      //todo: get dependency debar scheme page bro
      // return getPlatformDependentPageRoute(const SchemeSummaryScreen(schemeKey: schemeKey, schemeCurrent: schemeCurrent));
      default:

    }
    return null;
  }
}