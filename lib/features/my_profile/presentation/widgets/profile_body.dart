import 'dart:developer';

import 'package:flutter/material.dart';

import '../../domain/entities/profile_data_entity.dart';
import 'app_bar_profile.dart';
import 'app_version.dart';
import 'card_driver.dart';
import 'card_vehicle.dart';
import 'change_language.dart';
import 'log_out.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({
    super.key, required this.profileData,
  });

  final DriverEntity? profileData;

  @override
  Widget build(BuildContext context) {
    log(   "${profileData?.photo}");
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              AppBarProfile(),
              SizedBox(height: 31),
              CardDriver(profileData:profileData ,),
              SizedBox(height: 24),
              CardVehicle(profileData:profileData ,),
              SizedBox(height: 24),
              ChangeLanguage(),
              LogOut(),
            ],
          ),
        ),
        AppVersion(),
      ],
    );
  }
}