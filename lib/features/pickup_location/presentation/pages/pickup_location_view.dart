import 'package:flowery_rider/core/resources/assets_manager.dart';
import 'package:flowery_rider/core/resources/cashed_image.dart';
import 'package:flowery_rider/core/resources/color_manager.dart';
import 'package:flowery_rider/features/pickup_location/presentation/widgets/custom_card_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../home/data/response/pending__orders__response.dart';
import '../widgets/map_tracking_location.dart';

class PickupLocationView extends StatelessWidget {
  const PickupLocationView(
      {super.key, required this.orderDetails, required this.isUser});

  final Orders orderDetails;
  final bool isUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                FutureBuilder(
                  future: _loadData(),
                  builder: (context, snapshot) {

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text('Error: ${snapshot.error}'),
                        );
                      } else {
                        return MapTrackingLocation(
                          lat: convertLatLong(orderDetails.store?.latLong).first,
                          long: convertLatLong(orderDetails.store?.latLong).last,
                        );
                      }
                    } else {
                      return const Center(
                        child: Text('Something went wrong!'),
                      );
                    }
                  },
                ),
                Positioned(
                  top: 64,
                  left: 18,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(AssetsManager.backIcon),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 16),
            height: 5,
            width: 65,
            decoration: BoxDecoration(
                color: ColorManager.pink,
                borderRadius: BorderRadius.circular(12)),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: isUser
                  ? Column(
                      children: [
                        CustomCardDetails(
                            title: 'User address',
                            phone: orderDetails.user?.phone ?? '',
                            subTitle: orderDetails.user?.phone ?? '',
                            title2:
                                "${orderDetails.user?.firstName} ${orderDetails.user?.lastName}",
                            urlImage:
                                'https://flower.elevateegy.com/uploads/default-profile.png',
                            noIcon: false),
                        SizedBox(
                          height: 24,
                        ),
                        CustomCardDetails(
                            title: 'Pickup address',
                            phone: orderDetails.store?.phoneNumber ?? '',
                            subTitle: orderDetails.store?.address ?? '',
                            title2: orderDetails.store?.name ?? '',
                            urlImage: orderDetails.store?.image ?? '',
                            noIcon: true),
                      ],
                    )
                  : Column(
                      children: [
                        CustomCardDetails(
                            title: 'Pickup address',
                            phone: orderDetails.store?.phoneNumber ?? '',
                            subTitle: orderDetails.store?.address ?? '',
                            title2: orderDetails.store?.name ?? '',
                            urlImage: orderDetails.store?.image ?? '',
                            noIcon: true),
                        SizedBox(
                          height: 24,
                        ),
                        CustomCardDetails(
                            title: 'User address',
                            phone: orderDetails.user?.phone ?? '',
                            subTitle: orderDetails.user?.phone ?? '',
                            title2:
                                "${orderDetails.user?.firstName} ${orderDetails.user?.lastName}",
                            urlImage:
                                'https://flower.elevateegy.com/uploads/default-profile.png',
                            noIcon: false),
                      ],
                    ),
            ),
          )
        ],
      ),
    );
  }
}

List<double> convertLatLong(String? latLong) {
  if (latLong == null || latLong.isEmpty) {
    return [37.7749, -122.4194];
  }

  try {
    List<String> parts = latLong.split(',');

    if (parts.length != 2) {
      throw FormatException('الإحداثيات غير صحيحة');
    }

    double latitude = double.parse(parts[0]);
    double longitude = double.parse(parts[1]);

    return [30.042910, 31.232614];
  } catch (e) {
    print('خطأ: $e');
    return [0.0, 0.0];
  }
}

Future<void> _loadData() async {
  await Future.delayed(Duration(seconds: 2));
}
