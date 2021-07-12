import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
import 'package:implicitly_animated_reorderable_list/transitions.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:travel_app/scr/models/PlacesSEData.dart';
import 'package:travel_app/scr/models/place.dart';
import 'package:travel_app/scr/models/places_search_controller.dart';
import 'package:travel_app/scr/screens/places/components/place_class.dart';
import 'package:travel_app/scr/screens/places/places_search_page.dart';
import 'package:travel_app/scr/shared/constants.dart';

import 'Componenet/PopularPlacesPageView.dart';
import 'Componenet/TopCitiesWidget.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);
  final searchBarController = FloatingSearchBarController();
  final searchController = Get.find<PlacesSearchController>();

  Widget buildSearchBar(onTap) {
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
        onTap: () =>
            searchController.getMyLocation(),
      ),
      FloatingSearchBarAction.icon(
        showIfOpened: false,
        icon: Icons.not_listed_location_outlined,
        onTap: onTap,
      ),
      FloatingSearchBarAction.searchToClear(
        showIfClosed: false,
      ),
    ];

    return Obx(() => FloatingSearchBar(
          backgroundColor: Colors.white,
          controller: searchBarController,
          clearQueryOnClose: true,
          iconColor: Colors.grey,
          transitionDuration: const Duration(milliseconds: 800),
          transitionCurve: Curves.easeInOutCubic,
          physics: const BouncingScrollPhysics(),
          axisAlignment: 0,
          openAxisAlignment: 0.0,
          maxWidth: SizeConfig.screenWidth,
          actions: actions,
          progress: searchController.isLoading,
          debounceDelay: const Duration(milliseconds: 500),
          onQueryChanged: searchController.onQueryChanged,
          transition: CircularFloatingSearchBarTransition(),
          accentColor: Colors.blueAccent,
          builder: (context, _) => buildExpandableBody(),
          body: buildBody(),
        ));
  }

  Widget buildExpandableBody() {
    return Material(
      color: Colors.white,
      elevation: 4.0,
      borderRadius: BorderRadius.circular(8),
      child: Obx(() => ImplicitlyAnimatedList<Place>(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            items: searchController.suggestions.take(6).toList(),
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
          )),
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
                        ? const Icon(Icons.history, key: Key('history'))
                        : const Icon(Icons.place, key: Key('place')),
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
                        style: Get.textTheme.bodyText2
                            .copyWith(color: Colors.grey.shade600),
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
    searchController.mapHeight = (SizeConfig.screenHeight / 3).obs;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsetsDirectional.only(bottom: 16),
        child: SafeArea(
            child: ListView(children: [
          GestureDetector(
            onTap: () {
              if (searchController.mapHeight.value ==
                  SizeConfig.screenHeight / 3)
                searchController.updateMapHeight(SizeConfig.screenHeight);
              else
                searchController.updateMapHeight(SizeConfig.screenHeight / 3);
            },
            child: Obx(() => Container(
                  width: SizeConfig.screenWidth,
                  height: searchController.mapHeight.value,
                  margin: EdgeInsets.only(bottom: 20.0),
                  child: GoogleMap(
                    myLocationButtonEnabled: false,
                    trafficEnabled: false,
                    mapToolbarEnabled: false,
                    myLocationEnabled: true,
                    initialCameraPosition: searchController.cameraPosition,
                    onMapCreated: (controller) {
                      searchController.mapController = controller;
                    },
                    markers: {
                      Marker(
                          markerId: const MarkerId('marker1'),
                          infoWindow: InfoWindow(
                              title:
                                  searchController.markerInfoWindowTitle.value),
                          icon: BitmapDescriptor.defaultMarkerWithHue(
                              BitmapDescriptor.hueAzure),
                          position: LatLng(searchController.latitude.value,
                              searchController.longitud.value))
                    },
                  ),
                )),
          ),
          TopCities(),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
            child: Text("Fresh Inspiring Blogs",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                )),
          ),
          PopularPlacesPageView(),
        ])),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[50],
      child: Directionality(
          textDirection: TextDirection.ltr,
          child: buildSearchBar(() {
            Get.off(PlacesSearchEngine());
          })),
    );
  }
}
