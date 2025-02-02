import 'package:flutter/material.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../data/models/my_orders_response.dart';

class CustomCardOrderDetailsForMyOrdersPage extends StatelessWidget {
  const CustomCardOrderDetailsForMyOrdersPage({super.key, this.productInfo});

  final OrderItems? productInfo;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.all(0),
      child: ListTile(
        splashColor: ColorManager.pink.withOpacity(.5),
        onTap: () {},
        contentPadding: EdgeInsets.all(10),
        minTileHeight: 8,
        minVerticalPadding: 10,
        // horizontalTitleGap: 8,
        title: Text(
          'Red roses,15 Pink Rose Bouquet',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: getRegularStyle(
              color: ColorManager.blackPrice, fontSize: AppSize.s14),
        ),
        trailing: Text(
          'X1',
          style:
              getSemiBoldStyle(color: ColorManager.pink, fontSize: AppSize.s14),
        ),
        leading: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
          child: Image.asset(
            "assets/images/image 2.png",
            height: 45,
            fit: BoxFit.fill,
          ),
        ),
        subtitle: Text(
          'EGP ${productInfo?.product?.price} ',
          style: getSemiBoldStyle(color: ColorManager.black, fontSize: 13),
        ),
      ),
    );
  }
}
