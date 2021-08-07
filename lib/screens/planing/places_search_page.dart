import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:trip_pal_null_safe/controllers/search_bar_controller.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';
import 'package:trip_pal_null_safe/widgets/simple/icon_rounded_widget.dart';
import 'package:trip_pal_null_safe/widgets/simple/place_card.dart';

class PlacesSearchPage extends GetView<SearchBarController> {
  PlacesSearchPage({Key? key}) : super(key: key);

  Widget buildBody() {
    return Scaffold(
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
                              title: controller.markerInfoWindowTitle.value),
                          icon: BitmapDescriptor.defaultMarkerWithHue(
                              BitmapDescriptor.hueAzure),
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
                                onTap: () =>
                                    controller.updateSelectedSubtype(e)))
                      ],
                    ))),
            Obx(() => controller.selectedSubtype.length > 0
                ? Divider(color: Colors.blueGrey[200])
                : SizedBox()),
            Obx(() => controller.selectedSubtype.length > 0
                ? Expanded(
                    child: ListView(
                      children: <Widget>[
                        ...controller.somePlaces.map((e) => PlaceCard(
                            place: e,
                            activated: false,
                            onTap: () => controller.updateMapView(e)))
                      ],
                    ),
                  )
                : SizedBox()),
          ],
        ),
      ),
    );
  }

  Widget buildFloatingSearchBar() {
    final actions = [
      // TODO add on tap action
      FloatingSearchBarAction.icon(
          showIfOpened: false, icon: Icons.location_on, onTap: () {}),
      FloatingSearchBarAction.searchToClear(
        showIfClosed: false,
      ),
    ];

    return FloatingSearchBar(
      hint: 'Search Location...',
      backgroundColor: Get.theme.backgroundColor,
      iconColor: Get.theme.appBarTheme.iconTheme!.color,
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      transitionDuration: const Duration(milliseconds: 800),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      openAxisAlignment: 0.0,
      debounceDelay: const Duration(milliseconds: 500),
      onQueryChanged: (query) {},
      transition: CircularFloatingSearchBarTransition(),
      actions: actions,
      builder: (context, transition) {
        return Container();
      },
      body: buildBody(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: buildFloatingSearchBar(),
    );
  }
}
