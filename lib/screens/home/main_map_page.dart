import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
import 'package:implicitly_animated_reorderable_list/transitions.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:trip_pal_null_safe/controllers/search_bar_controller.dart';
import 'package:trip_pal_null_safe/models/PlacesSEData.dart';
import 'package:trip_pal_null_safe/models/location.dart';
import 'package:trip_pal_null_safe/models/map_place.dart';
import 'package:trip_pal_null_safe/models/place.dart';
import 'package:trip_pal_null_safe/services/open_trip_map_service.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';

class MainMapScreen extends GetView<SearchBarController> {
  final searchBarController = FloatingSearchBarController();

  Widget buildSearchBar() {
    final actions = [
      FloatingSearchBarAction.icon(
        showIfOpened: false,
        icon: Icons.my_location,
        onTap: () => controller.getMyLocation(),
      ),
      FloatingSearchBarAction.searchToClear(
        showIfClosed: false,
      ),
    ];

    return Scaffold(
        body: Obx(() => FloatingSearchBar(
              backgroundColor: Get.theme.colorScheme.background,
              controller: searchBarController,
              clearQueryOnClose: true,
              iconColor: Get.theme.appBarTheme.iconTheme!.color,
              transitionDuration: const Duration(milliseconds: 800),
              transitionCurve: Curves.easeInOutCubic,
              physics: const BouncingScrollPhysics(),
              axisAlignment: 0,
              openAxisAlignment: 0.0,
              actions: actions,
              progress: controller.isLoading,
              debounceDelay: const Duration(milliseconds: 500),
              onQueryChanged: controller.onQueryChanged,
              transition: CircularFloatingSearchBarTransition(),
              accentColor: Colors.blueAccent,
              builder: (context, _) => buildExpandableBody(),
              body: buildBody(),
            )));
  }

  Widget buildExpandableBody() {
    return Material(
      color: Get.theme.colorScheme.background,
      elevation: 4.0,
      borderRadius: BorderRadius.circular(8),
      child:
          // Obx(() =>
          ImplicitlyAnimatedList<Place>(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        items: controller.suggestions,
        areItemsTheSame: (a, b) => a == b,
        itemBuilder: (_, animation, place, i) {
          return SizeFadeTransition(
            animation: animation,
            child: buildItem(place),
          );
        },
        updateItemBuilder: (_, animation, place) {
          return FadeTransition(
            opacity: animation,
            child: buildItem(place),
          );
        },
        // )
      ),
    );
  }

  Widget buildItem(Place place) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: () {
            OpenTripMapApi().getLocationId(
                cityName: place.name,
                onSuccess: (data) {
                  controller.updateLatLan(Location.fromJson(data).lat!,
                      Location.fromJson(data).lon!);
                },
                onError: (error) {
                  print(error);
                });
            searchBarController.close();
            Future.delayed(
              const Duration(milliseconds: 500),
              () => controller.clear(),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                SizedBox(
                  width: 36,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    child: controller.isHistory
                        ? Icon(Icons.history,
                            key: Key('history'),
                            color: Get.theme.colorScheme.onSurface)
                        : Icon(Icons.place,
                            key: Key('place'),
                            color: Get.theme.colorScheme.onSurface),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        place.name,
                        style: Get.textTheme.subtitle1,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        place.level2Address,
                        style: Get.textTheme.bodyText2!
                            .copyWith(color: Colors.grey[500]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        if (controller.suggestions.isNotEmpty &&
            place != controller.suggestions.last)
          const Divider(height: 0),
      ],
    );
  }

  Widget buildBody() {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          width: MySize.screenWidth,
          height: MySize.screenHeight,
          child: Obx(() => GoogleMap(
                myLocationButtonEnabled: false,
                trafficEnabled: false,
                mapToolbarEnabled: false,
                myLocationEnabled: true,
                zoomControlsEnabled: false,
                initialCameraPosition: controller.cameraPosition,
                onMapCreated: (controllerI) {
                  controller.mapController = controllerI;
                },
                markers: {
                  for (MapPlace place in controller.mapPlacesList)
                    Marker(
                        markerId: const MarkerId('mapPlaceMarker'),
                        infoWindow: InfoWindow(
                            title: controller.markerInfoWindowTitle.value),
                        icon: BitmapDescriptor.defaultMarkerWithHue(
                            BitmapDescriptor.hueRed),
                        position: LatLng(place.geometry!.coordinates![1],
                            place.geometry!.coordinates![0]))
                },
              )),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: buildSearchBar(),
    );
  }
}
