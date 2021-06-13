import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:travel_app/scr/models/PlacesSEData.dart';
import 'package:travel_app/scr/screens/Home/Componenet/BlogListWidget.dart';
import 'package:travel_app/scr/shared/constants.dart';

import 'components/icon_rounded_widget.dart';

class PlacesSearchEngine extends StatefulWidget {
  PlacesSearchEngine({Key key}) : super(key: key);

  @override
  _PlacesSearchEngineState createState() => _PlacesSearchEngineState();
}

class _PlacesSearchEngineState extends State<PlacesSearchEngine> {
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
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                height: 65.0,
                margin:const EdgeInsets.only(top: 65),
                child:
                    ListView(scrollDirection: Axis.horizontal, children: types),
              ),
              subTypes.length > 0
                  ? Divider(color: Colors.blueGrey[200])
                  : SizedBox(),
              Container(
                height: 65.0,
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
                        BlogList(),
                        BlogList(),
                        BlogList(),
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
      // width: isPortrait ? 600 : 500,
      debounceDelay: const Duration(milliseconds: 500),
      onQueryChanged: (query) {
        // Call your model, bloc, controller here.
      },
      // Specify a custom transition to be used for
      // animating between opened and closed stated.
      transition: CircularFloatingSearchBarTransition(),
      actions: actions,
      builder: (context, transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Material(
            color: Colors.white,
            elevation: 4.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: Colors.accents.map((color) {
                return Container(height: 112, color: color);
              }).toList(),
            ),
          ),
        );
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: buildFloatingSearchBar(),
    );
  }
}
