import 'dart:io';

import 'package:flowery_rider/core/functions/extenstions.dart';
import 'package:flowery_rider/core/widgets/custom_elevated_button.dart';
import 'package:flowery_rider/features/edit_profile/presentation/widgets/add_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/functions/helper.dart';
import '../../../../core/resources/app_constants.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/resources/theme_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/utils/cashed_data_shared_preferences.dart';
import '../../../../core/widgets/add_image.dart';
import '../../../../core/widgets/crop_Image_edite.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/image_size.dart';
import 'package:path/path.dart' as path;
class EditVehicleView extends StatefulWidget {
  const EditVehicleView({super.key});

  @override
  State<EditVehicleView> createState() => _EditVehicleViewState();
}

class _EditVehicleViewState extends State<EditVehicleView> {


  final TextEditingController _vehicleNumberController = TextEditingController(
     text: CacheService.getData(key: CacheConstants.vehicleNumber),
  );
  final TextEditingController _vehicleLicenseController = TextEditingController(
    text: CacheService.getData(key: CacheConstants.vehicleLicense),
  );

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Color buttonColor = ColorManager.pink;
  File? logeImageFile;
  String typeVehicle=CacheService.getData(key: CacheConstants.vehicleType)??'';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: AppPadding.p12,
                      left: AppPadding.p16,
                      right: AppPadding.p16),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomAppBar(
                          title: AppLocalizations.of(context)!.editVehicle,
                          color: ColorManager.black,
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        const SizedBox(height: AppSize.s36),
                        DropdownButtonFormField<String>(
                          value: null,
                          onChanged: (type) {
                            setState(() {
                            });
                          },
                          hint:Text(typeVehicle),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppLocalizations.of(context)!.pleaseSelectVehicleType;
                            }
                            return null;
                          },
                          items: vehicleType.map((vehicleType) {
                            return DropdownMenuItem<String>(
                              value: vehicleType,
                              child: Text(vehicleType),
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
                        ),

                        const SizedBox(height: AppSize.s24),
                        CustomTextFormField(
                          controller: _vehicleNumberController,
                          labelText: AppLocalizations.of(context)!.vehicleNumber,
                          hintText: AppLocalizations.of(context)!.enterValidVehicleNumber,
                          obscureText: false,
                          validator: (value) => validateNotEmpty(
                              value, AppLocalizations.of(context)!.enterValidEmail),
                        ),
                        const SizedBox(height: AppSize.s24),
                        CustomTextFormField(
                          validator: (value) => validateNotEmpty(
                              value, AppLocalizations.of(context)!.enterValidEmail),
                          enabled: true,
                          controller: _vehicleLicenseController,
                          labelText: AppLocalizations.of(context)!.vehicleLicense,
                           hintText:AppLocalizations.of(context)!.enterValidVehicleNumber,
                          suffix: Padding(
                            padding: const EdgeInsets.only(left: AppPadding.p16),
                            child: InkWell(
                              onTap: ()
                                async {
                                  await AddImage.showCupertinoModalPopupAddImage(context,
                                      gallery: () async {
                                        XFile? xFile =
                                        await ImagePicker().pickImage(source: ImageSource.gallery);
                                        if (xFile != null) {
                                          File originalImageFile = File(xFile.path);
                                          /// open edite image
                                          File? editeImageFiled = await cropImage(originalImageFile);
                                          if (editeImageFiled != null) {
                                            /// change size image
                                            File resizedImageFile = await resizeAndCompressImage(
                                                imageFile: editeImageFiled, width: 800, quality: 95);
                                            setState(() {
                                              logeImageFile = resizedImageFile;
                                              _vehicleLicenseController.text = path.basename(logeImageFile!.path);

                                            });
                                          }
                                        }
                                      }, camera: () async {
                                        XFile? xFile =
                                        await ImagePicker().pickImage(source: ImageSource.camera);
                                        if (xFile != null) {
                                          File originalImageFile = File(xFile.path);
                                          File? editeImageFiled = await cropImage(originalImageFile);
                                          if (editeImageFiled != null) {
                                            File resizedImageFile = await resizeAndCompressImage(
                                                imageFile: editeImageFiled, width: 800, quality: 95);
                                            setState(() {
                                              logeImageFile = resizedImageFile;
                                              _vehicleLicenseController.text = path.basename(logeImageFile!.path);

                                            });
                                          }
                                        }
                                      });
                              },
                              child: Padding(
                                padding:
                                const EdgeInsets.only(right: AppPadding.p16),
                                  child: SvgPicture.asset(AssetsManager.upLoadImage),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomElevatedButton(buttonColor: buttonColor, title: 'Update', onPressed: (){}),
          ),
          SizedBox(height: 70,)
        ],
      ),
    );
  }
}
List<String> vehicleType = [
  'Car',
  'Motorcycle',
  'Truck',
  'Bus',
  'Electric Vehicle',
  'Heavy Vehicle',
  'Sports Vehicle',
];
