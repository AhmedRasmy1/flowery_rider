import 'package:flowery_rider/core/functions/extenstions.dart';
import 'package:flowery_rider/core/resources/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/resources/color_manager.dart';
import 'core/resources/values_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 0),
                child: Lottie.asset(
                  'assets/images/welcomePhoto.json',
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                  repeat: true,
                  animate: true,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                AppLocalizations.of(context)!.welcomeTo,
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
              ),
              Text(AppLocalizations.of(context)!.appName,
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20)),
              SizedBox(
                height: 24,
              ),
              Center(
                child: SizedBox(
                  width: context.screenWidth * 0.9,
                  height: context.screenHeight * 0.063,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RoutesManager.loginRoute);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManager.pink,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.login,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: AppSize.s20),
              Center(
                child: SizedBox(
                  width: context.screenWidth * 0.9,
                  height: context.screenHeight * 0.063,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RoutesManager.registerRoute);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                        side: const BorderSide(
                            color: ColorManager.placeHolderColor),
                      ),
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.apply,
                      style: TextStyle(
                        color: ColorManager.placeHolderColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 136,
              ),
              Center(
                child: Text(
                  'v 6.3.0 - (446)',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 11),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
