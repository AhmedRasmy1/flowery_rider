import 'package:cached_network_image/cached_network_image.dart';
import 'color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

String getFileExtensionFromUrl(String url) {
  List<String> parts = url.split('.');
  String lastPart = parts.last;
  List<String> extensionParts = lastPart.split('?');
  String extension = extensionParts.first;
  return extension;
}

class CashedImage extends StatelessWidget {
  const CashedImage({
    super.key,
    required this.url,
    this.height,
    this.width,
    this.sizeIndicator,
    this.boxFit,
  });

  final String url;
  final double? height;
  final double? width;
  final double? sizeIndicator;
  final BoxFit? boxFit;

  @override
  Widget build(BuildContext context) {
    return getFileExtensionFromUrl(url) == 'svg'
        ? SvgPicture.network(
            url.isNotEmpty ? url : '',
            fit: BoxFit.fill,
            placeholderBuilder: (context) => Center(
              child: SizedBox(
                height: sizeIndicator ?? 20,
                width: sizeIndicator ?? 20,
                child: CircularProgressIndicator(
                  color: ColorManager.pink,
                ),
              ),
            ),
          )
        : CachedNetworkImage(
            height: height,
            width: width ?? MediaQuery.sizeOf(context).width,
            imageUrl: url.isNotEmpty ? url : '',
            fit: boxFit ?? BoxFit.fill,
            placeholder: (context, url) => Center(
              child: SizedBox(
                  height: sizeIndicator ?? 20,
                  width: sizeIndicator ?? 20,
                  child: CircularProgressIndicator(
                    color: ColorManager.pink,
                    value: 10,
                  )),
            ),
            errorWidget: (context, url, error) =>  Center(
              child: Image.network('https://flower.elevateegy.com/uploads/default-profile.png'),
            ),
          );
  }
}
