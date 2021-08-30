import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trip_pal_null_safe/controllers/maps_controller.dart';
import 'package:trip_pal_null_safe/models/activities.dart';

class MapPage extends GetView<MapController> {
  MapPage({required this.points, Key? key}) : super(key: key);
  final List<Activity> points;

  @override
  Widget build(BuildContext context) {
    controller.addMarkers(points);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.blueGrey[700],
          ),
          onPressed: () => Get.back(),
        ),
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Container(
        child: GoogleMap(
          myLocationButtonEnabled: false,
          trafficEnabled: false,
          mapToolbarEnabled: false,
          myLocationEnabled: true,
          zoomControlsEnabled: false,
          initialCameraPosition: CameraPosition(
              target: LatLng(
                  points[0].place!.latitude!, points[0].place!.longitude!),
              zoom: 11.5),
          onMapCreated: (mapController) {
            controller.mapController = mapController;
          },
          markers: controller.markers.toSet(),
        ),
      ),
    );
  }
}
