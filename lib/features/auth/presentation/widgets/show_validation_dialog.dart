import 'package:flowery_rider/core/resources/color_manager.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void showValidationDialog(BuildContext context){
  showDialog(context: context, builder:(context){
    return AlertDialog(
      title: Center(child: Text(AppLocalizations.of(context)!.inputError,style: TextStyle(color: ColorManager.red,fontWeight: FontWeight.bold),)),
      content: Text(AppLocalizations.of(context)!.fillFieldsCorrectly),
      actions: [
        TextButton(onPressed: (){
          Navigator.of(context).pop();
        }, child: Text(AppLocalizations.of(context)!.ok))
      ],
    );

  });
}