import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:trip_pal_null_safe/controllers/search_bar_controller.dart';
import 'package:trip_pal_null_safe/models/PlacesSEData.dart';
import 'package:trip_pal_null_safe/models/place2.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';
import 'package:trip_pal_null_safe/widgets/simple/icon_rounded_widget.dart';
import 'package:trip_pal_null_safe/widgets/simple/place_card.dart';

class PlacesSearchEngine extends StatefulWidget {
  PlacesSearchEngine({Key? key}) : super(key: key);

  @override
  _PlacesSearchEngineState createState() => _PlacesSearchEngineState();
}

// TODO convert to GetView
// TODO fix bad implementation bugs!
// TODO user the same logic of filter controller of the LocationPage
// TODO refactor planning package
class _PlacesSearchEngineState extends State<PlacesSearchEngine> {
  final searchBarController = FloatingSearchBarController();
  final searchController = Get.find<SearchBarController>();

  List<Place2> testingPlaces = List<Place2>.empty(growable: true);

  List<Widget> types = List<Widget>.empty(growable: true);
  List<Widget> subTypes = List<Widget>.empty(growable: true);

  final PageController scrollController = PageController();

  Map<String, RxBool> typesCheck = Map<String, RxBool>();
  Map<String, RxBool> subTypesCheck = Map<String, RxBool>();
  bool _visible = false;

  void updateTypesTaps(String selectedType) {
    setState(() {
      typesCheck.keys.forEach((type) {
        if (selectedType != type)
          typesCheck[type]!.value = false;
        else
          typesCheck[type]!.toggle();
      });
      buildSubTypes(selectedType);
    });
  }

  void buildSubTypes(String selectedType) {
    print(selectedType);
    subTypes.clear();
    setState(() {
      placesDict[selectedType]!.forEach((subType) {
        subTypesCheck[subType] = false.obs;
        subTypes.add(RoundedGestWithIconWidget(
            title: subType,
            selected: subTypesCheck[subType]!,
            onTap: () => updateSubTypesTaps(subType)));
      });
    });
    print(subTypes);
  }

  void updateSubTypesTaps(String selectedSubType) {
    setState(() {
      subTypesCheck.keys.forEach((subType) {
        if (selectedSubType != subType)
          subTypesCheck[subType]!.value = false;
        else
          subTypesCheck[subType]!.toggle();
      });
      _visible = true;
    });
  }

  Widget buildBody() {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            // mainAxisAlignment: MainAxisAlignment.s,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                width: MySize.screenWidth,
                height: MySize.screenHeight / 3,
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
                            searchController.longitude.value))
                  },
                ),
              ),
              Text('Explore new places and start your trip',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
              Container(
                height: MySize.getScaledSizeHeight(70),
                // margin: const EdgeInsets.only(top: 65),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: types,
                  physics: BouncingScrollPhysics(),
                ),
              ),
              subTypes.length > 0
                  ? Divider(color: Colors.blueGrey[200])
                  : SizedBox(),
              Container(
                height: MySize.getScaledSizeHeight(70),
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: subTypes,
                  physics: BouncingScrollPhysics(),
                ),
              ),
              subTypes.length > 0
                  ? Divider(color: Colors.blueGrey[200])
                  : SizedBox(),
              Visibility(
                  visible: _visible,
                  child: Flexible(
                    child: ListView(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(20.0, .0, 30.0, 10.0),
                          child: Text(
                            "Check out the places we found for you",
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        for (Place2 place in testingPlaces)
                          PlaceCard(
                              place: place,
                              activated: false,
                              onTap: () => setState(
                                  () => searchController.updateMapView(place)))
                      ],
                    ),
                  ))
            ],
          ),
        ));
  }

  Widget buildFloatingSearchBar() {
    final actions = [
      FloatingSearchBarAction.icon(
          showIfOpened: false, icon: Icons.location_on, onTap: () {}),
      FloatingSearchBarAction.searchToClear(
        showIfClosed: false,
      ),
    ];
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return FloatingSearchBar(
      hint: 'Search Location...',
      backgroundColor: Get.theme.backgroundColor,
      iconColor: Get.theme.colorScheme.onBackground,
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      transitionDuration: const Duration(milliseconds: 800),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      axisAlignment: isPortrait ? 0.0 : -1.0,
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
  void initState() {
    super.initState();
    for (String type in placesDict.keys) {
      typesCheck[type] = false.obs;
      types.add(RoundedGestWithIconWidget(
          title: type,
          selected: typesCheck[type]!,
          onTap: () => updateTypesTaps(type),
          iconName: selectIcon(type)));
    }
  }

  @override
  Widget build(BuildContext context) {
    for (var place in dummyJson) {
      testingPlaces.add(Place2.fromJson(place));
    }
    // print(testingPlaces[0].name);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: buildFloatingSearchBar(),
    );
  }
}