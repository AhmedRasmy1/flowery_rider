import 'dart:io';

import 'package:flowery_rider/core/di/di.dart';
import 'package:flowery_rider/core/functions/extenstions.dart';
import 'package:flowery_rider/core/resources/color_manager.dart';
import 'package:flowery_rider/core/widgets/custom_app_bar.dart';
import 'package:flowery_rider/features/auth/data/models/requests/register_request_dto.dart';
import 'package:flowery_rider/features/auth/presentation/view_model/register/register_cubit.dart';
import 'package:flowery_rider/features/auth/presentation/view_model/register/register_state.dart';
import 'package:flowery_rider/features/auth/presentation/widgets/chooseGender.dart';
import 'package:flowery_rider/features/auth/presentation/widgets/country_selection.dart';
import 'package:flowery_rider/features/auth/presentation/widgets/vehicle_type_selection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/functions/helper.dart';
import '../../../../core/resources/app_constants.dart';
import '../../../../core/resources/routes_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/widgets/add_image.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RegisterView extends StatefulWidget {
  RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
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

  //
  // Future<void> _pickImage(
  //     ImageSource source, Function(File) onFilePicked) async {
  //   final picker = ImagePicker();
  //   final pickedFile = await picker.pickImage(source: source);
  //   if (pickedFile != null) {
  //     setState(() {
  //       onFilePicked(File(pickedFile.path));
  //     });
  //   }
  // }

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
              CircularProgressIndicator();
              // EasyLoading.show(status: 'loading...');
              // Future.delayed(const Duration(milliseconds: 600), () {
              //   EasyLoading.dismiss();
              // });
            } else if (state is SuccessRegisterState) {
              Navigator.pushReplacementNamed(
                  context, RoutesManager.successApply);
            } else if (state is ErrorRegisterState) {
              Text('something went wrong');
              // MotionToast.error(
              //   description: const Text("Invalid Email or Password"),
              //   title: const Text("Error"),
              //   animationType: AnimationType.fromLeft,
              // ).show(context);
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
                  height: 10,
                ),
                CustomAppBar(
                  title: 'Apply',
                  color: ColorManager.black,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  'Welcome!!',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'You want to be a delivery man?',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: ColorManager.grey,
                      fontSize: 16),
                ),
                Text(
                  'Join our team',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: ColorManager.grey),
                ),
                Form(
                  key: _formKey,
                  child: Flexible(
                    child: ListView(
                      children: [
                        SizedBox(
                          height: 32,
                        ),
                        CountrySelection(),
                        SizedBox(
                          height: 29,
                        ),
                        CustomTextFormField(
                          keyboardType: TextInputType.text,
                          controller: _firstNameController,
                          labelText: 'First legal name',
                          hintText: 'Enter first legal name',
                          validator: (value) =>
                              validateNotEmpty(value, "enter first name"),
                        ),
                        SizedBox(
                          height: 29,
                        ),
                        CustomTextFormField(
                          keyboardType: TextInputType.text,
                          controller: _secondNameController,
                          labelText: 'Second legal name',
                          hintText: 'Enter second legal name',
                          validator: (value) =>
                              validateNotEmpty(value, "enter second name"),
                        ),
                        SizedBox(
                          height: 29,
                        ),
                        VehicleTypeSelection(
                          onVehicleSelected: (vehicleId) {
                            setState(() {
                              selectedVehicleId = vehicleId;
                            });
                          },
                        ),
                        SizedBox(
                          height: 29,
                        ),
                        CustomTextFormField(
                          keyboardType: TextInputType.number,
                          controller: _vehicleNumberController,
                          labelText: 'Vehicle number',
                          hintText: 'Enter vehicle number',
                          validator: (value) =>
                              validateNotEmpty(value, "enter valid number"),
                        ),
                        SizedBox(
                          height: 29,
                        ),
                        CustomTextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: _vehicleLiceController,
                          labelText: 'Vehicle license',
                          hintText: 'Upload license photo',
                          suffix: InkWell(
                              onTap: () async {
                                await AddImage.showCupertinoModalPopupAddImage(
                                    context, gallery: () async {
                                  XFile? xFile = await ImagePicker()
                                      .pickImage(source: ImageSource.gallery);
                                  if (xFile != null) {
                                    File originalImageFile =
                                        File(xFile.path);
                                  }
                                }, camera: () async {
                                  XFile? xFile = await ImagePicker()
                                      .pickImage(source: ImageSource.camera);
                                  if (xFile != null) {
                                    File originalImageFile =
                                        File(xFile.path);
                                    setState(() {
                                      _vehicleLiceController.text =
                                          originalImageFile.path;
                                       _vehicleLicenseImage=originalImageFile;
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
                          height: 29,
                        ),
                        CustomTextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailController,
                          labelText: 'Email',
                          hintText: 'Enter you email',
                          validator: (value) =>
                              validateNotEmpty(value, "enter valid email"),
                        ),
                        SizedBox(
                          height: 29,
                        ),
                        CustomTextFormField(
                          keyboardType: TextInputType.phone,
                          controller: _phoneController,
                          labelText: 'Phone number',
                          hintText: 'Enter phone number',
                          validator: (value) => validateNotEmpty(
                              value, "enter correct phone number"),
                        ),
                        SizedBox(
                          height: 29,
                        ),
                        CustomTextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: _idNumberController,
                          labelText: 'ID number',
                          hintText: 'Enter national ID number',
                          validator: (value) =>
                              validateNotEmpty(value, "enter valid Id"),
                        ),
                        SizedBox(
                          height: 29,
                        ),
                        CustomTextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: _idImageController,
                          labelText: 'ID image',
                          hintText: 'Upload ID image',
                          suffix: InkWell(
                              onTap: () async {
                                await AddImage.showCupertinoModalPopupAddImage(
                                    context, gallery: () async {
                                  XFile? xFile = await ImagePicker()
                                      .pickImage(source: ImageSource.gallery);
                                  if (xFile != null) {
                                    File originalImageFile = File(xFile.path);
                                  }
                                }, camera: () async {
                                  XFile? xFile = await ImagePicker()
                                      .pickImage(source: ImageSource.camera);
                                  if (xFile != null) {
                                    File originalImageFile = File(xFile.path);
                                    setState(() {
                                      _idImageController.text = originalImageFile.path;
                                      _idImage=originalImageFile;
                                    });
                                  }
                                });
                              },
                              child: Icon(Icons.file_upload_outlined)),
                        ),
                        SizedBox(
                          height: 29,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: context.screenWidth /
                                  AppConstants.screenWidthRatio,
                              child: CustomTextFormField(
                                keyboardType: TextInputType.text,
                                controller: _passwordController,
                                labelText: 'Password',
                                hintText: 'Enter password',
                                validator: (value) => validatePassword(
                                    password: _passwordController.text,
                                    messageInvalid: "passwordInvalid",
                                    messageLength: "passwordCharactersLong",
                                    message: "passwordNotMatch"),
                              ),
                            ),
                            SizedBox(
                              width: context.screenWidth /
                                  AppConstants.screenWidthRatio,
                              child: CustomTextFormField(
                                keyboardType: TextInputType.emailAddress,
                                controller: _confirmPasswordController,
                                labelText: 'Confirm password',
                                hintText: 'Confirm password',
                                validator: (value) => validatePasswordMatch(
                                    messageIsEmpty: "passwordIsEmpty",
                                    password: _confirmPasswordController.text,
                                    confirmPassword:
                                        _confirmPasswordController.text,
                                    message: "passwordNotMatch"),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 41,
                        ),
                        ChooseGender(
                          viewModel: viewModel,
                        ),
                        SizedBox(
                          height: 41,
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
                          print(selectedVehicleId);
                          print(_firstNameController.text);
                          print(_secondNameController.text);
                          print(selectedVehicleId);
                          print(_vehicleNumberController.text);
                          print(_vehicleLicenseImage);
                          print(_idNumberController.text);
                          print(_idImage);
                          print(_emailController.text);
                          print(_passwordController.text);
                          print(_confirmPasswordController.text);
                          print(_phoneController.text);

                          // if (_formKey.currentState?.validate() ?? false) {
                          // viewModel.register(
                          //   'cairo',
                          //   _firstNameController.text,
                          //   _secondNameController.text,
                          //   selectedVehicleId!,
                          //   _vehicleNumberController.text,
                          //   _vehicleLicenseImage!,
                          //   _idNumberController.text,
                          //   _idImage!,
                          //   _emailController.text,
                          //   _passwordController.text,
                          //   _confirmPasswordController.text,
                          //   'female',
                          //   _phoneController.text,
                          // );
                          viewModel.register(
                            'cairo',
                            'shadw',
                            'ahmed',
                            selectedVehicleId!,
                            '6789',
                            _vehicleLicenseImage!,
                            '67890u',
                            _idImage!,
                            'shadwahmed30@gmail.com',
                            'ahmedShadw2342@',
                            'ahmedShadw2342@',
                            'female',
                            '01234567657',
                          );
                          // }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorManager.pink,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        child: Text(
                          'Continue',
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

  Widget _buildImagePicker({
    required File? file,
    required VoidCallback onPickImage,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onPickImage,
          child: file == null
              ? const Icon(Icons.file_upload_outlined,
                  size: 24, color: ColorManager.grey)
              : Container(
                  height: 40,
                  width: 40,
                  child: Image.file(file, fit: BoxFit.fill)),
        ),
      ],
    );
  }
}
