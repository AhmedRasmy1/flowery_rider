import '../../../../core/resources/color_manager.dart';
import '../../../auth/presentation/widgets/logout_view.dart';
import 'package:flutter/material.dart';
import 'option_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LogOut extends StatelessWidget {
  const LogOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return LogoutConfirmationDialog();
                },
              );
            },
            child: OptionItem(
              icon: Icons.logout,
              text: AppLocalizations.of(context)!.logout,
              imageIconExists: false,
            ),
          ),
          Icon(
            Icons.logout,
            color: ColorManager.grey,
            size: 30,
          ),
        ],
      ),
    );
  }
}
