import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/launch_url.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/resources/values_manager.dart';

class CustomCardDetails extends StatelessWidget {
  const CustomCardDetails(
      {super.key,
      required this.title,
      required this.phone,
      this.name,
      required this.subTitle,
      required this.title2,
      required this.urlImage,
      required this.noIcon, this.onTap});

  final String title;
  final String title2;
  final String phone;
  final String? name;
  final String subTitle;
  final String urlImage;
  final bool noIcon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style:
                getBoldStyle(fontSize: AppSize.s18, color: ColorManager.black)),
        SizedBox(
          height: 8,
        ),
        Card(
          color: Colors.white,
          elevation: 5,
          margin: EdgeInsets.all(0),
          child: ListTile(
            contentPadding: EdgeInsets.all(10),
            minTileHeight: 8,
            minVerticalPadding: 10,
            onTap: onTap,
            // horizontalTitleGap: 8,
            title: Text(
              title2,
              style: getRegularStyle(
                  color: ColorManager.blackPrice, fontSize: AppSize.s14),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () {
                    CustomLaunchUrl.launchUrlCall(numPhone: phone);
                  },
                  child: SvgPicture.asset(
                    AssetsManager.call,
                    width: 20,
                    height: 20,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                InkWell(
                  onTap: () {
                    CustomLaunchUrl.launchUrlWhatsapp(
                      numPhone: phone,
                      name: name ?? '',
                    );
                  },
                  child: SvgPicture.asset(
                    AssetsManager.whatsapp,
                    width: 20,
                    height: 20,
                  ),
                ),
              ],
            ),
            leading: Container(
              width: 50,
              height: 50,
              clipBehavior: Clip.antiAlias,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(50)),
              child: Image.network(
                urlImage,
                fit: BoxFit.fill,
              ),
            ),
            subtitle: Row(
              children: [
                noIcon
                    ? SvgPicture.asset(
                        AssetsManager.location,
                        width: 20,
                        height: 20,
                      )
                    : SizedBox(),
                SizedBox(
                  width: 4,
                ),
                Expanded(
                    child: Text(
                      subTitle,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                )),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
