import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomLoadingDialog {
  static void show(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        Navigator.of(context).push(
          PageRouteBuilder(
            opaque: false,
            pageBuilder: (BuildContext context, _, __) {
              Future.delayed(const Duration(milliseconds: 500), () {
                if (context.mounted) {
                  Navigator.of(context).pop();
                }
              });
              return const Scaffold(
                backgroundColor: Colors.transparent,
                body: Center(
                    child: SpinKitCircle(
                  color: Colors.pink,
                  size: 50.0,
                )),
              );
            },
          ),
        );
      },
    );
  }
}
