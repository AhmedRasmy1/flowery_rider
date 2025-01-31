import 'package:flutter/material.dart';


import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import 'core/utils/location_services.dart';

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({super.key});

  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  Set<Marker> markers = Set<Marker>();
  late CameraPosition initialCameraPostion;
  late LocationService locationService;
  @override
  void initState() {
    initialCameraPostion = const CameraPosition(
        zoom: 12, target: LatLng(31.187084851056554, 29.928110526889437));
    locationService = LocationService();
    updateMyLocation();
    super.initState();
    _addMarkers();
  }

  GoogleMapController? googleMapController;
  void _addMarkers() {
    setState(() {
      markers.add(Marker(
        markerId: MarkerId("end"),
        position: LatLng(25.9129791, 45.3744243),
        infoWindow: InfoWindow(title: "End Location"),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      markers: markers,
      zoomControlsEnabled: false,
      onMapCreated: (controller) {
        googleMapController = controller;

      },
      initialCameraPosition: initialCameraPostion,
    );
  }



  void updateMyLocation() async {
    await locationService.checkAndRequestLocationService();
    var hasPermission =
    await locationService.checkAndRequestLocationPermission();
    if (true) {
      locationService.getRealTimeLocationData((locationData) {
        setMyLocationMarker(locationData);
        setMyCameraPosition(locationData);
      });
    } else {}
  }

  void setMyCameraPosition(LocationData locationData) {
    var camerPosition = CameraPosition(
        target: LatLng(locationData.latitude!, locationData.longitude!),
        zoom: 12);

    googleMapController
        ?.animateCamera(CameraUpdate.newCameraPosition(camerPosition));
  }

  void setMyLocationMarker(LocationData locationData) {
    var myLocationMarker = Marker(
        markerId: const MarkerId('my_location_marker'),
        position: LatLng(locationData.latitude!, locationData.longitude!));

    markers.add(myLocationMarker);
    setState(() {});
  }
}


// inquire about location service
// request permission
// get location
// display