import 'package:flutter/material.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/resources/values_manager.dart';
import 'custom_card_address.dart';
import 'custom_card_order_details.dart';

class OrderDetailsViewBody extends StatelessWidget {
  const OrderDetailsViewBody({super.key, required this.status});

  final String status;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
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
                    Text(status,
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
                            fontSize: AppSize.s16, color: ColorManager.black)),
                    Text('# 123456',
                        style: getBoldStyle(
                            fontSize: AppSize.s16, color: ColorManager.black)),
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
                  fontSize: AppSize.s18, color: ColorManager.black)),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 16,
          ),
        ),
        SliverList.separated(
          itemCount: 3,
          itemBuilder: (context, index) => CustomCardOrderDetails(),
          separatorBuilder: (context, index) => SizedBox(
            height: 8,
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 24,
          ),
        ),
        SliverToBoxAdapter(
          child: Card(
            color: Colors.white,
            margin: EdgeInsets.all(0),
            child: Container(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Text(
                    'Total',
                    style: getSemiBoldStyle(
                        color: ColorManager.black, fontSize: 14),
                  ),
                  Spacer(),
                  Text(
                    'Egp ',
                    style: getSemiBoldStyle(
                        color: ColorManager.blackPrice, fontSize: 14),
                  ),
                  Text(
                    '3000',
                    style: getSemiBoldStyle(
                        color: ColorManager.blackPrice, fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 24,
          ),
        ),
        SliverToBoxAdapter(
          child: Card(
            color: Colors.white,
            margin: EdgeInsets.all(0),
            child: Container(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Text(
                    'Payment method',
                    style: getSemiBoldStyle(
                        color: ColorManager.black, fontSize: 14),
                  ),
                  Spacer(),
                  Text(
                    'Cash on delivery ',
                    style: getSemiBoldStyle(
                        color: ColorManager.blackPrice, fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 16,
          ),
        ),
      ],
    );
  }
}
