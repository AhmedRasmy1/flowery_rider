import 'package:flowery_rider/features/home/data/response/pending__orders__response.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/firebase_core/firebase_utils/firebase_utils.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import '../widgets/order_detailsV_view_body.dart';
import 'custom_card_address.dart';

class OrderDetailsSkeleton extends StatefulWidget {
  const OrderDetailsSkeleton({super.key});

  @override
  State<OrderDetailsSkeleton> createState() => _OrderDetailsSkeletonState();
}

class _OrderDetailsSkeletonState extends State<OrderDetailsSkeleton> {



  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child:  ListView(
        children: [
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
                    Text('status',
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
                    Text('orderDetails.orderNumber ?? ''',
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
          SizedBox(
            height: 16,
          ),
          CustomCardAddress(
            noIcon: true,
            title: 'Pickup address',
            title2: 'orderDetails.store?.name ?? ''',
            phone: 'orderDetails.store?',
            name: 'orderDetails..name ?? ''',
            location: 'orderDetails.store?.address ?? ''',
            urlImage:"https://flower.elevateegy.com/uploads/5ed2d072-485b-4a53-a0fa-a41412791397-image_three.png" ,
          ),
          SizedBox(
            height: 16,
          ),
          CustomCardAddress(
            noIcon: true,
            title: 'Pickup address',
            title2: 'orderDetails.store?.name ?? ''',
            phone: 'orderDetails.store?',
            name: 'orderDetails..name ?? ''',
            location: 'orderDetails.store?.address ?? ''',
            urlImage:"https://flower.elevateegy.com/uploads/5ed2d072-485b-4a53-a0fa-a41412791397-image_three.png" ,
          ),
          SizedBox(
            height: 16,
          ),
          Text('title',
              style:
              getBoldStyle(fontSize: AppSize.s18, color: ColorManager.black)),
          SizedBox(
            height: 16,
          ),
          Card(
            color: Colors.white,
            margin: EdgeInsets.all(0),
            child: ListTile(
              contentPadding: EdgeInsets.all(10),
              minTileHeight: 8,
              minVerticalPadding: 10,
              // horizontalTitleGap: 8,
              title: Text(
                'title2',
                style: getRegularStyle(
                    color: ColorManager.blackPrice, fontSize: AppSize.s14),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 8,
                  ),

                ],
              ),
              leading: Container(
                width: 50,
                clipBehavior: Clip.antiAlias,
                decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(50)),
                child: Image.network(
                 " https://flower.elevateegy.com/uploads/5ed2d072-485b-4a53-a0fa-a41412791397-image_three.png",
                  fit: BoxFit.fill,
                ),
              ),
              subtitle: Row(
                children: [

                  SizedBox(
                    width: 4,
                  ),
                  Expanded(
                      child: Text(
                        'location',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      )),
                ],
              ),
            ),
          ),


        ],
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
