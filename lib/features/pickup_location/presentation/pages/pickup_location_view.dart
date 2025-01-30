import 'package:flowery_rider/core/resources/assets_manager.dart';
import 'package:flowery_rider/core/resources/color_manager.dart';
import 'package:flowery_rider/features/pickup_location/presentation/widgets/custom_card_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../home/data/response/pending__orders__response.dart';

class PickupLocationView extends StatelessWidget {
  const PickupLocationView(
      {super.key, required this.orderDetails, required this.isUser});

  final Orders orderDetails;
  final bool isUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height * .60,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: ColorManager.placeHolderColor,
                    ),
                    color: ColorManager.grey),
              ),
              Positioned(
                top: 64,
                left: 18,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset(AssetsManager.backIcon),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 16),
            height: 5,
            width: 65,
            decoration: BoxDecoration(
                color: ColorManager.pink,
                borderRadius: BorderRadius.circular(12)),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: isUser
                  ? Column(
                      children: [
                        CustomCardDetails(
                            title: 'User address',
                            phone: orderDetails.user?.phone ?? '',
                            subTitle: orderDetails.user?.phone ?? '',
                            title2:
                                "${orderDetails.user?.firstName} ${orderDetails.user?.lastName}",
                            urlImage:
                                'https://flower.elevateegy.com/uploads/default-profile.png',
                            noIcon: false),
                        SizedBox(
                          height: 24,
                        ),
                        CustomCardDetails(
                            title: 'Pickup address',
                            phone: orderDetails.store?.phoneNumber ?? '',
                            subTitle: orderDetails.store?.address ?? '',
                            title2: orderDetails.store?.name ?? '',
                            urlImage: orderDetails.store?.image ?? '',
                            noIcon: true),
                      ],
                    )
                  : Column(
                      children: [
                        CustomCardDetails(
                            title: 'Pickup address',
                            phone: orderDetails.store?.phoneNumber ?? '',
                            subTitle: orderDetails.store?.address ?? '',
                            title2: orderDetails.store?.name ?? '',
                            urlImage: orderDetails.store?.image ?? '',
                            noIcon: true),
                        SizedBox(
                          height: 24,
                        ),
                        CustomCardDetails(
                            title: 'User address',
                            phone: orderDetails.user?.phone ?? '',
                            subTitle: orderDetails.user?.phone ?? '',
                            title2:
                                "${orderDetails.user?.firstName} ${orderDetails.user?.lastName}",
                            urlImage:
                                'https://flower.elevateegy.com/uploads/default-profile.png',
                            noIcon: false),
                      ],
                    ),
            ),
          )
        ],
      ),
    );
  }
}
