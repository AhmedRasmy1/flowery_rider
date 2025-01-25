import '../../../../core/di/di.dart';
import '../widgets/skeleton_order_details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import '../view_model/start_order_cubit.dart';
import '../widgets/firebase_functions.dart';
import '../widgets/order_detailsV_view_body.dart';

class OrderDetailsView extends StatefulWidget {
  const OrderDetailsView({super.key, required this.orderId});

  final String orderId;

  @override
  State<OrderDetailsView> createState() => _OrderDetailsViewState();
}

class _OrderDetailsViewState extends State<OrderDetailsView> {
  final PageController _pageController = PageController();
  int currentStep = 0;
  late StartOrderCubit viewModel;

  void nextStep() async {
    if (currentStep < 4) {
      setState(() {
        currentStep++;
      });

      /// add firebase
      await startOrder();
      _pageController.animateToPage(
        currentStep,
        duration: const Duration(milliseconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void initState() {
    viewModel = getIt.get<StartOrderCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel..startOrder(widget.orderId),
      child: SafeArea(
        child: BlocBuilder<StartOrderCubit, StartOrderState>(
          builder: (context, state) {
            if (state is SuccessStartOrderState) {
              return Scaffold(
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
                        children: List.generate(4, (index) {
                          return Expanded(
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
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
                        title: currentStep < 4
                            ? buttonTitle[currentStep]
                            : buttonTitle[4],
                        onPressed: currentStep < 4
                            ? nextStep
                            : () async {
                                /// finish  add firebase

                                /// //// /// // ////
                              },
                      ),
                    ],
                  ),
                ),
              );
            } else if (state is LoadingStartOrderState) {
              return OrderDetailsSkeleton();
            } else if (state is ErrorStartOrderState) {
              return Center(child: Text('error'));
            }
            return Center(child: Text('error'));
          },
        ),
      ),
    );
  }
}

List<String> buttonTitle = [
  'Arrived at Pickup point',
  'Start deliver',
  'Arrived to the user',
  'Delivered to the user'
];
