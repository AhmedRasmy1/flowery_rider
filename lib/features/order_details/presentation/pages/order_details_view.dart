import 'package:flowery_rider/core/resources/color_manager.dart';
import 'package:flowery_rider/core/resources/style_manager.dart';
import 'package:flowery_rider/core/resources/values_manager.dart';
import 'package:flowery_rider/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              CustomAppBar(
                title: 'Order Details',
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(
                height: 24,
              ),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: ColorManager.lightPink,
                    borderRadius: BorderRadius.circular(12)),
                child: Column(

                  children: [
                    Row(
                      children: [
                        Text('Status : ',
                            style: getBoldStyle(
                                fontSize: AppSize.s16,
                                color: ColorManager.discountRate)),
                        Text('Accepted',
                            style: getBoldStyle(
                                fontSize: AppSize.s16,
                                color: ColorManager.discountRate)),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Order ID : ',
                            style: getBoldStyle(
                                fontSize: AppSize.s16,
                                color: ColorManager.black)),
                        Text('# 123456',
                            style: getBoldStyle(
                                fontSize: AppSize.s16,
                                color: ColorManager.black)),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Wed, 03 Sep 2024, 11:00 AM  ',
                            style: getBoldStyle(
                                fontSize: AppSize.s14,
                                color: ColorManager.blackPrice)),
                      ],
                    ),


                  ],
                ),
              ),
              SizedBox(height: 16,),
              Text('Pickup address',
                  style: getBoldStyle(
                      fontSize: AppSize.s18,
                      color: ColorManager.black)),
            ],
          ),
        ),
      ),
    );
  }
}
