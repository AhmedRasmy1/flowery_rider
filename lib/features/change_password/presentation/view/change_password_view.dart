import '../../../../core/utils/cashed_data_shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motion_toast/motion_toast.dart';
import '../../../../core/di/di.dart';
import '../../../../core/functions/helper.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/custom_loading.dart';
import '../../../../core/resources/routes_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/utils/utilss.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../view_model/change_password_cubit.dart';
import '../view_model/change_password_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

late ChangePasswordViewModel changePasswordViewModel;

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  void initState() {
    super.initState();
    changePasswordViewModel = getIt.get<ChangePasswordViewModel>();
  }

  final _formKey = GlobalKey<FormState>();

  final TextEditingController oldPasswordController = TextEditingController();

  final TextEditingController newPasswordController = TextEditingController();

  final TextEditingController rePasswordController = TextEditingController();

  bool isButtonEnabled = false;

  void validateInputs() {
    isButtonEnabled = _formKey.currentState?.validate() ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => changePasswordViewModel,
      child: SafeArea(
        child: Scaffold(
          body: BlocListener<ChangePasswordViewModel, ChangePasswordState>(
            listenWhen: (previous, current) {
              if (current is ChangePasswordLoadingState ||
                  current is ChangePasswordErrorState ||
                  current is ChangePasswordSuccessState) {
                return true;
              }
              return false;
            },
            listener: (context, state) {
              if (state is ChangePasswordLoadingState) {
                CustomLoadingDialog.show(context);
              } else if (state is ChangePasswordErrorState) {
                var message = extractErrorMessage(state.exception);
                MotionToast.error(
                  description: Text(message),
                  animationType: AnimationType.fromLeft,
                ).show(context);
              } else if (state is ChangePasswordSuccessState) {
                MotionToast.success(
                  description: Text(AppLocalizations.of(context)!
                      .passwordChangedSuccessfully),
                  animationType: AnimationType.fromLeft,
                ).show(context);
                Navigator.pushNamed(context, RoutesManager.loginView);
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.p16),
              child: Form(
                key: _formKey,
                onChanged: validateInputs,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomAppBar(
                            title: AppLocalizations.of(context)!.resetPassword,
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                          const SizedBox(height: AppSize.s32),
                          SizedBox(
                            width: double.infinity,
                            child: CustomTextFormField(
                              controller: oldPasswordController,
                              labelText:
                                  AppLocalizations.of(context)!.currentPassword,
                              hintText: AppLocalizations.of(context)!
                                  .enterYourPassword,
                              obscureText: true,
                              validator: (value) => validatePassword(
                                  password: oldPasswordController.text,
                                  messageInvalid: AppLocalizations.of(context)!
                                      .passwordInvalidFormat,
                                  messageLength: AppLocalizations.of(context)!
                                      .passwordCharactersLong,
                                  message: AppLocalizations.of(context)!
                                      .passwordNotMatch),
                            ),
                          ),
                          const SizedBox(height: AppSize.s24),
                          SizedBox(
                            width: double.infinity,
                            child: CustomTextFormField(
                              controller: newPasswordController,
                              labelText:
                                  AppLocalizations.of(context)!.newPassword,
                              hintText: AppLocalizations.of(context)!
                                  .enterYourPassword,
                              obscureText: true,
                              validator: (value) => validatePassword(
                                  password: newPasswordController.text,
                                  messageInvalid: AppLocalizations.of(context)!
                                      .passwordInvalidFormat,
                                  messageLength: AppLocalizations.of(context)!
                                      .passwordCharactersLong,
                                  message: AppLocalizations.of(context)!
                                      .passwordNotMatch),
                            ),
                          ),
                          const SizedBox(height: AppSize.s24),
                          SizedBox(
                            width: double.infinity,
                            child: CustomTextFormField(
                              controller: rePasswordController,
                              labelText:
                                  AppLocalizations.of(context)!.confirmPassword,
                              hintText: AppLocalizations.of(context)!
                                  .enterYourConfirmPassword,
                              obscureText: true,
                              validator: (value) => validatePasswordMatch(
                                  messageIsEmpty: AppLocalizations.of(context)!
                                      .passwordIsEmpty,
                                  password: newPasswordController.text,
                                  confirmPassword: rePasswordController.text,
                                  message: AppLocalizations.of(context)!
                                      .passwordNotMatch),
                            ),
                          ),
                          const SizedBox(height: AppSize.s48),
                        ],
                      ),
                      BlocBuilder<ChangePasswordViewModel, ChangePasswordState>(
                        builder: (context, state) {
                          return SizedBox(
                            height: AppSize.s48,
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if (isButtonEnabled == true) {
                                  String savedToken = CacheService.getData(
                                      key: CacheConstants.userToken);
                                  //  String savedToken = CacheService.getData(
                                  //   key: CacheConstants.userToken);
                                  String token = "Bearer $savedToken";
                                  changePassword(token);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: isButtonEnabled
                                    ? ColorManager.lightGrey2
                                    : ColorManager.pink,
                              ),
                              child: Text(
                                AppLocalizations.of(context)!.update,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: ColorManager.white),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void changePassword(String token) {
    String currentPassword = oldPasswordController.text;
    String newPassword = newPasswordController.text;
    String rePassword = rePasswordController.text;

    changePasswordViewModel.doIntent(ChangePasswordIntent(
        oldPassword: currentPassword,
        newPassword: newPassword,
        rePassword: rePassword,
        token: token));
  }
}
