import 'package:flutter/material.dart';

import '../../features/edit_profile/presentation/pages/edit_profile_view.dart';
import '../../features/edit_vehicle/presentation/pages/edit_vehicle_view.dart';
import '../../features/layout/presentation/pages/layout_view.dart';
import '../../on_boarding.dart';

class RoutesManager {
  static const String onBoarding = '/';
  static const String layoutRoute = '/layoutRoute';
  static const String editProfileView = '/editProfileView';
  static const String editVehicle = '/editVehicle';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesManager.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoarding());
      case RoutesManager.layoutRoute:
        return MaterialPageRoute(builder: (_) => const LayoutView());
      case RoutesManager.editProfileView:
        return MaterialPageRoute(builder: (_) => const EditProfileView());
      case RoutesManager.editVehicle:
        return MaterialPageRoute(builder: (_) => const EditVehicleView());
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
