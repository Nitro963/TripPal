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
import 'package:trip_pal_null_safe/screens/home/popular_places_view.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final searchBarController = FloatingSearchBarController();
  final searchController = Get.find<SearchBarController>();

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
        onTap: () => searchController.getMyLocation(),
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
          backgroundColor: Get.theme.colorScheme.background,
          controller: searchBarController,
          clearQueryOnClose: true,
          iconColor: Colors.grey,
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
        ));
  }

  Widget buildExpandableBody() {
    return Material(
      color: Get.theme.colorScheme.background,
      elevation: 4.0,
      borderRadius: BorderRadius.circular(8),
      child: Obx(() => ImplicitlyAnimatedList<Place>(
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
            // WHY!!!
            // searchController.updateMapView(place);
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
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsetsDirectional.only(bottom: 16),
        child: SafeArea(
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              GestureDetector(
                onTap: () {
                  // Why?! user getters and setters!!
                  // Map not working in full screen mode!
                  if (searchController.mapHeight.value >
                      MySize.screenHeight / 3)
                    searchController.updateMapHeight(MySize.screenHeight / 3);
                  else
                    searchController.updateMapHeight(MySize.screenHeight);
                },
                child: Obx(
                  () => Container(
                    width: MySize.screenWidth,
                    height: searchController.mapHeight.value,
                    margin: EdgeInsets.only(bottom: 20.0),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Colors.grey[350]!, width: 3.0))),
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
                                title: searchController
                                    .markerInfoWindowTitle.value),
                            icon: BitmapDescriptor.defaultMarkerWithHue(
                                BitmapDescriptor.hueAzure),
                            position: LatLng(searchController.latitude.value,
                                searchController.longitude.value))
                      },
                    ),
                  ),
                ),
              ),
              // TopCities(),
              Padding(
                padding:
                    const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 8.0),
                child: Text("Fresh Inspiring Blog's",
                    style: Get.theme.textTheme.headline3!),
              ),
              PopularPlacesView(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: buildSearchBar(
        () {
          // Get.off(PlacesSearchEngine());
        },
      ),
    );
  }
}

// class TopCities extends StatelessWidget {
//   final List<Place> demoPlaces = [
//     Place(
//         name: "Damascus", country: "syria", image: "images/1.jpg", rating: 0.5),
//     Place(name: "Paris", country: "France", image: "images/2.jpg", rating: 4.5),
//     Place(name: "New York", country: "USA", image: "images/3.jpg", rating: 5),
//     Place(
//         name: "Australia",
//         country: "Australia",
//         image: "images/4.jpg",
//         rating: 3.5),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         height: 140,
//         padding: const EdgeInsets.symmetric(horizontal: 10.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(
//               flex: 3,
//               child: Row(
//                 children: [
//                   Text("Best Cities of The Week",
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.w700,
//                       )),
//                   SizedBox(width: 8),
//                   Container(
//                     height: 20,
//                     width: 40,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(3),
//                       color: Theme.of(context).primaryColorDark,
//                     ),
//                     child: Center(
//                         child: Text(
//                       "Fresh",
//                       style: TextStyle(color: Colors.white, fontFamily: 'Lato'),
//                       textAlign: TextAlign.center,
//                     )),
//                   )
//                 ],
//               ),
//             ),
//             Spacer(flex: 1),
//             Expanded(
//               flex: 12,
//               child: SizedBox(
//                   height: 100,
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                     child: ListView.builder(
//                       shrinkWrap: true,
//                       scrollDirection: Axis.horizontal,
//                       physics: BouncingScrollPhysics(),
//                       itemCount: demoPlaces.length,
//                       itemBuilder: (context, index) {
//                         return Padding(
//                           padding: const EdgeInsets.only(right: 8.0),
//                           child: PlaceCard(demoPlaces[index].image!,
//                               demoPlaces[index].name, 120, 120),
//                         );
//                       },
//                     ),
//                   )),
//             ),
//             Spacer(flex: 2)
//           ],
//         ));
//   }
// }
