import 'dart:developer';

import 'package:flowery_rider/features/auth/presentation/widgets/vehicle_type_selection.dart';
import 'package:flowery_rider/features/get_all_vehicles/presentation/manager/vehicles_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/di/di.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/routes_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../get_all_vehicles/domain/entities/vehicles_response_entity.dart';
import '../../../get_all_vehicles/presentation/manager/vehicles_cubit.dart';
import '../../domain/entities/profile_data_entity.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CardVehicle extends StatefulWidget {
  const CardVehicle({
    super.key,
    this.profileData,
  });

  final DriverEntity? profileData;

  @override
  State<CardVehicle> createState() => _CardVehicleState();
}


class _CardVehicleState extends State<CardVehicle> {
  late VehiclesViewModel viewModel;
  @override
  void initState() {
    viewModel = getIt.get<VehiclesViewModel>()..getAllVehicles();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    String vehicleType='moto';
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocBuilder<VehiclesViewModel, VehiclesState>(

        builder: (context, state) {

          if (state is SuccessVehiclesState) {
            List<VehiclesEntity> vehiclesTypes = state.vehicles.vehicles ?? [];
            log(vehiclesTypes[6].id.toString());
            log(widget.profileData!.vehicleType.toString());

            for (int i = 0; i < vehiclesTypes.length; i++) {
              if (vehiclesTypes[i].id.toString() ==
                  widget.profileData?.vehicleType.toString()
              ) {
                print('//////////////////////////////////');
                log(vehiclesTypes[i].id.toString());
                print('//////////////////////////////////');
                print(vehiclesTypes[i].id);
                vehicleType = vehiclesTypes[i].type??'sdsa';
                break;
              }
            }

            return Card(
              color: Colors.white,
              elevation: 5,
              child: ListTile(
                splashColor: ColorManager.pink.withOpacity(.5),
                onTap: () {
                  Navigator.pushNamed(context, RoutesManager.editVehicle);
                },
                title: Text(AppLocalizations.of(context)!.vehicleInfo,
                    style: getBoldStyle(
                        color: ColorManager.black, fontSize: 18)),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: AppSize.s8,
                    ),
                    Text(
                      vehicleType,
                      // widget.profileData?.vehicleType ?? '',
                      style: getRegularStyle(
                          color: ColorManager.black, fontSize: 16),
                    ),
                    SizedBox(
                      height: AppSize.s8,
                    ),
                    Text(

                      widget.profileData?.vehicleNumber ?? '',
                      style: getRegularStyle(
                          color: ColorManager.black, fontSize: 16),
                    ),
                  ],
                ),
                trailing: SvgPicture.asset(AssetsManager.arrowRight),
              ),
            );
          }
          return Card(
            color: Colors.white,
            elevation: 5,
            child: ListTile(
              splashColor: ColorManager.pink.withOpacity(.5),
              onTap: () {
                Navigator.pushNamed(context, RoutesManager.editVehicle);
              },
              title: Text(AppLocalizations.of(context)!.vehicleInfo,
                  style: getBoldStyle(color: ColorManager.black, fontSize: 18)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: AppSize.s8,
                  ),
                  Text(
                  '',
                    style: getRegularStyle(
                        color: ColorManager.black, fontSize: 16),
                  ),
                  SizedBox(
                    height: AppSize.s8,
                  ),
                  Text(
                    widget.profileData?.vehicleNumber ?? '',
                    style: getRegularStyle(
                        color: ColorManager.black, fontSize: 16),
                  ),
                ],
              ),
              trailing: SvgPicture.asset(AssetsManager.arrowRight),
            ),
          );
        },
      ),
    );
  }
}
