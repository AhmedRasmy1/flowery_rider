import '../../../../core/functions/extenstions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/functions/helper.dart';
import '../../../../core/resources/app_constants.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class SkeletonEditProfile extends StatelessWidget {
  const SkeletonEditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: AppPadding.p8,
                    left: AppPadding.p16,
                    right: AppPadding.p16),
                child: Form(
                  child: Column(
                    children: [
                      CustomAppBar(
                        title: AppLocalizations.of(context)!.editProfile,
                        color: ColorManager.black,
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      const SizedBox(height: AppSize.s24),
                      Stack(
                        children: [
                          Container(
                            clipBehavior: Clip.antiAlias,
                            height: 74,
                            width: 74,
                            decoration: BoxDecoration(
                              color: ColorManager.greyTooLight,
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          Positioned(
                              bottom: -1,
                              right: -1,
                              child: Container(
                                height: 15,
                                width: 15,
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: ColorManager.greyTooLight),
                              ))
                        ],
                      ),
                      const SizedBox(height: AppSize.s24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: context.screenWidth /
                                AppConstants.screenWidthRatio,
                            child: CustomTextFormField(
                              labelText:
                                  AppLocalizations.of(context)!.firstName,
                              hintText: AppLocalizations.of(context)!
                                  .enterYourFirstName,
                              obscureText: false,
                              validator: (value) => validateNotEmpty(
                                  value,
                                  AppLocalizations.of(context)!
                                      .entervalidfirstName),
                              controller: TextEditingController(),
                            ),
                          ),
                          SizedBox(
                            width: context.screenWidth /
                                AppConstants.screenWidthRatio,
                            child: CustomTextFormField(
                              labelText: AppLocalizations.of(context)!.lastName,
                              hintText: AppLocalizations.of(context)!
                                  .enterYourLastName,
                              obscureText: false,
                              validator: (value) => validateNotEmpty(
                                  value,
                                  AppLocalizations.of(context)!
                                      .entervalidLastName),
                              controller: TextEditingController(),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSize.s24),
                      CustomTextFormField(
                        keyboardType: TextInputType.emailAddress,
                        labelText: AppLocalizations.of(context)!.email,
                        hintText: AppLocalizations.of(context)!.enterYourEmail,
                        obscureText: false,
                        validator: (value) => validateNotEmpty(value,
                            AppLocalizations.of(context)!.enterValidEmail),
                        controller: TextEditingController(),
                      ),
                      const SizedBox(height: AppSize.s24),
                      CustomTextFormField(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(
                              left: AppPadding.p16, right: AppPadding.p16),
                          child: SvgPicture.asset('assets/images/password.svg'),
                        ),
                        enabled: true,
                        // keyboardType: TextInputType.visiblePassword,

                        labelText: AppLocalizations.of(context)!.password,
                        // hintText: AppStrings.enterYourPassword,
                        // obscureText: true,
                        suffix: Padding(
                          padding: const EdgeInsets.only(left: AppPadding.p16),
                          child: InkWell(
                            onTap: () {
                              /// go to change Password
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(right: AppPadding.p16),
                              child: Text(
                                AppLocalizations.of(context)!.change,
                                style: TextStyle(
                                  color: ColorManager.pink,
                                  fontSize: FontSize.s14,
                                  fontWeight: FontWeightManager.semiBold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        controller: TextEditingController(),
                      ),
                      const SizedBox(height: AppSize.s24),
                      Focus(
                        onFocusChange: (hasFocus) {},
                        child: CustomTextFormField(
                          keyboardType: TextInputType.phone,
                          labelText: AppLocalizations.of(context)!.phoneNumber,
                          hintText:
                              AppLocalizations.of(context)!.enterPhoneNumber,
                          obscureText: false,
                          validator: (value) => validateNotEmpty(
                              value,
                              AppLocalizations.of(context)!
                                  .enterValidPhoneNumber),
                          controller: TextEditingController(),
                        ),
                      ),
                      const SizedBox(height: AppSize.s24),
                      Row(
                        children: [
                          Text(
                            AppLocalizations.of(context)!.gender,
                            style: TextStyle(
                              color: ColorManager.black,
                              fontSize: FontSize.s22,
                              fontWeight: FontWeightManager.semiBold,
                            ),
                          ),
                          const SizedBox(
                            width: AppSize.s24,
                          ),
                          // Expanded(
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.start,
                          //     crossAxisAlignment: CrossAxisAlignment.center,
                          //     children: [
                          //       Radio<String>(
                          //         fillColor: WidgetStateProperty.all<Color>(
                          //             ColorManager.pink),
                          //         value: 'male',
                          //         groupValue: _userGenderController.text,
                          //         // activeColor: ColorManager.pink,
                          //         onChanged: (String? value) {
                          //           // setState(() {
                          //           //   _userGenderController.text = value!;
                          //           // });
                          //         },
                          //       ),
                          //       Text(
                          //         AppLocalizations.of(context)!.male,
                          //         style: TextStyle(
                          //           color: ColorManager.black,
                          //           fontSize: FontSize.s17,
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          // Expanded(
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.start,
                          //     crossAxisAlignment: CrossAxisAlignment.center,
                          //     children: [
                          //       Radio<String>(
                          //         fillColor: WidgetStateProperty.all<Color>(
                          //             ColorManager.pink),
                          //         value:'female',
                          //         groupValue: _userGenderController.text,
                          //         // activeColor: ColorManager.pink,
                          //         onChanged: (String? value) {
                          //           // setState(() {
                          //           //   _userGenderController.text = value!;
                          //           // });
                          //         },
                          //       ),
                          //       Text(
                          //         AppLocalizations.of(context)!.female,
                          //         style: TextStyle(
                          //           color: ColorManager.black,
                          //           fontSize: FontSize.s17,
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
                      const SizedBox(height: AppSize.s48),
                      // BlocConsumer<EditprofileCubit, EditprofileState>(
                      //   listener: (context, state) {
                      //     if (state is EditprofileLoading) {
                      //       CustomLoadingDialog.show(context);
                      //     } else if (state is EditprofileSuccess) {
                      //       MotionToast.success(
                      //         description: Text(
                      //             AppLocalizations.of(context)!.profileUpdated),
                      //         animationType: AnimationType.fromLeft,
                      //       ).show(context);
                      //       Navigator.pop(context);
                      //     } else if (state is EditprofileFail) {
                      //       String? message;
                      //       if (state.exception is ServerError) {
                      //         message = (state.exception as ServerError)
                      //             .serverMessage ??
                      //             'somethingWentWrong';
                      //         log('=================$message');
                      //       } else {
                      //         message = 'somethingWentWrong';
                      //       }
                      //       MotionToast.error(
                      //         description: Text(message),
                      //         animationType: AnimationType.fromLeft,
                      //       ).show(context);
                      //     }
                      //   },
                      //   builder: (context, state) {
                      //     return CustomElevatedButton(
                      //       buttonColor: buttonColor,
                      //       title: AppLocalizations.of(context)!.update,
                      //       onPressed: () {
                      //         validationMethod(
                      //           actionPress: () {
                      //             viewModel.editProfile(
                      //               _firstNameController.text,
                      //               _lastNameController.text,
                      //               _emailController.text,
                      //               _phoneController.text,
                      //             );
                      //             profileViewModel.getProfileData(
                      //               CacheService.getData(
                      //                 key: CacheConstants.userToken,
                      //               ),
                      //             );
                      //           },
                      //           updateButtonColor: (Color color) {
                      //             setState(() {
                      //               buttonColor = color;
                      //             });
                      //           },
                      //           formKey: _formKey,
                      //         );
                      //       },
                      //     );
                      //   },
                      // )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
