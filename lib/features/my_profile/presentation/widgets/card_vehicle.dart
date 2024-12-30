import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/routes_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../domain/entities/profile_data_entity.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CardVehicle extends StatelessWidget {
  const CardVehicle({
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
        onTap: () {
          Navigator.pushNamed(context, RoutesManager.editVehicle);
        },
        title: Text(AppLocalizations.of(context)!.vehicleInfo,
            style: getBoldStyle(color: ColorManager.black, fontSize: 18)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: AppSize.s8,
            ),
            Text(
              profileData?.vehicleType ?? '',
              style: getRegularStyle(color: ColorManager.black, fontSize: 16),
            ),
            SizedBox(
              height: AppSize.s8,
            ),
            Text(
              profileData?.vehicleNumber ?? '',
              style: getRegularStyle(color: ColorManager.black, fontSize: 16),
            ),
          ],
        ),
        trailing: SvgPicture.asset(AssetsManager.arrowRight),
      ),
    );
  }
}
