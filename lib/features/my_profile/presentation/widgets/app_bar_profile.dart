import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import 'package:badges/badges.dart' as badges;

class AppBarProfile extends StatelessWidget {
  const AppBarProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomAppBar(
          title: AppLocalizations.of(context)?.profile,
        ),
        InkWell(
            onTap: () {
              ///   go to notifications
            },
            child: badges.Badge(
                position: badges.BadgePosition.topEnd(end: -4, top: -12),
                badgeContent: Text(
                  '10',
                  style: getRegularStyle(
                      color: Colors.white, fontSize: AppSize.s11),
                ),
                badgeStyle: badges.BadgeStyle(
                  badgeColor: ColorManager.red,
                ),
                showBadge: true,

                /// if no notification change to false
                child: SvgPicture.asset(AssetsManager.notification)

                // Icon(Icons.notifications, size: 28, color: Colors.grey),
                )),
      ],
    );
  }
}
