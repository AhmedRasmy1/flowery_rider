import 'package:flutter/material.dart';

import '../../../../core/resources/color_manager.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      height: 5,
      width: 65,
      decoration: BoxDecoration(
          color: ColorManager.pink,
          borderRadius: BorderRadius.circular(12)),
    );
  }
}