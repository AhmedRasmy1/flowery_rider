import 'dart:async';
import 'package:flutter/material.dart';
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
  late CameraPosition initialCameraPosition;
  late LocationService locationService;
  late BitmapDescriptor markerIcon;
  late BitmapDescriptor markerIconDriver;
  StreamSubscription<LocationData>? _locationSubscription;

  @override
  void initState() {
    super.initState();
    initialCameraPosition = const CameraPosition(zoom: 1, target: LatLng(0, 0));
    locationService = LocationService();
    updateMyLocation();
    _loadMarkerIcon().then((_) {
      _addMarkers();
    });
    _loadMarkerIconDriver().then((_) {
      _addMarkers();
    });
  }

  GoogleMapController? googleMapController;

  void _addMarkers() {
    if (mounted) {
      setState(() {
        markers.add(Marker(
          markerId: const MarkerId("end"),
          icon: markerIcon,
          position: LatLng(widget.lat, widget.long),
          infoWindow: const InfoWindow(title: "user"),
        ));
      });
    }
    if (mounted) {
      setState(() {
        markers.add(Marker(
          markerId: const MarkerId("end"),
          icon: markerIconDriver,
          position: LatLng(widget.lat, widget.long),
          infoWindow: InfoWindow(
            title: "Your Location",
          ),
        ));
      });
    }
  }

  Future<void> _loadMarkerIcon() async {
    markerIcon = await BitmapDescriptor.asset(
      const ImageConfiguration(),
      AssetsManager.imagesMarker,
    );
  }

  Future<void> _loadMarkerIconDriver() async {
    markerIconDriver = await BitmapDescriptor.asset(
      const ImageConfiguration(),
      AssetsManager.markerDriver,
    );
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
      });
    } on LocationServiceException catch (e) {
      // TODO: Handle permission exception
    } on LocationPermissionException catch (e) {
      // TODO: Handle permission exception
    } catch (e) {
      // TODO: Handle general errors
    }
  }

  void setMyCameraPosition(LocationData locationData) {
    if (!mounted) return;
    var cameraPosition = CameraPosition(
        target: LatLng(locationData.latitude!, locationData.longitude!),
        zoom: 10);

    googleMapController
        ?.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  void setMyLocationMarker(LocationData locationData) {
    if (!mounted) return;

    var myLocationMarker = Marker(
        icon: markerIcon,
        markerId: const MarkerId('my_location_marker'),
        position: LatLng(locationData.latitude!, locationData.longitude!));

    setState(() {
      markers.add(myLocationMarker);
    });
  }
}
