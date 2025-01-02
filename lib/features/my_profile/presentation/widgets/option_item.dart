
import '../../../../core/utils/cashed_data_shared_preferences.dart';
import 'package:flutter/material.dart';

class OptionItem extends StatelessWidget {
  final IconData? icon;
  final String text;
  final String? trailingText;
  final bool imageIconExists;

  const OptionItem(
      {super.key,
      this.icon,
      required this.text,
      this.trailingText,
      required this.imageIconExists});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Row(
                children: [
                  if (icon != null) Icon(icon, color: Colors.black,size: 16,),
                  const SizedBox(width: 10),
                  Text(
                    text,
                    style: const TextStyle(fontSize: 13),
                  ),
                ],
              ),
            ],
          ),
          if (trailingText != null)
            Text(
              trailingText!,
              style: const TextStyle(color: Colors.pink),
            ),
          Transform(
            alignment: Alignment.center,
            transform:
                CacheService.getData(key: CacheConstants.defaultLanguage) ==
                        'ar'
                    ? Matrix4.rotationY(3.1416)
                    : Matrix4.identity(),
          //  child: SvgPicture.asset(AssetsManager.arrowRight),
          )
        ],
      ),
    );
  }
}
