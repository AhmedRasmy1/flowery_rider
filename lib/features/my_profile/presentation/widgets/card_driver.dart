import 'package:flowery_rider/core/resources/color_manager.dart';
import 'package:flowery_rider/core/resources/routes_manager.dart';
import 'package:flowery_rider/core/resources/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/cashed_image.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../edit_profile/presentation/pages/edit_profile_view.dart';
import '../../domain/entities/profile_data_entity.dart';

class CardDriver extends StatelessWidget {
  const CardDriver({
    super.key,
    this.profileData,
  });

  final DriverEntity? profileData;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 5,
      child: ListTile(
        splashColor: ColorManager.pink.withOpacity(.5),
        title: Text(
          "${profileData?.firstName} ${profileData?.lastName}",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: getBoldStyle(color: ColorManager.black, fontSize: 18),
        ),
        onTap: () {

          Navigator.pushNamed(context, RoutesManager.editProfileView);
        },
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: AppSize.s8,
            ),
            Text(
              profileData?.email ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: getRegularStyle(color: ColorManager.black, fontSize: 16),
            ),
            SizedBox(
              height: AppSize.s8,
            ),
            Text(
              profileData?.phone ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: getRegularStyle(color: ColorManager.black, fontSize: 16),
            ),
          ],
        ),
        leading: Container(
          clipBehavior: Clip.antiAlias,
          width: AppSize.s50,
          height: AppSize.s50,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
          child: CashedImage(
              height: AppSize.s50,
              width: AppSize.s50,
              sizeIndicator: AppSize.s10,
              url: profileData?.nIDImg ?? ''),/// wrong ////////////////
        ),
        trailing: SvgPicture.asset(AssetsManager.arrowRight),
      ),
    );
  }
}
