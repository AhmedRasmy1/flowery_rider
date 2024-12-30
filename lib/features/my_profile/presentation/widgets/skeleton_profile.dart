import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'app_bar_profile.dart';
import 'app_version.dart';
import 'card_driver.dart';
import 'card_vehicle.dart';
import 'change_language.dart';
import 'log_out.dart';

class SkeletonProfile extends StatelessWidget {
  const SkeletonProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: ListView(
          children: [
            AppBarProfile(),
            SizedBox(height: 31),
            CardDriver(),
            SizedBox(height: 24),
            CardVehicle(),
            SizedBox(height: 24),
            ChangeLanguage(),
            LogOut(),
            AppVersion(),
          ],
        ),
      ),
    );
  }
}
