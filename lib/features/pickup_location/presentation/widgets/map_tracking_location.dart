import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
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
  late CameraPosition initialCameraPostion;
  late LocationService locationService;
  late BitmapDescriptor markerIcon;

  @override
  void initState() {
    super.initState();
    initialCameraPostion = const CameraPosition(
        zoom: 1, target: LatLng(31.187084851056554, 29.928110526889437));
    locationService = LocationService();
    updateMyLocation();
    _loadMarkerIcon().then((_) {
      _addMarkers();
    });
  }

  GoogleMapController? googleMapController;

  void _addMarkers() {
    setState(() {
      markers.add(Marker(
        markerId: MarkerId("end"),
        icon: markerIcon,
        position: LatLng(widget.lat, widget.long),
        infoWindow: InfoWindow(title: "End Location"),
      ));
    });
  }

  Future<void> _loadMarkerIcon() async {
    markerIcon = await BitmapDescriptor.asset(
      ImageConfiguration(),
      AssetsManager.imagesMarker,
    );
  }

  @override
  void dispose() {
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
        initialCameraPosition: initialCameraPostion,
      ),
    );
  }

  void updateMyLocation() async {
    try {
      locationService.getRealTimeLocationData((locationData) {
        setMyLocationMarker(locationData);
        setMyCameraPosition(locationData);
      });
    } on LocationServiceException catch (e) {
      // TODO:
    } on LocationPermissionException catch (e) {
      // TODO :
    } catch (e) {
      // TODO:
    }
  }

  void setMyCameraPosition(LocationData locationData) {
    var camerPosition = CameraPosition(
        target: LatLng(locationData.latitude!, locationData.longitude!),
        zoom: 3);

    googleMapController
        ?.animateCamera(CameraUpdate.newCameraPosition(camerPosition));
  }

  void setMyLocationMarker(LocationData locationData) {
    var myLocationMarker = Marker(
        icon: markerIcon,
        markerId: MarkerId(
          'my_location_marker',
        ),
        position: LatLng(locationData.latitude!, locationData.longitude!));

    markers.add(myLocationMarker);
    setState(() {});
  }
}
