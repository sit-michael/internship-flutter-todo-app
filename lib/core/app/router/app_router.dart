import 'package:flutter/material.dart';

import 'app_routes_export.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case SplashScreen.id:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RecycleBinScreen.id:
        return MaterialPageRoute(builder: (_) => const RecycleBinScreen());
      case TabsScreen.id:
        return MaterialPageRoute(builder: (_) => const TabsScreen());

      default:
        return null;
    }
  }
}
