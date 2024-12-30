import 'package:flowery_rider/features/auth/presentation/pages/apply_view.dart';
import 'package:flowery_rider/features/auth/presentation/pages/success_apply_view.dart';
import 'package:flutter/material.dart';

import '../../on_boarding.dart';

class RoutesManager {
  static const String onBoarding = '/';
  static const String register = 'register';
  static const String successApply ='/success';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesManager.onBoarding:
        return MaterialPageRoute(builder: (_) => OnboardingView());
      case RoutesManager.register:
        return MaterialPageRoute(builder: (_) => RegisterView());
      case RoutesManager.successApply:
        return MaterialPageRoute(builder: (_) => SuccessApplyView());
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
