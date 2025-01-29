import 'package:flowery_rider/core/resources/routes_manager.dart';
import 'package:flutter/material.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../home/data/response/pending__orders__response.dart';
import '../../../pickup_location/presentation/pages/pickup_location_view.dart';
import 'custom_card_address.dart';
import 'custom_card_order_details.dart';

class OrderDetailsViewBody extends StatelessWidget {
  const OrderDetailsViewBody(
      {super.key, required this.status, required this.orderDetails});

  final String status;
  final Orders orderDetails;

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
                    Text(orderDetails.orderNumber ?? '',
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
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PickupLocationView(orderDetails:orderDetails ,),
                ),
              );
            },
            noIcon: true,
            title: 'Pickup address',
            title2: orderDetails.store?.name ?? '',
            phone: orderDetails.store?.phoneNumber ?? '',
            name: orderDetails.store?.name ?? '',
            location: orderDetails.store?.address ?? '',
            urlImage: orderDetails.store?.image ?? '',
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 24,
          ),
        ),
        SliverToBoxAdapter(
          child: CustomCardAddress(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PickupLocationView(orderDetails:orderDetails ,),
                  ));
            },
            noIcon: false,
            title: 'User address',
            title2:
                '${orderDetails.user?.firstName} ${orderDetails.user?.lastName}',
            phone: orderDetails.user?.phone ?? '',
            name:
                '${orderDetails.user?.firstName} ${orderDetails.user?.lastName}',
            location: orderDetails.user?.phone ?? '',
            urlImage: orderDetails.user?.photo ?? '',
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
          itemCount: orderDetails.orderItems?.length,
          itemBuilder: (context, index) => CustomCardOrderDetails(
            productInfo: orderDetails.orderItems?[index],
          ),
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
                    orderDetails.totalPrice.toString(),
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
                    orderDetails.paymentType ?? '',
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
