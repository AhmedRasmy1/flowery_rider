import 'dart:developer';

import 'package:flowery_rider/core/resources/color_manager.dart';
import 'package:flowery_rider/core/utils/cashed_data_shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/di.dart';
import '../../domain/entities/profile_data_entity.dart';
import '../manager/get_profile_data_cubit.dart';
import '../widgets/app_bar_profile.dart';
import '../widgets/app_version.dart';
import '../widgets/card_driver.dart';
import '../widgets/card_vehicle.dart';
import '../widgets/log_out.dart';
import '../widgets/change_language.dart';
import '../widgets/profile_body.dart';
import '../widgets/skeleton_profile.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  late GetProfileDataCubit viewModel;

  @override
  void initState() {
    viewModel = getIt<GetProfileDataCubit>()
      ..getProfileData(CacheService.getData(key: CacheConstants.userToken));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: BlocProvider(
          create: (context) => viewModel,
          child: BlocBuilder<GetProfileDataCubit, GetProfileDataState>(
            builder: (context, state) {
              if(state is SuccessGetProfileDataState){
                 var profileData =state.profileDataModelEntity?.driver;
                return ProfileBody( profileData: profileData,);
              }
              else{
                return SkeletonProfile();
              }

            },
          ),
        ),
      ),
    );
  }
}


