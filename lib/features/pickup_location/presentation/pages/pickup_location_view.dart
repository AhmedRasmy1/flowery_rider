
import 'package:flutter/material.dart';
import '../../../home/data/response/pending__orders__response.dart';
import '../widgets/custom_divider.dart';
import '../widgets/section_card.dart';
import '../widgets/section_map_location.dart';


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
          SectionMapLocation(orderDetails: orderDetails),
          CustomDivider(),
          SectionCard(isUser: isUser, orderDetails: orderDetails),
        ],
      ),
    );
  }
}
