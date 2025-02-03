import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/values_manager.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.onTap,
    this.color,
  });

  final String? title;
  final void Function()? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (onTap != null)
          GestureDetector(
            onTap: onTap,
            child: SvgPicture.asset(AssetsManager.vector),
          ),
        const SizedBox(width: AppSize.s8),
        if (title != null)
          Text(
            title!,
            style: TextStyle(
              fontSize: FontSize.s20,
              color: color ?? Colors.black,
              fontWeight: FontWeightManager.medium,
            ),
          ),
      ],
    );
  }
}
class CustomAppBarHome extends StatelessWidget {
  const CustomAppBarHome({
    super.key,
    this.title,
    this.onTap,
    this.color, required this.isAvailable, this.onChanged,
  });

  final String? title;
  final void Function()? onTap;
  final Color? color;
  final bool isAvailable;
  final void Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: AppSize.s8),
        if (title != null)
          Text(
            title!,
            style: TextStyle(
              fontSize: FontSize.s20,
              color: color ?? Colors.black,
              fontWeight: FontWeightManager.bold,
            ),
          ),
        Spacer(),

        Transform.scale(
          scale: 0.7,
          child: Switch(
            activeTrackColor: ColorManager.pink,
            value: isAvailable,
            onChanged: onChanged,
            activeColor: ColorManager.white,
            inactiveThumbColor: ColorManager.pink,
          ),
        ),
      ],
    );
  }
}

