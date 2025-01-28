import 'dart:io';
import 'package:flowery_rider/core/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flowery_rider/core/di/di.dart';
import 'package:flowery_rider/core/functions/extenstions.dart';
import 'package:flowery_rider/core/resources/color_manager.dart';
import 'package:flowery_rider/core/widgets/custom_app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/functions/helper.dart';
import '../../../../core/resources/app_constants.dart';
import '../../../../core/resources/routes_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/utils/utilss.dart';
import '../../../../core/widgets/add_image.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../forget_password/presentation/widgets/show_error_dialogue.dart';
import '../../../forget_password/presentation/widgets/show_loading_dialog.dart';
import '../view_model/register_view_model/register_cubit.dart';
import '../view_model/register_view_model/register_state.dart';
import '../widgets/choose_gender.dart';
import '../widgets/country_selection.dart';
import '../widgets/show_validation_dialog.dart';
import '../widgets/vehicle_type_selection.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  String? selectedCountry;

  late RegisterViewModel viewModel;
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _secondNameController = TextEditingController();
  final TextEditingController _vehicleNumberController =
      TextEditingController();
  final TextEditingController _vehicleLiceController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _idNumberController = TextEditingController();
  final TextEditingController _idImageController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Color buttonColor = ColorManager.darkGrey;
  bool _hasStartedTyping = false;
  String? selectedVehicleId;

  @override
  void initState() {
    viewModel = getIt.get<RegisterViewModel>();
    super.initState();
  }

  void _onTextChanged(String text) {
    if (!_hasStartedTyping && text.isNotEmpty) {
      _hasStartedTyping = true;
      _phoneController.text = '+2$text';
      _phoneController.selection =
          TextSelection.collapsed(offset: _phoneController.text.length);
    }
    if (text.isEmpty) {
      _hasStartedTyping = false;
    }
  }

  File? _vehicleLicenseImage;
  File? _idImage;
  bool isButtonEnabled=false;

  void validateInputs(){

    isButtonEnabled=_formKey.currentState?.validate()??false;

  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: SafeArea(
          child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocListener<RegisterViewModel, RegisterState>(
          listener: (context, state) {
            if (state is LoadingRegisterState) {
              showLoadingDialog(context);
            }
            if (state is ErrorRegisterState) {
              Navigator.of(context).pop();
              var message = extractErrorMessage(state.exception);
              showErrorDialog(context, message);
            }
            if (state is SuccessRegisterState) {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, RoutesManager.successApply);
            }
          },
          child: Padding(
            padding: const EdgeInsets.only(
                top: AppPadding.p8,
                left: AppPadding.p16,
                right: AppPadding.p16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: AppSize.s10,
                ),
                CustomAppBar(
                  title: AppLocalizations.of(context)!.applyAppBar,
                  color: ColorManager.black,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  height: AppSize.s24,
                ),
                Text(
                  AppLocalizations.of(context)!.welcome,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),
                SizedBox(
                  height: AppSize.s8,
                ),
                Text(
                  AppLocalizations.of(context)!.youWantBeDelivery,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: ColorManager.grey,
                      fontSize: 16),
                ),
                Text(
                  AppLocalizations.of(context)!.joinOurTeam,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: ColorManager.grey),
                ),
                Form(
                  key: _formKey,
                  onChanged: validateInputs,
                  child: Flexible(
                    child: ListView(
                      children: [
                        SizedBox(
                          height: AppSize.s32,
                        ),
                        CountrySelection(
                          onCountryChanged: (countryName) {
                            setState(() {
                              selectedCountry = countryName;
                            });
                          },
                          initialCountry: selectedCountry,
                        ),
                        SizedBox(
                          height: AppSize.s29,
                        ),
                        CustomTextFormField(
                            keyboardType: TextInputType.text,
                            controller: _firstNameController,
                            labelText:
                                AppLocalizations.of(context)!.firstLegalName,
                            hintText: AppLocalizations.of(context)!
                                .enterFirstLegalName,
                            validator: (value) => validateString(
                                  value: value!,
                                  messageLength: AppLocalizations.of(context)!
                                      .messageLength3,
                                  messageInvalid: AppLocalizations.of(context)!
                                      .invalidInput,
                                  message: AppLocalizations.of(context)!
                                      .enterFirstLegalName,
                                ),
                        ),
                        SizedBox(
                          height: AppSize.s29,
                        ),
                        CustomTextFormField(
                          controller: _secondNameController,
                          labelText: AppLocalizations.of(context)!.secondName,
                          hintText: AppLocalizations.of(context)!
                              .enterSecondLegalName,
                          validator: (value) => validateString(
                            value: value!,
                            messageLength:
                                AppLocalizations.of(context)!.messageLength3,
                            messageInvalid:
                                AppLocalizations.of(context)!.invalidInput,
                            message: AppLocalizations.of(context)!
                                .enterSecondLegalName,
                          ),
                        ),
                        SizedBox(
                          height: AppSize.s29,
                        ),
                        VehicleTypeSelection(
                          onVehicleSelected: (vehicleId) {
                            setState(() {
                              selectedVehicleId = vehicleId;
                            });
                          },
                        ),
                        SizedBox(
                          height: AppSize.s29,
                        ),
                        CustomTextFormField(
                          keyboardType: TextInputType.number,
                          controller: _vehicleNumberController,
                          labelText: AppLocalizations.of(context)!.vehicleNumber,
                          hintText:  AppLocalizations.of(context)!.enterTheVehicleNumber,
                          validator: (value) =>  validateVehicleNumber(
                            value: value!,
                            messageInvalid: AppLocalizations.of(context)!.invalidInput,
                            message: AppLocalizations.of(context)!.enterTheVehicleNumber,
                            messageLength:AppLocalizations.of(context)!.enterValidateVehicleNumber ,
                          ),
                        ),
                        SizedBox(
                          height: AppSize.s29,
                        ),
                        CustomTextFormField(
                          keyboardType: TextInputType.name,
                          controller: _vehicleLiceController,
                          labelText: AppLocalizations.of(context)!.vehicleLicense,
                          hintText: AppLocalizations.of(context)!.uploadLicensePhoto,
                          suffix: InkWell(
                              onTap: () async {
                                await AddImage.showCupertinoModalPopupAddImage(
                                    context, gallery: () async {
                                  XFile? xFile = await ImagePicker()
                                      .pickImage(source: ImageSource.gallery);
                                  if (xFile != null) {
                                    File originalImageFile = File(xFile.path);
                                    setState(() {
                                      _vehicleLiceController.text =
                                          originalImageFile.path;
                                      _vehicleLicenseImage = originalImageFile;
                                    });
                                  }
                                }, camera: () async {
                                  XFile? xFile = await ImagePicker()
                                      .pickImage(source: ImageSource.camera);
                                  if (xFile != null) {
                                    File originalImageFile = File(xFile.path);
                                    setState(() {
                                      _vehicleLiceController.text =
                                          originalImageFile.path;
                                      _vehicleLicenseImage = originalImageFile;
                                    });
                                  }
                                });
                              },
                              child: Icon(
                                Icons.file_upload_outlined,
                                size: 24,
                              )),
                        ),
                        SizedBox(
                          height:AppSize.s29,
                        ),
                        CustomTextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailController,
                          labelText: AppLocalizations.of(context)!.email,
                          hintText:
                              AppLocalizations.of(context)!.enterYourEmail,
                          validator: (value) => validateEmail(
                            value: value!,
                            message: AppLocalizations.of(context)!.emailIsEmpty,
                            messageInvalid:
                                AppLocalizations.of(context)!.enterValidEmail,
                          ),
                        ),
                        SizedBox(
                          height: AppSize.s29,
                        ),
                        CustomTextFormField(
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                          labelText: AppLocalizations.of(context)!.phoneNumber,
                          hintText:
                              AppLocalizations.of(context)!.enterPhoneNumber,
                         // onChanged: _onTextChanged,
                          obscureText: false,
                          validator:  (value) => validatePhoneNumber(
                            value,
                            AppLocalizations.of(context)!.enterValidPhoneNumber,
                          ),
                        ),
                        SizedBox(
                            height: AppSize.s29
                        ),
                        CustomTextFormField(
                          keyboardType: TextInputType.number,
                          controller: _idNumberController,
                          labelText: AppLocalizations.of(context)!.idNumber,
                          hintText: AppLocalizations.of(context)!.enterNationalIdNumber,
                          validator: (value) =>
                              validateIdNumber(
                                  value:value!,
                                  message: AppLocalizations.of(context)!.enterValidId,
                                messageLength: AppLocalizations.of(context)!.enterValidId,
                                messageInvalid: AppLocalizations.of(context)!.enterValidId,
                                  ),
                        ),
                        SizedBox(
                            height: AppSize.s29
                        ),
                        CustomTextFormField(
                          keyboardType: TextInputType.name,
                          controller: _idImageController,
                          labelText: AppLocalizations.of(context)!.iDImage,
                          hintText: AppLocalizations.of(context)!.uploadIdImage,
                          suffix: InkWell(
                              onTap: () async {
                                await AddImage.showCupertinoModalPopupAddImage(
                                    context, gallery: () async {
                                  XFile? xFile = await ImagePicker()
                                      .pickImage(source: ImageSource.gallery);
                                  if (xFile != null) {
                                    File originalImageFile = File(xFile.path);
                                    setState(() {
                                      _idImageController.text =
                                          originalImageFile.path;
                                      _idImage = originalImageFile;
                                    });
                                  }
                                }, camera: () async {
                                  XFile? xFile = await ImagePicker()
                                      .pickImage(source: ImageSource.camera);
                                  if (xFile != null) {
                                    File originalImageFile = File(xFile.path);
                                    setState(() {
                                      _idImageController.text =
                                          originalImageFile.path;
                                      _idImage = originalImageFile;
                                    });
                                  }
                                });
                              },
                              child: Icon(Icons.file_upload_outlined)),
                        ),
                        SizedBox(
                            height: AppSize.s29
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: context.screenWidth /
                                  AppConstants.screenWidthRatio,
                              child: CustomTextFormField(
                                controller: _passwordController,
                                labelText:
                                    AppLocalizations.of(context)!.password,
                                hintText: AppLocalizations.of(context)!
                                    .enterYourPassword,
                                obscureText: true,
                                validator: (value) => validatePassword(
                                    password: _passwordController.text,
                                    messageInvalid:
                                        AppLocalizations.of(context)!
                                            .passwordInvalidFormat,
                                    messageLength: AppLocalizations.of(context)!
                                        .passwordCharactersLong,
                                    message: AppLocalizations.of(context)!
                                        .passwordNotMatch),
                              ),
                            ),
                            SizedBox(
                              width: context.screenWidth /
                                  AppConstants.screenWidthRatio,
                              child: CustomTextFormField(
                                controller: _confirmPasswordController,
                                labelText: AppLocalizations.of(context)!
                                    .confirmPassword,
                                hintText: AppLocalizations.of(context)!
                                    .enterYourConfirmPassword,
                                obscureText: true,
                                validator: (value) => validatePasswordMatch(
                                    messageIsEmpty:
                                        AppLocalizations.of(context)!
                                            .passwordIsEmpty,
                                    password: _passwordController.text,
                                    confirmPassword:
                                        _confirmPasswordController.text,
                                    message: AppLocalizations.of(context)!
                                        .passwordNotMatch),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                            height: AppSize.s41
                        ),
                        ChooseGender(viewModel: viewModel),
                        SizedBox(
                            height: AppSize.s41
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(right: 14, left: 14, bottom: 22),
                  child: Center(
                    child: SizedBox(
                      width: context.screenWidth * 0.9,
                      height: context.screenHeight * 0.063,
                      child: ElevatedButton(
                        onPressed: () {
                          if (isButtonEnabled==true){
                            _registerWithFiles();
                          }
                          else {
                            showValidationDialog(context);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorManager.pink,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        child: Text(
                          AppLocalizations.of(context)!.continueApply,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }

  void _registerWithFiles() {
    try {
      if (_idImage != null && _vehicleLicenseImage != null) {
        // Prepare files as MultipartFile

        // Call register function
        viewModel.doIntent(RegisterAction(
            country: selectedCountry ?? "",
            firstName: _firstNameController.text,
            lastName: _secondNameController.text,
            vehicleType: selectedVehicleId ?? "",
            vehicleNumber: _vehicleNumberController.text,
            vehicleLicense: _vehicleLicenseImage as File,
            nid: _idNumberController.text,
            nidImg: _idImage as File,
            email: _emailController.text,
            password: _passwordController.text,
            rePassword: _confirmPasswordController.text,
            gender: AppStrings.gender,
            phone: _phoneController.text));
      } else {
        print("Please provide all required files.");
      }
    } catch (e) {
      print("Error during registration: $e");
    }
  }

  void countrySelectedFunc(String countrySelected) {}
}
