import '../../../../core/di/di.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../get_all_vehicles/presentation/manager/vehicles_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/resources/theme_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../get_all_vehicles/domain/entities/vehicles_response_entity.dart';
import '../../../get_all_vehicles/presentation/manager/vehicles_cubit.dart';

class VehicleType extends StatefulWidget {
  final String typeVehicle;

  const VehicleType({
    super.key,
    required this.typeVehicle,
  });

  @override
  State<VehicleType> createState() => _VehicleTypeState();
}

class _VehicleTypeState extends State<VehicleType> {
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
    String type = 'moto';
    return BlocProvider(
      create: (context) => vehiclesViewModel,
      child: BlocBuilder<VehiclesViewModel, VehiclesState>(
        builder: (context, state) {
          if (state is SuccessVehiclesState) {
            List<VehiclesEntity> vehiclesTypes = state.vehicles.vehicles ?? [];
            for (int i = 0; i < vehiclesTypes.length; i++) {
              if (vehiclesTypes[i].id.toString() == widget.typeVehicle) {
                type = vehiclesTypes[i].type ?? 'moto';
                break;
              }
            }
            return DropdownButtonFormField<String>(
              onChanged: (type) {
                setState(() {});
              },
              hint: Text(type),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppLocalizations.of(context)!.pleaseSelectVehicleType;
                }
                return null;
              },
              items: state.vehicles.vehicles?.map((vehicleType) {
                return DropdownMenuItem<String>(
                  value: vehicleType.id,
                  child: Text(vehicleType.type ?? ''),
                );
              }).toList(),
              isExpanded: true,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                labelText: AppLocalizations.of(context)!.vehicleType,
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
