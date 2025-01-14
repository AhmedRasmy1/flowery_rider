
import 'package:flowery_rider/core/resources/color_manager.dart';
import 'package:flowery_rider/core/resources/style_manager.dart';
import 'package:flowery_rider/core/resources/values_manager.dart';
import 'package:flowery_rider/core/widgets/custom_app_bar.dart';
import 'package:flowery_rider/core/widgets/custom_elevated_button.dart';
import 'package:flowery_rider/features/order_details/presentation/widgets/custom_card_order_details.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_card_address.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({super.key});

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
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: 24,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
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
                            SizedBox(
                              height: 8,
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
                            SizedBox(
                              height: 8,
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
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: 16,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: CustomCardAddress(
                        title: 'Pickup address',
                        title2: 'Flowery store',
                        phone: '0201200361136',
                        name: 'mohammed zewin',
                        location: '20th st, Sheikh Zayed, Giza ',
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: 24,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: CustomCardAddress(
                        title: 'User address',
                        title2: 'Nour mohamed',
                        phone: '0201200361136',
                        name: 'mohammed zewin',
                        location: '20th st, Sheikh Zayed, Giza ',
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: 24,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Text('Order details',
                          style: getBoldStyle(
                              fontSize: AppSize.s18,
                              color: ColorManager.black)),
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: 16,
                      ),
                    ),
                    SliverList.separated(
                      itemCount: 10,
                      itemBuilder: (context, index) => CustomCardOrderDetails(),
                      separatorBuilder: (context, index) => SizedBox(
                        height: 8,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 24,
              ),
              CustomElevatedButton(
                  buttonColor: ColorManager.pink,
                  title: 'Arrived at Pickup point',
                  onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}
