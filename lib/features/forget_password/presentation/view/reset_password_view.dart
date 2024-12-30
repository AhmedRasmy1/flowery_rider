import '../../../../core/resources/routes_manager.dart';
import '../../../../core/utils/utilss.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/di.dart';
import '../../../../core/functions/helper.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/values_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../view_models/reset_password_view_model/reset_password_cubit.dart';
import '../view_models/reset_password_view_model/reset_password_state.dart';
import '../widgets/show_error_dialogue.dart';
import '../widgets/show_loading_dialog.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  late ResetPasswordViewModel viewModel;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _rePasswordController = TextEditingController();

  bool isButtonEnabled = false;

  void validateInputs() {
    isButtonEnabled = _formKey.currentState?.validate() ?? false;
  }

  @override
  void initState() {
    viewModel = getIt.get<ResetPasswordViewModel>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final String editEmail =
        ModalRoute.of(context)?.settings.arguments as String;
    return BlocProvider(
      create: (context) => viewModel,
      child: SafeArea(
        child: Scaffold(
          body: BlocListener<ResetPasswordViewModel, ResetPasswordState>(
            listenWhen: (previous, current) {
              if (current is LoadingResetPasswordState ||
                  current is ErrorResetPasswordState ||
                  current is SuccessResetPasswordState) {
                return true;
              }
              return false;
            },
            listener: (context, state) {
              if (state is LoadingResetPasswordState) {
                showLoadingDialog(context);
              } else if (state is ErrorResetPasswordState) {
                var message = extractErrorMessage(state.exception);
                Navigator.of(context).pop(); // Close loading dialog
                showErrorDialog(context, message);
              } else if (state is SuccessResetPasswordState) {
                Navigator.of(context).popUntil((route) =>
                    route.isFirst); // Close dialogs before showing success
               Navigator.pushNamed(context, RoutesManager.loginView);
              }
            },
            child: Container(
              padding: const EdgeInsets.all(AppSize.s10),
              child: Form(
                key: _formKey,
                onChanged: validateInputs,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CustomAppBar(
                            title: AppLocalizations.of(context)!.password,
                            onTap: () {
                              Navigator.pop(context);
                            }),
                        const SizedBox(height: AppSize.s48),
                        Text(AppLocalizations.of(context)!.resetPassword,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height: AppSize.s48),
                        Text(
                          AppLocalizations.of(context)!.resetPasswordMessage,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: AppSize.s48),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: double.infinity,
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
                            const SizedBox(height: AppSize.s24),
                            SizedBox(
                              width: double.infinity,
                              child: CustomTextFormField(
                                controller: _rePasswordController,
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
                                    confirmPassword: _rePasswordController.text,
                                    message: AppLocalizations.of(context)!
                                        .passwordNotMatch),
                              ),
                            ),
                            const SizedBox(height: AppSize.s48),
                          ],
                        ),
                        BlocBuilder<ResetPasswordViewModel, ResetPasswordState>(
                          builder: (context, state) {
                            if (state is LoadingResetPasswordState) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            } else {
                              return SizedBox(
                                height: AppSize.s48,
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (isButtonEnabled == true) {
                                      resetPassword(editEmail);
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: ColorManager.pink),
                                  child: Text(
                                    AppLocalizations.of(context)!.confirmButton,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: ColorManager.white),
                                  ),
                                ),
                              );
                            }
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
      ),
    );
  }

  void resetPassword(String email) {
    String password = _passwordController.text;

    viewModel.doIntent(ResetPasswordIntent(email, password));
  }
}
