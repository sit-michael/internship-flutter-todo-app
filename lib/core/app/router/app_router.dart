import 'package:flutter/material.dart';

import 'app_routes_export.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case SpalshScreen.id:
        return MaterialPageRoute(builder: (_) => const SpalshScreen());
      case RecycleBinScreen.id:
        return MaterialPageRoute(builder: (_) => const RecycleBinScreen());
      case TabsScreen.id:
        return MaterialPageRoute(builder: (_) => const TabsScreen());

      default:
        return null;
    }
  }
}
