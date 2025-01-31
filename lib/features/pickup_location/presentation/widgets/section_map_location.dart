import 'package:flowery_rider/features/pickup_location/presentation/widgets/skeleton_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../home/data/response/pending__orders__response.dart';
import 'map_tracking_location.dart';

class SectionMapLocation extends StatelessWidget {
  const SectionMapLocation({
    super.key,
    required this.orderDetails,
  });

  final Orders orderDetails;

  @override
  Widget build(BuildContext context) {


    return Expanded(
      child: Stack(
        children: [
          FutureBuilder(
            future: _loadData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return  SkeletonMap();
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
    );
  }
}


Future<void> _loadData() async {
  await Future.delayed(Duration(seconds: 2));
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