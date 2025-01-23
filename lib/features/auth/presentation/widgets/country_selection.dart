import 'package:flutter/material.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/resources/theme_manager.dart';
import '../../../../core/resources/values_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CountrySelection extends StatefulWidget {
  const CountrySelection({
    super.key,
  });

  @override
  State<CountrySelection> createState() => _CountrySelectionState();
}

class _CountrySelectionState extends State<CountrySelection> {
  String? selectedCountry;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    // Initialize with the first country's name in the list
    selectedCountry = countries.first['name'];
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Row(
        children: [
          Expanded(
            child: DropdownButtonFormField<String>(
              value: selectedCountry,
              onChanged: (newCountry) {
                setState(() {
                  selectedCountry = newCountry;
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select a country';
                }
                return null;
              },
              items: countries.map((country) {
                return DropdownMenuItem<String>(
                  value: country['name'],
                  child: Row(
                    children: [
                      Image.asset(
                        country['flag'] ?? '',
                        width: 24,
                        height: 24,
                      ),
                      const SizedBox(width: 8),
                      Text(country['name'] ?? ''),
                    ],
                  ),
                );
              }).toList(),
              isExpanded: true,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                labelText: 'Country',
                labelStyle: getRegularStyle(
                  color: ColorManager.grey,
                  fontSize: FontSize.s16,
                ),
                hintStyle: getRegularStyle(
                  color: ColorManager.placeHolderColor,
                  fontSize: FontSize.s14,
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                contentPadding: const EdgeInsets.all(AppPadding.p18),
                enabledBorder: outLintInputBorderMethod(
                  const BorderSide(
                    color: ColorManager.black,
                    width: AppSize.w1_5,
                  ),
                  const BorderRadius.all(Radius.circular(AppSize.s5)),
                ),
                focusedBorder: outLintInputBorderMethod(
                  const BorderSide(
                    color: ColorManager.grey,
                    width: AppSize.w1_5,
                  ),
                  const BorderRadius.all(Radius.circular(AppSize.s5)),
                ),
                errorBorder: outLintInputBorderMethod(
                  const BorderSide(
                    color: ColorManager.error,
                    width: AppSize.w1_5,
                  ),
                  const BorderRadius.all(Radius.circular(AppSize.s5)),
                ),
                focusedErrorBorder: outLintInputBorderMethod(
                  const BorderSide(
                    color: ColorManager.error,
                    width: AppSize.w1_5,
                  ),
                  const BorderRadius.all(Radius.circular(AppSize.s5)),
                ),
                disabledBorder: outLintInputBorderMethod(
                  const BorderSide(
                    color: ColorManager.grey,
                    width: AppSize.w1_5,
                  ),
                  const BorderRadius.all(Radius.circular(AppSize.s5)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<Map<String, String>> countries = [
  {'name': 'Egypt', 'flag': 'assets/images/egypt.png'},
  {'name': 'Saudi Arabia', 'flag': 'assets/images/s.jpg'},
  {'name': 'United Arab Emirates', 'flag': 'assets/images/emirates.png'},
];
