import '../../../../core/functions/extenstions.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/routes_manager.dart';
import 'package:flutter/material.dart';

class SuccessApplyView extends StatelessWidget {
  const SuccessApplyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 158,
            ),
            Image.asset("assets/images/check-circle.png"),
            SizedBox(height: 20),
            Text(
              'Your application has been \n submitted!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Thank you for providing your application,\n we will review your application and will\n get back to you soon.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: ColorManager.grey,
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              width: context.screenWidth * 0.91,
              height: context.screenHeight * 0.063,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, RoutesManager.loginView);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorManager.pink,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            Image.asset(
              "assets/images/bgForSuccessfullyRegister.png",
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
