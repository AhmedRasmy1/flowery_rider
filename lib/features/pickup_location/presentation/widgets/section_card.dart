import 'package:flutter/material.dart';

import '../../../home/data/response/pending__orders__response.dart';
import 'custom_card_details.dart';

class SectionCard extends StatelessWidget {
  const SectionCard({
    super.key,
    required this.isUser,
    required this.orderDetails,
  });

  final bool isUser;
  final Orders orderDetails;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}