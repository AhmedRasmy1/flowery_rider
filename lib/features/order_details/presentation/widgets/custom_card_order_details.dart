import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/resources/values_manager.dart';

class CustomCardOrderDetails extends StatelessWidget {
  const CustomCardOrderDetails({super.key});

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
        leading: SvgPicture.asset(AssetsManager.floweryLogo),
        subtitle: Text(
          'EGP 600 ',
          style: getSemiBoldStyle(color: ColorManager.black, fontSize: 13),
        ),
      ),
    );
  }
}
