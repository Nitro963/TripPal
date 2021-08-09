import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
import 'package:implicitly_animated_reorderable_list/transitions.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:trip_pal_null_safe/controllers/search_bar_controller.dart';
import 'package:trip_pal_null_safe/models/PlacesSEData.dart';
import 'package:trip_pal_null_safe/models/place.dart';
import 'package:trip_pal_null_safe/models/place2.dart';
import 'package:trip_pal_null_safe/screens/home/home_drawer.dart';
import 'package:trip_pal_null_safe/screens/planing/places_search_page.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';

class MainMapScreen extends StatelessWidget {
  MainMapScreen({Key? key}) : super(key: key);
  final searchBarController = FloatingSearchBarController();
  final searchController = Get.find<SearchBarController>();

  Widget buildSearchBar() {
    final actions = [
      FloatingSearchBarAction.icon(
        showIfOpened: false,
        icon: Icons.swap_horiz,
        onTap: () =>
            searchController.updateMapView(Place2.fromJson(dummyJson[1])),
      ),
      FloatingSearchBarAction.icon(
        showIfOpened: false,
        icon: Icons.my_location,
        onTap: () => searchController.getMyLocation(),
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
              progress: searchController.isLoading,
              debounceDelay: const Duration(milliseconds: 500),
              onQueryChanged: searchController.onQueryChanged,
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
        items: searchController.suggestions,
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
            searchBarController.close();
            Future.delayed(
              const Duration(milliseconds: 500),
              () => searchController.clear(),
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
                    child: searchController.isHistory
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
        if (searchController.suggestions.isNotEmpty &&
            place != searchController.suggestions.last)
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
          child: GoogleMap(
            myLocationButtonEnabled: false,
            trafficEnabled: false,
            mapToolbarEnabled: false,
            myLocationEnabled: true,
            zoomControlsEnabled: false,
            initialCameraPosition: searchController.cameraPosition,
            onMapCreated: (controller) {
              searchController.mapController = controller;
            },
            markers: {
              Marker(
                  markerId: const MarkerId('marker1'),
                  infoWindow: InfoWindow(
                      title: searchController.markerInfoWindowTitle.value),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueAzure),
                  position: LatLng(searchController.latitude.value,
                      searchController.longitude.value))
            },
          ),
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
