import 'package:flowery_rider/features/pickup_location/presentation/widgets/skeleton_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../home/data/response/pending__orders__response.dart';
import 'map_tracking_location.dart';

class SectionMapLocation extends StatelessWidget {
  const SectionMapLocation({
    super.key,
    required this.orderDetails,
    required this.isUser,
  });

  final Orders orderDetails;
  final bool isUser;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          FutureBuilder(
            future: _loadData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SkeletonMap();
              } else if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else {
                  //26.503299,45.3571272
                  return MapTrackingLocation(
                    lat: isUser
                        ?
                        // convertLatLong(orderDetails.store?.latLong).first /// api
                        28.0875713
                        : 31.4453012,
                    long: isUser
                        ? 30.7605525
                        // convertLatLong(orderDetails.store?.latLong).last  /// api
                        : 31.6801068,
                    isUser: isUser,
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
    return [30.0299336, 31.2706293, 12];
  }

  try {
    List<String> parts = latLong.split(',');

    if (parts.length != 2) {
      throw FormatException('الإحداثيات غير صحيحة');
    }

    ///
    double latitude = double.parse(parts[0]);
    double longitude = double.parse(parts[1]);

    return [30.0299336, 31.2706293, 12];
  } catch (e) {
    print('خطأ: $e');
    return [0.0, 0.0];
  }
}
