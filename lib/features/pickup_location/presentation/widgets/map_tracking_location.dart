import 'dart:async';
import 'package:flowery_rider/core/firebase_core/firebase_utils/firebase_utils.dart';
import 'package:flowery_rider/core/utils/cashed_data_shared_preferences.dart';
import 'package:flowery_rider/features/home/data/response/pending__orders__response.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/utils/location_services.dart';

class MapTrackingLocation extends StatefulWidget {
  const MapTrackingLocation(
      {super.key, required this.lat, required this.long, required this.isUser});

  final double lat;
  final double long;
  final bool isUser;

  @override
  State<MapTrackingLocation> createState() => _MapTrackingLocationState();
}

class _MapTrackingLocationState extends State<MapTrackingLocation> {
  Set<Marker> markers = {};

  late CameraPosition initialCameraPosition;
  late LocationService locationService;
  late BitmapDescriptor markerStore;
  late BitmapDescriptor markerDriver;
  late BitmapDescriptor markerUser;
  StreamSubscription<LocationData>? _locationSubscription;
  GoogleMapController? googleMapController;

  @override
  void initState() {
    super.initState();
    initialCameraPosition =
        CameraPosition(zoom: 4, target: LatLng(widget.lat, widget.long));
    locationService = LocationService();

    _initializeMarkers().then((_) {
      _addMarkers();
    });

    updateMyLocation();
  }

  Future<void> _initializeMarkers() async {
    final List<BitmapDescriptor> icons = await Future.wait([
      BitmapDescriptor.asset(ImageConfiguration(), AssetsManager.markerDriver),
      BitmapDescriptor.asset(ImageConfiguration(), AssetsManager.markerUser),
      BitmapDescriptor.asset(ImageConfiguration(), AssetsManager.markerStore),
    ]);

    markerDriver = icons[0];
    markerUser = icons[1];
    markerStore = icons[2];
  }

  void _addMarkers() {
    if (!mounted) return;

    setState(() {
      markers.clear();
      if (widget.isUser) {
        markers.add(
          Marker(
            markerId: const MarkerId("user_location"),
            icon: markerUser,
            position: LatLng(widget.lat, widget.long),
            infoWindow: const InfoWindow(title: "User"),
          ),
        );
      } else {
        markers.add(
          Marker(
            markerId: const MarkerId("Store_location"),
            icon: markerStore,
            position: LatLng(widget.lat, widget.long),
            infoWindow: const InfoWindow(title: "Store"),
          ),
        );
      }
    });
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
      height: MediaQuery.of(context).size.height * .88,
      width: double.infinity,
      child: GoogleMap(
        markers: markers,
        zoomControlsEnabled: false,
        onMapCreated: (controller) {
          googleMapController = controller;
        },
        initialCameraPosition: initialCameraPosition,
      ),
    );
  }

  void updateMyLocation() {
    try {
      _locationSubscription =
          locationService.getRealTimeLocationData((locationData) {
        if (mounted) {
          setMyLocationMarker(locationData);
          setMyCameraPosition(locationData);
        }
        FirebaseUtils.updateLatLongDriver(
            orderId: CacheService.getData(key: CacheConstants.orderPendingId),
            lat: locationData.latitude.toString(),
            long: locationData.longitude.toString());
      });
    } on LocationServiceException catch (e) {
      debugPrint("خطأ في خدمة الموقع: $e");
    } on LocationPermissionException catch (e) {
      debugPrint("الصلاحيات غير متاحة: $e");
    } catch (e) {
      debugPrint("خطأ غير متوقع: $e");
    }
  }

  void setMyCameraPosition(LocationData locationData) {
    if (!mounted) return;
    var cameraPosition = CameraPosition(
      target: LatLng(locationData.latitude!, locationData.longitude!),
      zoom: 6,
    );

    googleMapController
        ?.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  void setMyLocationMarker(LocationData locationData) {
    if (!mounted) return;

    var myLocationMarker = Marker(
      icon: markerDriver,
      markerId: const MarkerId('my_location_marker'),
      position: LatLng(locationData.latitude!, locationData.longitude!),
    );
    setState(() {
      markers.add(myLocationMarker);
    });
  }
}
