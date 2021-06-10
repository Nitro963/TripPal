import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travel_app/scr/models/DemoData.dart';
import 'package:travel_app/scr/models/PlacesSEData.dart';
import 'package:travel_app/scr/screens/filters/components/rounded_gesture_widget.dart';
import 'package:travel_app/scr/screens/places/rounded_gesture_widget_with_icon.dart';
import 'package:travel_app/scr/screens/trip/components/trip_widget.dart';
import 'package:travel_app/scr/screens/trip/trip_resulte_screen.dart';
import 'package:travel_app/scr/shared/constants.dart';

class PlacesSearchPage extends StatefulWidget {
  PlacesSearchPage({Key key}) : super(key: key);

  @override
  _PlacesSearchPageState createState() => _PlacesSearchPageState();
}

class _PlacesSearchPageState extends State<PlacesSearchPage> {
  Map<String, List<String>> _placesDict = placesDict;
  List<Widget> _content = List<Widget>.empty(growable: true).obs;
  List<Widget> _foods = List<Widget>.empty(growable: true).obs;

  final PageController _scrollController = PageController();
  Map<String, RxBool> _contentCheck = Map<String, RxBool>();
  Map<String, RxBool> _foodsCheck = Map<String, RxBool>();
  List<Widget> _test = List<Widget>.empty(growable: true);
  bool _visible = false;
  void initState() {
    super.initState();
    dummyTrips.forEach((element) {
      String _city = element.city;
      String _country = element.country;
      _test.add(
        new TripWidget(
          days: element.days,
          imgPath: 'images/$_city.jpg'.toLowerCase(),
          tripType: element.type,
          location: '$_city, $_country',
          details: element.details,
          onTap: () {
            Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                TripPage()),
                      );
          },
        ),
      );
    });
    for (String type in _placesDict.keys) {
      _contentCheck[type] = false.obs;
      _content.add(new RoundedGestWithIconWidget(
          title: type,
          selected: _contentCheck[type],
          onTap: () {
            updateBasicTaps(type);
          },
          icon: selectIcon(type)));
    }
  }

  void updateBasicTaps(String pressedType) {
    setState(() {
      for (String type in _contentCheck.keys) {
        if (type != pressedType && _contentCheck[type] == true.obs) {
          _contentCheck[type].toggle();
        } else if (type == pressedType && _contentCheck[type] == false.obs) {
          _contentCheck[type].toggle();
        }
      }
      _foods.clear();

      for (String type in _placesDict[pressedType]) {
        _foodsCheck[type] = false.obs;
        _foods.add(
          new RoundedGestWidget(
              title: type,
              selected: _foodsCheck[type],
              onTap: () {
                updateSubTaps(type);
              }),
        );
      }
    });
  }

  void updateSubTaps(String pressedType) {
    setState(() {
      for (String type in _foodsCheck.keys) {
        if (type != pressedType && _foodsCheck[type] == true.obs) {
          _foodsCheck[type].toggle();
        } else if (type == pressedType && _foodsCheck[type] == false.obs) {
          _foodsCheck[type].toggle();
          _visible = true;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: size.width,
          child: Column(
            children: <Widget>[
              Container(
                height: 56.0,
                color: Colors.grey[350],
                child: Center(
                  child: Text('add search bar here!'),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Center(
                  child: Text(
                    'What are you looking for?',
                    style: kSeconderyFiltersTitleStyle.copyWith(fontSize: 20.0),
                  ),
                ),
              ),
              Container(
                height: 60.0,
                margin: const EdgeInsets.symmetric(vertical: 5.0),
                child: ListView(
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  children: _content,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                child: Divider(
                  color: Colors.blue[100],
                  
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(20.0),
              //   child: SmoothPageIndicator(
              //     controller: _scrollController,
              //     count: 3,
              //     effect: ScaleEffect(
              //       activeDotColor: Colors.blue[900],
              //       dotColor: Colors.blue[200],
              //       dotWidth: 9,
              //       dotHeight: 9,
              //       spacing: 6,
              //     ),
              //   ),
              // ),
              Container(
                height: 50,
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: _foods),
              ),
              Expanded(
                child: Visibility(
                  visible: _visible,
                  child: Container(
                    width: size.width,
                    height: size.height,
                    margin: const EdgeInsets.symmetric(horizontal: 1.0, vertical: 20.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          // padding: EdgeInsets.all(20),
                          child: Text(
                            'Here is What are you looking for ',
                            style: kSeconderyFiltersTitleStyle.copyWith(fontSize: 20.0),
                          ),
                        ),
                        Expanded(
                          
                          child: ListView(
                            children: _test,
                          ),
                        )
                      ],
                    ),
                  )
                  ),
              )
            ],
            
          ),
        ),
      ),
    );
  }
}
