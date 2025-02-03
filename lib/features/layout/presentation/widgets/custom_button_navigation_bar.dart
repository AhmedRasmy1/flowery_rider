import 'package:flowery_rider/features/my_profile/domain/entities/profile_data_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/di/di.dart';
import '../../../../core/functions/helper.dart';
import '../../../../core/resources/app_constants.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/utils/cashed_data_shared_preferences.dart';

import '../../../my_profile/presentation/manager/get_profile_data_cubit.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onItemTapped,
  });

  final int currentIndex;
  final Function(int) onItemTapped;

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  late GetProfileDataCubit viewModel;

  @override
  void initState() {
    viewModel = getIt<GetProfileDataCubit>()
      ..getProfileData(CacheService.getData(key: CacheConstants.userToken));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocListener<GetProfileDataCubit, GetProfileDataState>(
        listener: (context, state) {
          if (state is SuccessGetProfileDataState) {
           driverData = state.profileDataModelEntity?.driver;

          }
        },
        child: BottomNavigationBar(
          backgroundColor: ColorManager.white,
          items: [
            BottomNavigationBarItem(
              icon: buildIcon(AssetsManager.home, 0, widget.currentIndex),
              label: AppLocalizations.of(context)!.home,
            ),
            BottomNavigationBarItem(
              icon: buildIcon(AssetsManager.orders, 1, widget.currentIndex),
              label: AppLocalizations.of(context)!.orders,
            ),
            BottomNavigationBarItem(
              icon: buildIcon(AssetsManager.profile, 2, widget.currentIndex),
              label: AppLocalizations.of(context)!.profile,
            ),
          ],
          selectedFontSize: AppSize.s12,
          selectedLabelStyle: getLightStyle(color: ColorManager.lightGrey2),
          unselectedLabelStyle: getMediumStyle(color: ColorManager.lightGrey2),
          currentIndex: widget.currentIndex,
          onTap: widget.onItemTapped,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: ColorManager.pink,
        ),
      ),
    );
  }
}
