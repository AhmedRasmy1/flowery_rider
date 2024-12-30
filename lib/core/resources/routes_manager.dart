import 'package:flowery_rider/features/auth/presentation/pages/apply_view.dart';
import 'package:flowery_rider/features/auth/presentation/pages/forget_password.dart';
import 'package:flowery_rider/features/auth/presentation/pages/login_view.dart';
import 'package:flowery_rider/features/layout/presentation/pages/layout_view.dart';
import 'package:flutter/material.dart';

import '../../on_boarding.dart';

class RoutesManager {
  static const String onBoarding = '/';
  static const String layoutRoute = '/layoutRoute';
  static const String forgetPassword = '/forgetPasswordRoute';
  static const String registerRoute = '/registerRoute';
  static const String loginRoute = '/loginRoute';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesManager.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoarding());
      case RoutesManager.layoutRoute:
        return MaterialPageRoute(builder: (_) => const LayoutView());
      case RoutesManager.forgetPassword:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordView());
      case RoutesManager.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case RoutesManager.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginView());
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
