import 'package:flutter/material.dart';

import '../../features/layout/presentation/pages/layout_view.dart';
import '../../on_boarding.dart';

class RoutesManager {
  static const String onBoarding = '/';
  static const String layoutRoute = '/layoutRoute';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesManager.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoarding());
      case RoutesManager.layoutRoute:
        return MaterialPageRoute(builder: (_) => const LayoutView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text("No Route Found"),
              ),
              body: const Center(child: Text("No Route Found")),
            ));
  }
}
