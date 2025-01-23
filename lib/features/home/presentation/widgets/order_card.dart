import 'package:flowery_rider/features/home/data/response/pending__orders__response.dart';
import 'package:flowery_rider/features/home/presentation/widgets/storeInfo.dart';
import 'package:flowery_rider/features/home/presentation/widgets/userinfo.dart';
import 'package:flutter/material.dart';

import '../../../../core/resources/color_manager.dart';

class OrderCard extends StatelessWidget {

  final Order orderPending;
OrderCard(this.orderPending);

  @override

  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.only(bottom: 16.0),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Flower order",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
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
                    style: TextStyle(color: Color(0xffC8D444), fontSize: 16)),
                Spacer(),
                Text(
                  orderPending.orderNumber,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 16),


            StoreInfo(
              title: 'store address',
              name: orderPending.store.name.toString(),
              address: orderPending.store.address.toString(),
              img: orderPending.store.image,

            ), SizedBox(height: 16),
            PickupAndUserInfo(
              title: 'user address',
              name:  orderPending.user.firstName?.name ??"",
              address: orderPending.user.phone ?? "",

              iconImg: Icons.account_circle_rounded,

            ),
            SizedBox(height: 16),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [  Text(
                orderPending.totalPrice.toString(),
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
                  child: Text('Accept',style: TextStyle(color: Colors.white),),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
