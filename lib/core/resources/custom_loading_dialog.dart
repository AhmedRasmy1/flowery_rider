import 'package:flutter/material.dart';

import 'color_manager.dart';

customLoadingDialog(BuildContext context) {
  return showDialog(
    barrierDismissible: true,
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Colors.transparent,
      content: Center(
        child: CircularProgressIndicator(
          color: ColorManager.pink,
        ),
      ),
    ),
  );
}
