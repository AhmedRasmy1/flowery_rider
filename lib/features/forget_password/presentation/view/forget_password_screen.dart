import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/di.dart';
import '../../../../core/functions/helper.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/utils/utilss.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

import '../view_models/forget_password_view_model/forget_password_cubit.dart';
import '../view_models/forget_password_view_model/forget_password_state.dart';
import '../widgets/show_error_dialogue.dart';
import '../widgets/show_loading_dialog.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'email_verification_view.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

late ForgetPasswordViewModel forgetPasswordViewModel;

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  @override
  void initState() {
    forgetPasswordViewModel = getIt.get<ForgetPasswordViewModel>();
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  bool isButtonEnabled = false;

  void validateInputs() {
    isButtonEnabled = _formKey.currentState?.validate() ?? false;
  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => forgetPasswordViewModel,
      child: BlocListener<ForgetPasswordViewModel,ForgetPasswordState>(
        listenWhen: (previous, current) {
          if (current is LoadingForgetPasswordState ||
              current is ErrorForgetPasswordState ||
              current is SuccessForgetPasswordState) {
            return true;
          }
          return false;
        },
        listener: (context, state) {
          if (state is LoadingForgetPasswordState) {
            showLoadingDialog(context);
          } else if (state is ErrorForgetPasswordState) {
            var message = extractErrorMessage(state.exception);
            Navigator.of(context).pop(); // Close loading dialog
            showErrorDialog(context, message);
          } else if (state is SuccessForgetPasswordState) {
            final email = _emailController.text;
            Navigator.of(context).popUntil((route) =>
            route.isFirst); // Close dialogs before showing success
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const OtpVerificationPage(),
                    settings: RouteSettings(arguments: email)));
          }
        },
        child:Scaffold(
          body: Form(
            key: _formKey,
            onChanged: validateInputs,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  children: [
                    CustomAppBar(
                      title: AppLocalizations.of(context)!.password,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(height: AppSize.s40),
                    Text(
                      AppLocalizations.of(context)!.forgetPassword,
                      style: TextStyle(
                        fontSize: AppSize.s20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: AppSize.s24),
                    Text(
                      AppLocalizations.of(context)!
                          .forgetPasswordMessageHeader,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: AppSize.s24),
                    CustomTextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      labelText: AppLocalizations.of(context)!.email,
                      hintText: AppLocalizations.of(context)!.enterYourEmail,
                      obscureText: false,
                      validator: (value) =>
                          validateNotEmpty(value, AppStrings.enterValidEmail),
                    ),
                    const SizedBox(height: AppSize.s48),
                    BlocBuilder<ForgetPasswordViewModel, ForgetPasswordState>(
                      builder: (context, state) {
                        if (state is LoadingForgetPasswordState) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else {
                          return SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if (isButtonEnabled == true) {
                                  forgetPassword();
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: ColorManager.pink),
                              child: Text(
                                AppLocalizations.of(context)!.confirmButton,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: ColorManager.white,
                                ),
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
      )
    );
  }


  void forgetPassword() {
    String email = _emailController.text;
    forgetPasswordViewModel.doIntent(ForgetPasswordIntent(email));
  }
}
