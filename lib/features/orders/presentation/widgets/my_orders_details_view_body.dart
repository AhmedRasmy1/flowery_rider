import 'package:flowery_rider/features/orders/presentation/widgets/custom_card_order_details_for_my_orders_page.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../order_details/presentation/widgets/custom_card_address.dart';
import '../../../order_details/presentation/widgets/custom_card_order_details.dart';
import '../../../pickup_location/presentation/pages/pickup_location_view.dart';
import '../../data/models/my_orders_response.dart';
import 'custom_card_address_for_my_orders_view.dart';

class MyOrderDetailsViewBody extends StatelessWidget {
  const MyOrderDetailsViewBody({
    required this.orders,
    super.key,
  });

  // final String status;
  final Orders orders;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(
            height: 0,
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(12)),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/images/completed.png',
                    ),
                    SizedBox(width: 6),
                    Text('${orders.order?.state ?? ''}',
                        style: TextStyle(
                            color: Color(0xff0CB359),
                            fontSize: 16,
                            fontWeight: FontWeight.w500)),
                    Spacer(),
                    Text(
                      '${orders.order?.orderNumber ?? ''}',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(
                  height: 14,
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: CustomCardAddressForMyOrdersView(
            onTap: () {},
            noIcon: true,
            title: 'Pickup address',
            title2: orders.store?.name ?? '',
            phone: orders.store?.phoneNumber ?? '',
            name: orders.store?.name ?? '',
            location: orders.store?.address ?? '',
            urlImage: orders.store?.image ?? '',
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 24,
          ),
        ),
        SliverToBoxAdapter(
          child: CustomCardAddressForMyOrdersView(
            onTap: () {},
            noIcon: false,
            title: 'User address',
            title2:
                '${orders.order?.user?.firstName} ${orders.order?.user?.lastName}',
            phone: orders.order?.user?.phone ?? '',
            name:
                '${orders.order?.user?.firstName} ${orders.order?.user?.lastName}',
            location: orders.order?.user?.phone ?? '',
            urlImage: orders.order?.user?.photo ?? '',
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
          itemCount: orders.order?.orderItems?.length,
          itemBuilder: (context, index) =>
              CustomCardOrderDetailsForMyOrdersPage(
            productInfo: orders.order?.orderItems![index],
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
                    orders.order!.totalPrice.toString(),
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
                    orders.order!.paymentType ?? '',
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
