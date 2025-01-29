import 'package:flowery_rider/features/home/presentation/view_model/home_view_model.dart';
import 'package:flutter/material.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/style_manager.dart';

class RefreshHome extends StatelessWidget {
  const RefreshHome({super.key, required this.viewModel, required this.savedToken});
final HomeCubit viewModel;
final String savedToken;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Text(
              'No Orders ',
              style: getSemiBoldStyle(
                  color: ColorManager.pink, fontSize: 30),
            ),
            SizedBox(
              height: 24,
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                viewModel.getHomeData("Bearer $savedToken");
              },
              child: CircleAvatar(
                radius: 20,
                  backgroundColor: ColorManager.pink,
                  child: Icon(Icons.refresh,color: ColorManager.white,size: 25,)),
            ),
            SizedBox(
              height: 35,
            ),


          ],
        ));
  }
}
