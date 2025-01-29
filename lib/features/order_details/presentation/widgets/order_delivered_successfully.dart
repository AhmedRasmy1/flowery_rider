import 'package:flowery_rider/core/resources/assets_manager.dart';
import 'package:flowery_rider/core/resources/color_manager.dart';
import 'package:flowery_rider/core/resources/routes_manager.dart';
import 'package:flowery_rider/core/resources/style_manager.dart';
import 'package:flowery_rider/core/resources/values_manager.dart';
import 'package:flowery_rider/core/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OrderDeliveredSuccessfully extends StatelessWidget {
  const OrderDeliveredSuccessfully({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AssetsManager.orderSuccessfullyIcon),
              SizedBox(
                height: 32,
              ),
              Text(
                'Thank you!!',
                style: getRegularStyle(
                    color: ColorManager.discountRate, fontSize: AppSize.s24),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'The order delivered ',
                style: getSemiBoldStyle(
                    color: ColorManager.lightGrey, fontSize: AppSize.s24),
              ),
              Text(
                'successfully ',
                style: getSemiBoldStyle(
                    color: ColorManager.lightGrey, fontSize: AppSize.s24),
              ),
              SizedBox(
                height: 48,
              ),
              CustomElevatedButton(
                  buttonColor: ColorManager.pink,
                  title: 'Done',
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, RoutesManager.layoutRoute);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
