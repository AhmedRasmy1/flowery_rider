import 'package:flowery_rider/core/di/di.dart';
import 'package:flowery_rider/core/resources/font_manager.dart';
import 'package:flowery_rider/features/get_all_vehicles/presentation/manager/vehicles_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/resources/theme_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../get_all_vehicles/presentation/manager/vehicles_cubit.dart';

class VehicleTypeSelection extends StatefulWidget {
  final Function(String vehicleId) onVehicleSelected;

  const VehicleTypeSelection({
    Key? key,
    required this.onVehicleSelected,
  }) : super(key: key);

  @override
  State<VehicleTypeSelection> createState() => _VehicleTypeSelectionState();
}

class _VehicleTypeSelectionState extends State<VehicleTypeSelection> {
  late VehiclesViewModel vehiclesViewModel;
  String? selectedVehicleId;

  @override
  void initState() {
    super.initState();
    vehiclesViewModel = getIt.get<VehiclesViewModel>()..getAllVehicles();
    selectedVehicleId = null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => vehiclesViewModel,
      child: BlocBuilder<VehiclesViewModel, VehiclesState>(
        builder: (context, state) {
          if (state is SuccessVehiclesState) {
            return DropdownButtonFormField<String>(
              value: selectedVehicleId,
              onChanged: (newVehicleId) {
                setState(() {
                  selectedVehicleId = newVehicleId;
                  widget.onVehicleSelected(newVehicleId!);
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select a vehicle type';
                }
                return null;
              },
              items: state.vehicles.vehicles?.map((vehicle) {
                return DropdownMenuItem<String>(
                  value: vehicle.id,
                  child: Text(vehicle.type ?? 'Motor Cycle'),
                );
              }).toList(),
              isExpanded: true,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                labelText: 'Vehicle type',
                labelStyle: getRegularStyle(
                  color: ColorManager.grey,
                  fontSize: FontSize.s16,
                ),
                hintStyle: getRegularStyle(
                  color: ColorManager.placeHolderColor,
                  fontSize: FontSize.s14,
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                contentPadding: const EdgeInsets.all(AppPadding.p18),
                enabledBorder: outLintInputBorderMethod(
                  BorderSide(
                    color: ColorManager.black,
                    width: AppSize.w1_5,
                  ),
                  const BorderRadius.all(Radius.circular(AppSize.s5)),
                ),
                focusedBorder: outLintInputBorderMethod(
                  BorderSide(
                    color: ColorManager.grey,
                    width: AppSize.w1_5,
                  ),
                  const BorderRadius.all(Radius.circular(AppSize.s5)),
                ),
                errorBorder: outLintInputBorderMethod(
                  BorderSide(
                    color: ColorManager.error,
                    width: AppSize.w1_5,
                  ),
                  const BorderRadius.all(Radius.circular(AppSize.s5)),
                ),
                focusedErrorBorder: outLintInputBorderMethod(
                  BorderSide(
                    color: ColorManager.error,
                    width: AppSize.w1_5,
                  ),
                  const BorderRadius.all(Radius.circular(AppSize.s5)),
                ),
                disabledBorder: outLintInputBorderMethod(
                  BorderSide(
                    color: ColorManager.grey,
                    width: AppSize.w1_5,
                  ),
                  const BorderRadius.all(Radius.circular(AppSize.s5)),
                ),
              ),
            );
          } else if (state is LoadingVehiclesState) {
            return Text("Loading....");
          } else {
            return Text('Failed to load vehicles');
          }
        },
      ),
    );
  }
}
