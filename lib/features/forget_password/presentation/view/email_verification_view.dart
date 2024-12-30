import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/di.dart';
import '../../../../core/resources/app_constants.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../view_models/forget_password_view_model/forget_password_cubit.dart';
import '../view_models/verify_password_view_model/verify_password_cubit.dart';
import '../widgets/block_consumer_for_otp.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../widgets/custom_field_for_verification.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OtpVerificationPage extends StatefulWidget {
  const OtpVerificationPage({super.key});

  @override
  createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  late VerifyPasswordViewModel viewModel;
  late ForgetPasswordViewModel forgetPasswordViewModel;
  late String editEmail;
  final List<TextEditingController> _controllers =
      List.generate(6, (_) => TextEditingController());
  bool _isCodeInvalid = false; // Track invalid code state
  final String _errorMessage = AppStrings.invalidCode;
  bool isButtonDisabled = true; // To track button state
  int _remainingTime = 60; // Timer countdown in seconds
  Timer? timer; // Timer object

  @override
  void initState() {
    viewModel = getIt.get<VerifyPasswordViewModel>();
    forgetPasswordViewModel = getIt.get<ForgetPasswordViewModel>();
    startTimer();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args is String) {
      editEmail = args;
    } else {
      editEmail = "default_email@example.com";
    }
  }

  @override
  void dispose() {
    timer?.cancel(); // Cancel timer when the widget is disposed
    for (var controller in _controllers) {
      controller.dispose(); // Dispose of the controllers to free resources
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(
                top: AppPadding.p8,
                left: AppPadding.p16,
                right: AppPadding.p16),
            child: Column(
              children: [
                CustomAppBar(
                  title: AppLocalizations.of(context)!.password,
                  color: ColorManager.black,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(height: AppSize.s40),
                Text(
                  AppLocalizations.of(context)!.emailVerification,
                  style: TextStyle(
                    fontSize: FontSize.s18,
                    color: ColorManager.black,
                    fontWeight: FontWeightManager.medium,
                  ),
                ),
                const SizedBox(height: AppSize.s16),
                Text(
                  AppLocalizations.of(context)!.subTitleOfEmailVerification,
                  style: TextStyle(
                    fontSize: FontSize.s14,
                    color: ColorManager.grey,
                    fontWeight: FontWeightManager.regular,
                  ),
                ),
                const SizedBox(height: AppSize.s32),
                Form(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      AppConstants.listGenerate,
                      (index) {
                        return CustomFieldForOtpVerification(
                          controllers: _controllers,
                          viewModel: viewModel,
                          isCodeInvalid: _isCodeInvalid,
                          index: index,
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                if (_isCodeInvalid)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Icon(
                        Icons.error_outline,
                        size: AppSize.s16,
                        color: ColorManager.error,
                      ),
                      Text(
                        _errorMessage,
                        style: const TextStyle(color: ColorManager.error),
                      ),
                    ],
                  ),
                const SizedBox(height: 24),
                BlocConsumerForOtpVerificationPage(
                  onCodeInvalid: (isInvalid) {
                    setState(() {
                      _isCodeInvalid = isInvalid;
                    });
                  },
                  email: editEmail,
                ),
                const SizedBox(height: 24),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: AppLocalizations.of(context)!.dontReceiveCode,
                        style: TextStyle(
                          fontSize: FontSize.s16,
                          fontWeight: FontWeightManager.regular,
                          color: ColorManager.black,
                        ),
                      ),
                      TextSpan(
                        text: isButtonDisabled
                            ? ' ($_remainingTime ث)' // Display remaining time
                            : '',
                        style: const TextStyle(
                          fontSize: FontSize.s16,
                          color: ColorManager.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: isButtonDisabled
                      ? null
                      : resendOTP, // Disable when button is inactive
                  child: Text(
                    AppLocalizations.of(context)!.resend,
                    style: TextStyle(
                      fontSize: FontSize.s16,
                      fontWeight: FontWeightManager.regular,
                      color: isButtonDisabled
                          ? ColorManager.grey
                          : ColorManager.pink,
                      decoration: TextDecoration.underline,
                      decorationColor: ColorManager.pink,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void startTimer() {
    setState(() {
      isButtonDisabled = true; // Disable the button
      _remainingTime = 60; // Reset the timer
    });

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime > 1) {
        setState(() => _remainingTime--);
      } else {
        timer.cancel();
        setState(() {
          isButtonDisabled = false; // Enable the button
        });
      }
    });
  }

  void resendOTP() {
    startTimer();
    forgetPasswordViewModel.doIntent(ForgetPasswordIntent(
        editEmail)); // Call the ViewModel's resend OTP function
  }
}


