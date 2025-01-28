import 'package:flowery_rider/core/di/di.dart';
import 'package:flowery_rider/core/firebase_core/firebase_utils/firebase_utils.dart';
import 'package:flowery_rider/core/utils/cashed_data_shared_preferences.dart';
import 'package:flowery_rider/features/home/data/response/pending__orders__response.dart';
import 'package:flowery_rider/features/order_details/presentation/widgets/skeleton_order_details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/routes_manager.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import '../../data/models/request/update_order_request.dart';
import '../view_model/start_order_cubit.dart';
import '../widgets/firebase_functions.dart';
import '../widgets/order_detailsV_view_body.dart';

class OrderDetailsView extends StatefulWidget {
  const OrderDetailsView({
    super.key,
  });

  @override
  State<OrderDetailsView> createState() => _OrderDetailsViewState();
}

class _OrderDetailsViewState extends State<OrderDetailsView> {
  final PageController _pageController = PageController();
  int currentStep = CacheService.getData(key: CacheConstants.currentStep) ?? 0;
  late StartOrderCubit viewModel;
  bool isActive=true;
  @override
  void initState() {
    viewModel = getIt.get<StartOrderCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String orderId = CacheService.getData(key: CacheConstants.orderPendingId);
    return BlocProvider(
      create: (context) => viewModel,
      child: SafeArea(
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
              FutureBuilder(
                  future:
                      FirebaseUtils.fetchOrderFromFirebase(orderId: orderId),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Expanded(child: OrderDetailsSkeleton());
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Center(child: Text('Error: ${snapshot.error}')),
                      );
                    } else if (snapshot.hasData) {
                      final orderDetails = snapshot.data!;
                      return Expanded(
                        child: PageView(
                          controller: _pageController,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            OrderDetailsViewBody(
                              orderDetails: orderDetails,
                              status: stateOrder2[currentStep],
                            ),
                            // OrderDetailsViewBody(
                            //   orderDetails: orderDetails,
                            //   status: 'Picked',
                            // ),
                            // OrderDetailsViewBody(
                            //   orderDetails: orderDetails,
                            //   status: ' Out for delivery',
                            // ),
                            // OrderDetailsViewBody(
                            //   orderDetails: orderDetails,
                            //   status: 'Arrived',
                            // ),
                            // OrderDetailsViewBody(
                            //   orderDetails: orderDetails,
                            //   status: 'Delivered ',
                            // ),
                          ],
                        ),
                      );
                    } else {
                      return Center(
                        child: Text('No data found'),
                      );
                    }
                  }),
              const SizedBox(height: 24),
              CustomElevatedButton(
                buttonColor: isActive
                    ? ColorManager.pink
                    : ColorManager.placeHolderColor,
                title:
                    currentStep < 4 ? buttonTitle[currentStep] : buttonTitle[4],
                onPressed: currentStep < 4
                    ? () {
                        if (currentStep < 4) {
                          setState(() {
                            currentStep++;
                            CacheService.setData(
                                key: CacheConstants.currentStep,
                                value: currentStep);
                          });

                          if (currentStep == 1) {
                            UpdateOrderRequest state = UpdateOrderRequest();
                            state.state = 'inProgress';
                            FirebaseUtils.updateOrderState(
                                orderId,
                                OrderStateModel(
                                  status: 'inProgress',
                                  updatedAt: DateTime.now()
                                      .microsecondsSinceEpoch
                                      .toString(),
                                ),);

                            StartOrderCubit.get(context).updateOrder(state);
                          }
                          if (currentStep == 4) {

                            // currentStep++;
                            UpdateOrderRequest state = UpdateOrderRequest();
                            state.state = 'completed';
                            StartOrderCubit.get(context).updateOrder(state);
                            FirebaseUtils.updateOrderState(
                              orderId,
                              OrderStateModel(
                                status: stateOrder[currentStep],
                                updatedAt: DateTime.now()
                                    .microsecondsSinceEpoch
                                    .toString(),
                              ),);
                            CacheService.deleteItem(
                                key: CacheConstants.currentStep);
                          }
                          // _pageController.animateToPage(
                          //   currentStep,
                          //   duration: const Duration(milliseconds: 1),
                          //   curve: Curves.easeInOut,
                          // );
                        }
                      }
                    : () async {

                  if(isActive){
                    isActive =false;
                  }else{
                    Navigator.pushReplacementNamed(
                        context, RoutesManager.layoutRoute);
                    CacheService.deleteItem(
                        key: CacheConstants.currentStep);
                    currentStep = 0;
                  }



                      },
              ),
            ],
          ),
        ),
      )),
    );
  }
}

List<String> buttonTitle = [
  'Arrived at Pickup point',
  'Arrived at Pickup point',
  'Start deliver',
  'Arrived to the user',
  'Delivered to the user',
  'Delivered to the user',
];
List<String> stateOrder =['pending', 'inProgress', 'canceled', 'completed'];
List<String> stateOrder2 =['Accepted','Picked','Out for delivery','Delivered','Arrived'];
