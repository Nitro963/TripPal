import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:travel_app/scr/models/PlacesSEData.dart';
import 'package:travel_app/scr/screens/places/components/place_class.dart';
import 'package:travel_app/scr/shared/constants.dart';

import 'components/icon_rounded_widget.dart';
import 'components/place_card.dart';

class PlacesSearchEngine extends StatefulWidget {
  PlacesSearchEngine({Key key}) : super(key: key);

  @override
  _PlacesSearchEngineState createState() => _PlacesSearchEngineState();
}

class _PlacesSearchEngineState extends State<PlacesSearchEngine> {
  List<Place2> testingPlaces = List<Place2>.empty(growable: true);

  List<Widget> types = List<Widget>.empty(growable: true).obs;
  List<Widget> subTypes = List<Widget>.empty(growable: true).obs;

  final PageController scrollController = PageController();

  Map<String, RxBool> typesCheck = Map<String, RxBool>();
  Map<String, RxBool> subTypesCheck = Map<String, RxBool>();
  bool _visible = false;
  void updateTypesTaps(String selectedType) {
    setState(() {
      for (String type in typesCheck.keys) {
        if (selectedType != type)
          typesCheck[type].value = false;
        else
          typesCheck[type].toggle();
      }
      buildSubTypes(selectedType);
    });
  }

  void buildSubTypes(String selectedType) {
    print(selectedType);
    subTypes.clear();
    setState(() {
      for (String subType in placesDict[selectedType]) {
        subTypesCheck[subType] = false.obs;
        subTypes.add(RoundedGestWithIconWidget(
            title: subType,
            selected: subTypesCheck[subType],
            onTap: () => updateSubTypesTaps(subType),
            iconName: null));
      }
    });
    print(subTypes);
  }

  void updateSubTypesTaps(String selectedSubType) {
    setState(() {
      for (String subType in subTypesCheck.keys) {
        if (selectedSubType != subType)
          subTypesCheck[subType].value = false;
        else
          subTypesCheck[subType].toggle();
      }
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
                width: SizeConfig.screenWidth,
                height: SizeConfig.screenHeight / 3,
                margin: EdgeInsets.only(bottom: 20.0),
                decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(color: Colors.grey[200], width: 5.0)),
                    image: DecorationImage(
                        image: AssetImage('images/map.jpg'),
                        fit: BoxFit.cover)),
              ),
              Text('Explore new places and start your trip',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
              Container(
                height: 60.0,
                // margin: const EdgeInsets.only(top: 65),
                child:
                    ListView(scrollDirection: Axis.horizontal, children: types),
              ),
              subTypes.length > 0
                  ? Divider(color: Colors.blueGrey[200])
                  : SizedBox(),
              Container(
                height: 60.0,
                child: ListView(
                    scrollDirection: Axis.horizontal, children: subTypes),
              ),
              subTypes.length > 0
                  ? Divider(color: Colors.blueGrey[200])
                  : SizedBox(),
              Visibility(
                  visible: _visible,
                  child: Expanded(
                    child: ListView(
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
                          if (place != null)
                            PlaceCard(
                                data: place,
                                primaryColor: selectPrimaryColor(
                                    place.kinds.split(',')[0]),
                                secondaryColor: selectSecondartColor(
                                    place.kinds.split(',')[0])),
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
        showIfOpened: false,
        icon: Icons.location_on,
        onTap: () => Get.back(),
      ),
      FloatingSearchBarAction.searchToClear(
        showIfClosed: false,
      ),
    ];
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return FloatingSearchBar(
      hint: 'Search Location...',
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
          selected: typesCheck[type],
          onTap: () => updateTypesTaps(type),
          iconName: selectIcon(type)));
    }
  }

  @override
  Widget build(BuildContext context) {
    for (var place in dummyJson) {
      print(place);
      testingPlaces.add(Place2.fromJson(place));
    }
    // print(testingPlaces[0].name);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: buildFloatingSearchBar(),
    );
  }
}
