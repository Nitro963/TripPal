import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
import 'package:implicitly_animated_reorderable_list/transitions.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:trip_pal_null_safe/controllers/search_bar_controller.dart';
import 'package:trip_pal_null_safe/models/location.dart';
import 'package:trip_pal_null_safe/models/place.dart';
import 'package:trip_pal_null_safe/services/open_trip_map_service.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';
import 'package:trip_pal_null_safe/widgets/simple/icon_rounded_widget.dart';
import 'package:trip_pal_null_safe/widgets/simple/place_card.dart';

class PlacesSearchPage extends GetView<SearchBarController> {
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
        child: Column(
          children: <Widget>[
            Container(
                width: MySize.screenWidth,
                height: MySize.screenHeight / 3,
                margin: EdgeInsets.only(bottom: 20.0),
                child: Obx(
                  () => GoogleMap(
                    myLocationButtonEnabled: false,
                    trafficEnabled: false,
                    mapToolbarEnabled: false,
                    myLocationEnabled: true,
                    zoomControlsEnabled: false,
                    initialCameraPosition: controller.cameraPosition,
                    onMapCreated: (mapController) {
                      controller.mapController = mapController;
                    },
                    markers: {
                      Marker(
                          markerId: const MarkerId('marker1'),
                          infoWindow: InfoWindow(
                              title: controller.markerInfoWindowTitle.value,
                              snippet:
                                  '${controller.markerInfoSnip.value.capitalizeFirst} Place'),
                          icon: BitmapDescriptor.defaultMarkerWithHue(
                              BitmapDescriptor.hueRed),
                          position: LatLng(controller.latitude.value,
                              controller.longitude.value))
                    },
                  ),
                )),
            Text('Explore new places and start your trip',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
            Container(
                height: MySize.getScaledSizeHeight(70),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    ...controller.getTypes().map((e) => Obx(() =>
                        RoundedTypeCard(
                            title: e,
                            selected: controller.selectedType == e
                                ? true.obs
                                : false.obs,
                            onTap: () => controller.updateSelectedType(e))))
                  ],
                )),
            Obx(() => controller.selectedType.length > 0
                ? Divider(color: Colors.blueGrey[200])
                : SizedBox()),
            Container(
                height: MySize.getScaledSizeHeight(70),
                child: Obx(() => ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        ...controller.getSubtypes(controller.selectedType).map(
                            (e) => RoundedTypeCard(
                                title: e,
                                selected: controller.selectedSubtype == e
                                    ? true.obs
                                    : false.obs,
                                onTap: () {
                                  controller.updateSelectedSubtype(e);
                                  OpenTripMapApi().getPlacesList(
                                      lat: controller.latitude.value,
                                      lon: controller.longitude.value,
                                      radius: 1000000,
                                      kinds: OpenTripMapTrueLabels[e]!,
                                      onSuccess: (data) {
                                        controller.updatemapPlacesList(data);
                                      },
                                      onError: (error) {
                                        print(error);
                                      });
                                }))
                      ],
                    ))),
            Obx(() => controller.mapPlacesList.length > 0
                ? Divider(color: Colors.blueGrey[200])
                : SizedBox()),
            Obx(() => controller.mapPlacesList.length > 0
                ? Expanded(
                    child: ListView(
                      children: <Widget>[
                        ...controller.mapPlacesList.map((e) => PlaceCard(
                            place: e,
                            activated: false,
                            onTap: () {
                              controller.updateMapView(e);
                            }))
                      ],
                    ),
                  )
                : Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.place, size: 40),
                          Text('No ${controller.selectedSubtype} Places!')
                        ],
                      ),
                    ),
                  )),
          ],
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
