import 'package:flowery_rider/core/resources/color_manager.dart';
import 'package:flowery_rider/core/widgets/custom_app_bar.dart';
import 'package:flowery_rider/core/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

import '../widgets/order_detailsV_view_body.dart';

class OrderDetailsView extends StatefulWidget {
  const OrderDetailsView({super.key});

  @override
  State<OrderDetailsView> createState() => _OrderDetailsViewState();
}

class _OrderDetailsViewState extends State<OrderDetailsView> {
  final PageController _pageController = PageController();
  int currentStep = 0;

  void nextStep() {
    if (currentStep < 5) {
      setState(() {
        currentStep++;
      });
      _pageController.animateToPage(
        currentStep,
        duration: const Duration(milliseconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.greyTooLight,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CustomAppBar(
                title: 'Order Details',
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(5, (index) {
                  return Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4.0),
                      height: 5.0,
                      decoration: BoxDecoration(
                          color: index <= currentStep
                              ? ColorManager.percentageColor
                              : ColorManager.lightGrey3,
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  );
                }),
              ),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    OrderDetailsViewBody(
                      status: 'Accepted',
                    ),
                    OrderDetailsViewBody(
                      status: 'Accepted',
                    ),
                    OrderDetailsViewBody(
                      status: 'Picked',
                    ),
                    OrderDetailsViewBody(
                      status: ' Out for delivery',
                    ),
                    OrderDetailsViewBody(
                      status: 'Arrived',
                    ),
                    OrderDetailsViewBody(
                      status: 'Delivered ',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              CustomElevatedButton(
                buttonColor: currentStep < 4
                    ? ColorManager.pink
                    : ColorManager.placeHolderColor,
                title:
                    currentStep < 5 ? buttonTitle[currentStep] : buttonTitle[4],
                onPressed: currentStep < 5
                    ? nextStep
                    : () {
                        /// //// /// // ////
                      },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<String> buttonTitle = [
  'Arrived at Pickup point',
  'Arrived at Pickup point',
  'Start deliver',
  'Arrived to the user',
  'Delivered to the user'
];
