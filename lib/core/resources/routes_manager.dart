<<<<<<< HEAD
import '../../features/auth/presentation/pages/apply_view.dart';
import '../../features/auth/presentation/pages/login_view.dart';
import '../../features/home/presentation/pages/home_view.dart';
import '../../features/layout/presentation/pages/layout_view.dart';
import '../../features/order_details/presentation/pages/order_details_view.dart';
import '../../on_boarding.dart';
=======
import 'package:flowery_rider/features/auth/presentation/pages/apply_view.dart';
import 'package:flowery_rider/features/auth/presentation/pages/login_view.dart';
import 'package:flowery_rider/features/auth/presentation/pages/success_apply_view.dart';
import 'package:flowery_rider/features/layout/presentation/pages/layout_view.dart';
import 'package:flowery_rider/on_boarding.dart';
>>>>>>> origin/feat/register
import '../../features/forget_password/presentation/view/email_verification_view.dart';
import '../../features/forget_password/presentation/view/forget_password_screen.dart';
import '../../features/forget_password/presentation/view/reset_password_view.dart';
import 'package:flutter/material.dart';

import '../../features/edit_profile/presentation/pages/edit_profile_view.dart';
import '../../features/edit_vehicle/presentation/pages/edit_vehicle_view.dart';
import '../../features/change_password/presentation/view/change_password_view.dart';

class RoutesManager {
  static const String onBoarding = '/';
  static const String layoutRoute = '/layoutRoute';
  static const String registerRoute = '/registerRoute';
  static const String loginRoute = '/loginRoute';
  static const String editProfileView = '/editProfileView';
  static const String editVehicle = '/editVehicle';
  static const String loginView = '/loginView';
  static const String emailVerificationRoute = '/emailVerification';
  static const String resetPasswordRoute = '/resetPassword';
  static const String changePasswordViewRoute = '/chanePasswordViewRoute';
  static const String forgetPasswordScreen = '/forgetPasswordScreen';
<<<<<<< HEAD
  static const String homeViewScreen = '/homeViewScreen';
  // static const String orderDetailsView = '/orderDetailsView';
=======
  static const String successApply= '/successApplyView';
>>>>>>> origin/feat/register
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesManager.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnboardingView());
      case RoutesManager.layoutRoute:
        return MaterialPageRoute(builder: (_) => const LayoutView());
      case RoutesManager.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case RoutesManager.successApply:
        return MaterialPageRoute(builder: (_) => const SuccessApplyView());
      case RoutesManager.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case RoutesManager.editProfileView:
        return MaterialPageRoute(builder: (_) => const EditProfileView());
      case RoutesManager.editVehicle:
        return MaterialPageRoute(builder: (_) => const EditVehicleView());
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
      case RoutesManager.homeViewScreen:
        return MaterialPageRoute(builder: (_) => const HomeView());
      // case RoutesManager.orderDetailsView:
      //   return MaterialPageRoute(builder: (_) => const OrderDetailsView());
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
