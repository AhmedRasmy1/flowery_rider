import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../localization/locale_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChangeLanguage extends StatelessWidget {
  const ChangeLanguage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/images/language_icon.svg',
            width: 16,
            height: 16,
          ),
          const SizedBox(width: 8),
          Text(
            AppLocalizations.of(context)!.language,
            style: const TextStyle(fontSize: 16),
          ),
          const Spacer(),
          StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              String dropdownValue =
                  context.read<LocaleCubit>().state.languageCode;
              String title = dropdownValue == 'ar' ? 'English' : 'عربي';
              String lang = dropdownValue == 'ar' ? 'en' : 'ar';

              return GestureDetector(
                onTap: () {
                  context.read<LocaleCubit>().changeLanguage(lang);
                  setState(() {});
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    title,
                    style:  TextStyle(
                      fontSize: 16,
                      color: ColorManager.pink,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
