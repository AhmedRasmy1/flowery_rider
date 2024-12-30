import 'dart:io';
import '../resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';

Future<File?> cropImage(File imgFile) async {
  final croppedFile = await ImageCropper().cropImage(
    sourcePath: imgFile.path,
    uiSettings: [
      AndroidUiSettings(
        toolbarTitle: "اداة تعديل الصورة",
        toolbarColor: ColorManager.pink,
        toolbarWidgetColor: Colors.white,
        initAspectRatio: CropAspectRatioPreset.original,
        lockAspectRatio: false,
      ),
      IOSUiSettings(
        showCancelConfirmationDialog: true,
        title: "اداة تعديل الصورة",
      ),
    ],
  );

  imageCache.clear();

  if (croppedFile != null) {
    return File(croppedFile.path);
  }

  return null; // أضف قيمة افتراضية في حالة عدم وجود صورة مقصوصة
}
