import 'dart:async';
import 'package:flowery_rider/core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/utils/location_services.dart';

class MapTrackingLocation extends StatefulWidget {
  const MapTrackingLocation({super.key, required this.lat, required this.long});

  final double lat;
  final double long;

  @override
  State<MapTrackingLocation> createState() => _MapTrackingLocationState();
}

class _MapTrackingLocationState extends State<MapTrackingLocation> {
  Set<Marker> markers = {};
  Set<Polyline> polyLines = {};
  List<LatLng> polylineCoordinates = [];
  late CameraPosition initialCameraPosition;
  late LocationService locationService;
  late BitmapDescriptor markerIcon;
  late BitmapDescriptor markerIconDriver;
  StreamSubscription<LocationData>? _locationSubscription;
  GoogleMapController? googleMapController;

  @override
  void initState() {
    super.initState();
    initialCameraPosition = const CameraPosition(zoom: 1, target: LatLng(0, 0));
    locationService = LocationService();

    _initializeMarkers().then((_) {
      _addMarkers();
    });

    updateMyLocation();
  }

  Future<void> _initializeMarkers() async {
    final List<BitmapDescriptor> icons = await Future.wait([
      BitmapDescriptor.fromAssetImage(
          const ImageConfiguration(), AssetsManager.markerDriver),
      BitmapDescriptor.fromAssetImage(
          const ImageConfiguration(), AssetsManager.imagesMarker),
    ]);

    markerIcon = icons[0];
    markerIconDriver = icons[1];
  }

  /// إضافة العلامات (Markers) على الخريطة
  void _addMarkers() {
    if (mounted) {
      setState(() {
        markers.addAll([
          Marker(
            markerId: const MarkerId("user_location"),
            icon: markerIcon,
            position: LatLng(widget.lat, widget.long),
            infoWindow: const InfoWindow(title: "User"),
          ),
          Marker(
            markerId: const MarkerId("driver_location"),
            icon: markerIconDriver,
            position: LatLng(widget.lat, widget.long),
            infoWindow: const InfoWindow(title: "Your Location"),
          ),
        ]);
      });
    }
  }

  @override
  void dispose() {
    _locationSubscription?.cancel();
    googleMapController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .88,
      width: double.infinity,
      child: GoogleMap(
        markers: markers,
        zoomControlsEnabled: false,
        polylines: polyLines,
        onMapCreated: (controller) {
          googleMapController = controller;
        },
        initialCameraPosition: initialCameraPosition,
      ),
    );
  }

  /// تحديث موقع المستخدم وتتبع حركته
  void updateMyLocation() {
    try {
      _locationSubscription =
          locationService.getRealTimeLocationData((locationData) {
            if (mounted) {
              setMyLocationMarker(locationData);
              setMyCameraPosition(locationData);
              updatePolyLine(locationData);
            }
          });
    } on LocationServiceException catch (e) {
      debugPrint("خطأ في خدمة الموقع: $e");
    } on LocationPermissionException catch (e) {
      debugPrint("الصلاحيات غير متاحة: $e");
    } catch (e) {
      debugPrint("خطأ غير متوقع: $e");
    }
  }

  /// تحديث موضع الكاميرا إلى موقع المستخدم
  void setMyCameraPosition(LocationData locationData) {
    if (!mounted) return;
    var cameraPosition = CameraPosition(
      target: LatLng(locationData.latitude!, locationData.longitude!),
      // zoom: 10,
    );

    googleMapController
        ?.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  /// تعيين علامة موقع المستخدم
  void setMyLocationMarker(LocationData locationData) {
    if (!mounted) return;

    var myLocationMarker = Marker(
      icon: markerIcon,
      markerId: const MarkerId('my_location_marker'),
      position: LatLng(locationData.latitude!, locationData.longitude!),
    );

    setState(() {
      markers.add(myLocationMarker);
    });
  }

  /// تحديث المسار بين النقاط باستخدام `PolylinePoints`
  void updatePolyLine(LocationData locationData) async {
    if (!mounted) return;

    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleApiKey: 'AIzaSyCjsw4K1qG6bgGRswsO7OW4oKRI3PJMkDI',
      request: PolylineRequest(
        origin: PointLatLng(locationData.latitude!, locationData.longitude!),
        destination: PointLatLng(widget.lat, widget.long),

        mode: TravelMode.driving,
        wayPoints: [PolylineWayPoint(location: "Sabo, Yaba Lagos Nigeria")],
      ),
    );

    if (result.points.isNotEmpty) {
      setState(() {
        polylineCoordinates.clear();
        polylineCoordinates.addAll(
            result.points.map((point) => LatLng(point.latitude, point.longitude)));

        polyLines.clear();
        polyLines.add(Polyline(
          polylineId: const PolylineId("tracking_route"),
          color: ColorManager.pink,
          width: 5,
          points: polylineCoordinates,
          jointType: JointType.round,
          startCap: Cap.roundCap,
          endCap: Cap.roundCap,
          geodesic: true
        ));
      });
    } else {
      debugPrint("خطأ أثناء استرداد المسار: ${result.errorMessage}");
    }
  }
}
