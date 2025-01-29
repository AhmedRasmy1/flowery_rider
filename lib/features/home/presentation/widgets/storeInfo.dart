import 'package:flowery_rider/core/resources/cashed_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/resources/color_manager.dart';

class StoreInfo extends StatelessWidget {
  final String title;
  final String name;
  final String address;
  final String img;

  const StoreInfo({
    super.key,
    required this.title,
    required this.name,
    required this.address,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: ColorManager.greyTooLight,
              width: 3.0,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: 45,
                  height: 45,
                  clipBehavior: Clip.antiAlias,
                  decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(50)),
                  child:CashedImage(url: img,height: 35,width: 35,)
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      address,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                      // Truncates text if too long
                      maxLines: 2, // Restrict to 2 lines
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
