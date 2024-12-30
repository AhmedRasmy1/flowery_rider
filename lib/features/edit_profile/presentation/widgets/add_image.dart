import 'dart:io';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/widgets/add_image.dart';
import '../../../../core/widgets/crop_Image_edite.dart';
import '../../../../core/widgets/image_size.dart';

class AddPicture extends StatefulWidget {
  const AddPicture({
    super.key,
    required this.urlImage,
  });
  final String urlImage;
  @override
  State<AddPicture> createState() => _TabBodySellerState();
}

class _TabBodySellerState extends State<AddPicture> {
  File? logeImageFile;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * .10),
      child: GestureDetector(
        onTap: () async {
          await AddImage.showCupertinoModalPopupAddImage(context,
              gallery: () async {
            XFile? xFile =
                await ImagePicker().pickImage(source: ImageSource.gallery);
            if (xFile != null) {
              File originalImageFile = File(xFile.path);

              /// open edite image
              File? editeImageFiled = await cropImage(originalImageFile);
              if (editeImageFiled != null) {
                /// change size image
                File resizedImageFile = await resizeAndCompressImage(
                    imageFile: editeImageFiled, width: 800, quality: 95);
                setState(() {
                  logeImageFile = resizedImageFile;
                });
              }
            }
          }, camera: () async {
            XFile? xFile =
                await ImagePicker().pickImage(source: ImageSource.camera);
            if (xFile != null) {
              File originalImageFile = File(xFile.path);
              File? editeImageFiled = await cropImage(originalImageFile);
              if (editeImageFiled != null) {
                File resizedImageFile = await resizeAndCompressImage(
                    imageFile: editeImageFiled, width: 800, quality: 95);
                setState(() {
                  logeImageFile = resizedImageFile;
                });
              }
            }
          });
        },
        child: Column(
          children: [
            logeImageFile != null
                ? Stack(
                    children: [
                      Container(
                        clipBehavior: Clip.antiAlias,
                        height: 85,
                        width: 85,
                        decoration: BoxDecoration(
                          // color: ColorManager.pink,
                          border:
                              Border.all(color: ColorManager.pink, width: 1),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Image.file(
                          logeImageFile!,
                          fit: BoxFit.fill,
                          width: double.infinity,
                        ),
                      ),
                      Positioned(
                        bottom: -3,
                        right: -4,
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: ColorManager.white),
                          child: SvgPicture.asset(
                            AssetsManager.camera,
                            width: 16,
                            height: 16,
                          ),
                        ),
                      ),
                    ],
                  )
                : Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        clipBehavior: Clip.antiAlias,
                        height: 85,
                        width: 85,
                        decoration: BoxDecoration(
                          // color: ColorManager.pink,
                          border:
                              Border.all(color: ColorManager.pink, width: 2),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Image.network(
                          widget.urlImage,
                          fit: BoxFit.fill,
                          width: double.infinity,
                        ),
                      ),
                      Positioned(
                        bottom: -3,
                        right: -4,
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: ColorManager.white),
                          child: SvgPicture.asset(
                            AssetsManager.camera,
                            width: 16,
                            height: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
