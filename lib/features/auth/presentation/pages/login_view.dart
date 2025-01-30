import 'package:flowery_rider/core/resources/custom_loading_dialog.dart';

import '../../../../core/functions/extenstions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motion_toast/motion_toast.dart';

import '../../../../core/di/di.dart';
import '../../../../core/functions/helper.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/routes_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/utils/cashed_data_shared_preferences.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../order_details/presentation/pages/order_details_view.dart';
import '../view_model/login_state.dart';
import '../view_model/login_view_model_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginView> {
  late LoginViewModel viewModel;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _errorMessage;
  bool rememberMe = false;

  @override
  void initState() {
    viewModel = getIt.get<LoginViewModel>();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
        body: BlocListener<LoginViewModel, LoginState>(
          listener: (context, state) {
            if (state is LoadingLoginState) {
              customLoadingDialog(context);
            } else if (state is SuccessLoginState) {
              if (orderPendingId?.isNotEmpty ?? false) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderDetailsView(),
                  ),
                );
              } else {
                Navigator.pushReplacementNamed(
                    context, RoutesManager.layoutRoute);
              }
            } else if (state is ErrorLoginState) {
              Navigator.pop(context);
              MotionToast.error(
                description: const Text("Invalid Email or Password"),
                title: const Text("Error"),
                animationType: AnimationType.fromLeft,
              ).show(context);
            }
          },
          child: AutofillGroup(
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(AppPadding.p16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: context.screenHeight * 0.06),
                      Text(
                        AppLocalizations.of(context)!.login,
                        style: TextStyle(
                          color: ColorManager.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: AppSize.s20),
                      CustomTextFormField(
                        autofillHints: const [AutofillHints.email],
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        labelText: AppLocalizations.of(context)!.email,
                        hintText: AppLocalizations.of(context)!.enterYourEmail,
                        validator: (value) =>
                            validateNotEmpty(value, 'Enter valid Email'),
                      ),
                      const SizedBox(height: AppSize.s24),
                      CustomTextFormField(
                        autofillHints: const [AutofillHints.password],
                        controller: _passwordController,
                        obscureText: true,
                        labelText: AppLocalizations.of(context)!.password,
                        hintText:
                            AppLocalizations.of(context)!.enterYourPassword,
                        validator: (value) => validatePasswordMatch(
                          password: _passwordController.text,
                          confirmPassword: _passwordController.text,
                          message: "Passwords don't match",
                        ),
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: rememberMe,
                            onChanged: (value) {
                              setState(() {
                                rememberMe = value ?? false;
                                viewModel.rememberMe = rememberMe;
                              });
                            },
                          ),
                          Text(
                            AppLocalizations.of(context)!.rememberMe,
                            style: TextStyle(
                              color: ColorManager.grey,
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RoutesManager.forgetPasswordScreen);
                            },
                            child: Column(
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.forgetPassword,
                                  style: TextStyle(
                                    color: ColorManager.grey,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                    decoration: TextDecoration.underline,
                                    decorationColor: ColorManager.darkGrey,
                                    decorationStyle: TextDecorationStyle.solid,
                                    decorationThickness: 1.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSize.s100),
                      if (_errorMessage != null)
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppPadding.p24),
                          child: Text(
                            _errorMessage!,
                            style: const TextStyle(
                                color: Colors.red, fontSize: 14),
                          ),
                        ),
                      Center(
                        child: SizedBox(
                          width: context.screenWidth * 0.91,
                          height: context.screenHeight * 0.063,
                          child: ElevatedButton(
                            onPressed: () async {
                              TextInput.finishAutofillContext(shouldSave: true);
                              setState(() {
                                _errorMessage = null;
                              });
                              if (_formKey.currentState?.validate() ?? false) {
                                viewModel.login(
                                  _emailController.text,
                                  _passwordController.text,
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ColorManager.pink,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            child: Text(
                              AppLocalizations.of(context)!.login,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: AppSize.s20),
                      const SizedBox(height: AppSize.s20),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.notHaveAnAccount,
                              style: TextStyle(
                                color: ColorManager.placeHolderColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, RoutesManager.registerRoute);
                              },
                              child: Column(
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!.signUp,
                                    style: TextStyle(
                                      color: ColorManager.pink,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      decoration: TextDecoration.underline,
                                      decorationColor: ColorManager.darkGrey,
                                      decorationStyle:
                                          TextDecorationStyle.solid,
                                      decorationThickness: 1.5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
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
}
