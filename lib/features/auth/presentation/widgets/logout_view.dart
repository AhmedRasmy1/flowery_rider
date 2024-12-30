import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/di/di.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/routes_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/utils/cashed_data_shared_preferences.dart';
import '../view_model/logout_state.dart';
import '../view_model/logout_view_model_cubit.dart';

class LogoutConfirmationDialog extends StatefulWidget {
  const LogoutConfirmationDialog({super.key});

  @override
  State<LogoutConfirmationDialog> createState() =>
      _LogoutConfirmationDialogState();
}

class _LogoutConfirmationDialogState extends State<LogoutConfirmationDialog> {
  late LogoutViewModel viewModel;
  String? _errorMessage;

  @override
  void initState() {
    viewModel = getIt.get<LogoutViewModel>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocListener<LogoutViewModel, LogoutState>(
        listener: (context, state) {
          if (state is SuccessLogoutState) {
            Navigator.pushReplacementNamed(context, RoutesManager.loginRoute);
          } else if (state is ErrorLogoutState) {
            setState(() {
              _errorMessage = 'error';
            });
          }
        },
        child: Dialog(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: Colors.white,
            child: SizedBox(
              height: 177,
              width: 280,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 32),
                    child: Text(
                      AppLocalizations.of(context)!.logout,
                      style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 6),
                    child: Text(
                      AppLocalizations.of(context)!.confirmLogout,
                      style:
                      TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                    ),
                  ),
                  if (_errorMessage != null)
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: AppPadding.p4),
                      child: Text(
                        _errorMessage!,
                        style: const TextStyle(color: Colors.red, fontSize: 14),
                      ),
                    ),
                  const SizedBox(
                    height: 18,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    SizedBox(
                      height: 40,
                      width: 100,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                                side: const BorderSide(
                                    color: ColorManager.placeHolderColor))),
                        child: Text(
                          AppLocalizations.of(context)!.cancle,
                          style: TextStyle(
                              color: ColorManager.placeHolderColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    SizedBox(
                      height: 40,
                      width: 100,
                      child: ElevatedButton(
                        onPressed: () {
                          viewModel.logout(
                              "Bearer ${CacheService.getData(key: CacheConstants.userToken)}");
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pink,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            )),
                        child: Text(
                          AppLocalizations.of(context)!.logoutS,
                          style: TextStyle(
                              color: ColorManager.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  ]),
                ],
              ),
            )),
      ),
    );
  }
}