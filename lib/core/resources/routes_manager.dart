import 'package:flowery_rider/features/auth/presentation/pages/login_view.dart';
import 'package:flowery_rider/features/forget_password/presentation/view/email_verification_view.dart';
import 'package:flowery_rider/features/forget_password/presentation/view/forget_password_screen.dart';
import 'package:flowery_rider/features/forget_password/presentation/view/reset_password_view.dart';
import 'package:flutter/material.dart';
import '../../features/change_password/presentation/view/change_password_view.dart';
import '../../on_boarding.dart';

class RoutesManager {
  static const String onBoarding = '/';
  static const String loginView='/loginView';
  static const String forgetPasswordRoute = '/forgetPassword';
  static const String emailVerificationRoute = '/emailVerification';
  static const String resetPasswordRoute = '/resetPassword';
  static const String changePasswordViewRoute = '/chanePasswordViewRoute';
  static const String forgetPasswordScreen='/forgetPasswordScreen';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesManager.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoarding());
      case RoutesManager.loginView:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case RoutesManager.resetPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ResetPasswordView());
      case RoutesManager.emailVerificationRoute:
        return MaterialPageRoute(builder: (_) => const OtpVerificationPage());
      case RoutesManager.changePasswordViewRoute:
        return MaterialPageRoute(builder: (_) => const ChangePasswordScreen());
      case RoutesManager.forgetPasswordScreen:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());

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
