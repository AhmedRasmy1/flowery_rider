import 'package:flowery_rider/core/resources/color_manager.dart';
import 'package:flowery_rider/core/resources/routes_manager.dart';
import 'package:flutter/material.dart';

class SuccessApplyView extends StatelessWidget {
  const SuccessApplyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle_outline,
                color: Colors.pink,
                size: 80,
              ),
              SizedBox(height: 20),
              Text(
                'Your application has been \n submitted!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Thank you for providing your application,\n we will review your application and will\n get back to you soon.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
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
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}