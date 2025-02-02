import 'package:flowery_rider/core/resources/cashed_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/resources/color_manager.dart';

class PickupInfo extends StatelessWidget {
  final String title;
  final String name;
  final String address;
  final String img;

  const PickupInfo({
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
          style: const TextStyle(fontWeight: FontWeight.w500,
              color: ColorManager.black,fontSize: 14),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 4,
                offset: Offset(0, 0), // changes position of shadow
              ),
            ],
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
                  BoxDecoration(
                      borderRadius: BorderRadius.circular(50)),
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
                      style: const TextStyle(
                          fontWeight: FontWeight.w400),
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
