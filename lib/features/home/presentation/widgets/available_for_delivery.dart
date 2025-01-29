import 'package:flutter/material.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';

class AvailableForDelivery extends StatelessWidget {
  const AvailableForDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Not available \n for \n delivery ',
              textAlign: TextAlign.center,
              style: getRegularStyle(
                  color: ColorManager.pink, fontSize: 30),
            ),
            SizedBox(
              height: 24,
            ),

          ],
        ));
  }
}
