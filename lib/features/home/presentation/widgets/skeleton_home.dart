
import 'package:flowery_rider/features/home/presentation/widgets/storeInfo.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:flutter/material.dart';




class SkeletonHome extends StatefulWidget {
  const SkeletonHome({super.key});

  @override
  State<SkeletonHome> createState() => _SkeletonHomeState();
}

class _SkeletonHomeState extends State<SkeletonHome> {



  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child:  ListView(
        children: [
          Card(
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
                        'user address',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  StoreInfo(
                    title: 'store address',
                    name: "SDSSSSSSSSSSSSSSS",
                    address:"SDSSSSSSSSSSSSSSS",
                    img: "https://flower.elevateegy.com/uploads/default-profile.png" ,
                  ),
                  SizedBox(height: 16),
                  StoreInfo(
                    title: 'user address',
                    name:
                    'user address',
                    address: 'user address',
                    img:
                    "https://flower.elevateegy.com/uploads/default-profile.png" ,
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          'SSSSSSSSSSSSSSSSSS',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),

                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pink,
                          ),
                          child: Text(
                            'Accept',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pink,
                          ),
                          child: Text(
                            'Accept',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Card(
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
                        'user address',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  StoreInfo(
                    title: 'store address',
                    name: "SDSSSSSSSSSSSSSSS",
                    address:"SDSSSSSSSSSSSSSSS",
                    img: "https://flower.elevateegy.com/uploads/default-profile.png" ,
                  ),
                  SizedBox(height: 16),
                  StoreInfo(
                    title: 'user address',
                    name:
                    'user address',
                    address: 'user address',
                    img:
                    "https://flower.elevateegy.com/uploads/default-profile.png" ,
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          'SSSSSSSSSSSSSSSSSS',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),

                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pink,
                          ),
                          child: Text(
                            'Accept',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pink,
                          ),
                          child: Text(
                            'Accept',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


