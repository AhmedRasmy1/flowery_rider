import 'package:flowery_rider/core/functions/extenstions.dart';
import 'package:flowery_rider/core/resources/assets_manager.dart';
import 'package:flowery_rider/features/edit_profile/presentation/widgets/add_image.dart';
import 'package:flowery_rider/features/edit_profile/presentation/widgets/skeleton_edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/functions/helper.dart';
import '../../../../core/resources/app_constants.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/utils/cashed_data_shared_preferences.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final TextEditingController _firstNameController = TextEditingController(
      text: CacheService.getData(key: CacheConstants.firstName
      ),
      );
  final TextEditingController _lastNameController = TextEditingController(
      text: CacheService.getData(key: CacheConstants.lastName),
      );
  final TextEditingController _emailController = TextEditingController(
      text: CacheService.getData(key: CacheConstants.email),
      );
  final TextEditingController _phoneController = TextEditingController(
      text: CacheService.getData(key: CacheConstants.phone),
      );
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Color buttonColor = ColorManager.pink;
String urlImage= CacheService.getData(key: CacheConstants.urlImage);
String gender= CacheService.getData(key: CacheConstants.gender);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: AppPadding.p8,
                        left: AppPadding.p16,
                        right: AppPadding.p16),
                    child: Form(
                      key: _formKey,
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
                          AddPicture(urlImage: urlImage,),
                          const SizedBox(height: AppSize.s24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: context.screenWidth /
                                    AppConstants.screenWidthRatio,
                                child: CustomTextFormField(
                                  controller: _firstNameController,
                                  labelText: AppLocalizations.of(context)!.firstName,
                                  hintText: AppLocalizations.of(context)!
                                      .enterYourFirstName,
                                  obscureText: false,
                                  validator: (value) => validateNotEmpty(
                                      value,
                                      AppLocalizations.of(context)!
                                          .entervalidfirstName),
                                ),
                              ),
                              SizedBox(
                                width: context.screenWidth /
                                    AppConstants.screenWidthRatio,
                                child: CustomTextFormField(
                                  controller: _lastNameController,
                                  labelText: AppLocalizations.of(context)!.lastName,
                                  hintText:
                                      AppLocalizations.of(context)!.enterYourLastName,
                                  obscureText: false,
                                  validator: (value) => validateNotEmpty(
                                      value,
                                      AppLocalizations.of(context)!
                                          .entervalidLastName),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: AppSize.s24),
                          CustomTextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: _emailController,
                            labelText: AppLocalizations.of(context)!.email,
                            hintText: AppLocalizations.of(context)!.enterYourEmail,
                            obscureText: false,
                            validator: (value) => validateNotEmpty(
                                value, AppLocalizations.of(context)!.enterValidEmail),
                          ),
                          const SizedBox(height: AppSize.s24),
                          CustomTextFormField(
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(
                                  left: AppPadding.p16, right: AppPadding.p16),
                              child: SvgPicture.asset(AssetsManager.password),
                            ),
                            enabled: true,
                            // keyboardType: TextInputType.visiblePassword,
                            controller: _passwordController,
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
                          ),
                          const SizedBox(height: AppSize.s24),
                          CustomTextFormField(
                            keyboardType: TextInputType.phone,
                            controller: _phoneController,
                            labelText: AppLocalizations.of(context)!.phoneNumber,
                            hintText:
                                AppLocalizations.of(context)!.enterPhoneNumber,
                            obscureText: false,
                            validator: (value) => validateNotEmpty(
                                value,
                                AppLocalizations.of(context)!
                                    .enterValidPhoneNumber),
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
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Radio<String>(
                                      fillColor: WidgetStateProperty.all<Color>(
                                          ColorManager.pink),
                                      value:'male',
                                      groupValue:gender,
                                      onChanged: (String? value) {
                                      },
                                    ),
                                    Text(
                                      AppLocalizations.of(context)!.male,
                                      style: TextStyle(
                                        color: ColorManager.black,
                                        fontSize: FontSize.s17,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Radio<String>(
                                      fillColor: WidgetStateProperty.all<Color>(
                                          ColorManager.pink),
                                      value: 'female',
                                      groupValue: gender,
                                      onChanged: (String? value) {
                                      },
                                    ),
                                    Text(
                                      AppLocalizations.of(context)!.female,
                                      style: TextStyle(
                                        color: ColorManager.black,
                                        fontSize: FontSize.s17,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: AppSize.s48),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomElevatedButton(buttonColor: buttonColor, title: 'Update', onPressed: (){

              }),
            ),
            SizedBox(height: 40,)

          ],
        ),
      ),
    );
  }
}
