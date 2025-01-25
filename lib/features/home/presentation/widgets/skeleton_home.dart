import 'package:flowery_rider/core/di/di.dart';
import 'package:flowery_rider/features/home/presentation/widgets/storeInfo.dart';
import 'package:flowery_rider/features/home/presentation/widgets/userinfo.dart';

import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/resources/color_manager.dart';

import 'package:flutter/material.dart';

class SkeletonHome extends StatelessWidget {
  const SkeletonHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: SafeArea(
        child: ListView.builder(
          padding: EdgeInsets.all(16.0),
          itemCount: 5,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.white,
              margin: EdgeInsets.only(bottom: 16.0),
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Flower order",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 4),
                    Text('24 Km - 30 mins to deliver',
                        style: TextStyle(color: Colors.grey[600])),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.timer, color: Color(0xffC8D444)),
                        SizedBox(width: 8),
                        Text('Pending',
                            style: TextStyle(
                                color: Color(0xffC8D444), fontSize: 16)),
                        Spacer(),
                        Text(
                          '  orderPending.orderNumber ?? ""',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    StoreInfo(
                      title: 'store address',
                      name: 'orderPending.store?.name.toString() ?? ""',
                      address: 'orderPending.store?.address.toString() ?? ""',
                      img:
                          'https://modo3.com/thumbs/fit630x300/74232/1449574346/%D8%B4%D8%B1%D8%AD_%D9%83%D9%8A%D9%81%D9%8A%D8%A9_%D9%86%D8%B4%D8%B1_%D8%A7%D9%84%D8%B5%D9%88%D8%B1_%D8%B9%D9%84%D9%89_%D8%AC%D9%88%D8%AC%D9%84.jpg',
                    ),
                    SizedBox(height: 16),
                    PickupAndUserInfo(
                      title: 'user address',
                      name: 'orderPending',
                      address: ' orderPending.user?.phone ?? ""',
                      iconImg: Icons.account_circle_rounded,
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          ' orderPending..',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: BorderSide(color: ColorManager.pink),
                            foregroundColor: ColorManager.pink,
                          ),
                          child: Text('Reject'),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pink,
                          ),
                          child: Text(
                            'Accept',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
