import 'package:flutter/material.dart';

import '../../../../core/resources/color_manager.dart';

class PickupAndUserInfo extends StatelessWidget {
  final String title;
  final String name;
  final String address;
  final IconData iconImg;


  const PickupAndUserInfo({
    super.key,
    required this.title,
    required this.name,
    required this.address,
    required this.iconImg,

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
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.pink,
                child:
               Icon(iconImg,color: Colors.white,),
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
                      overflow: TextOverflow.ellipsis, // Truncates text if too long
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