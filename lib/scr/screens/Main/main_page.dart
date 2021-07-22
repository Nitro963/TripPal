import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:travel_app/scr/controllers/filters_controller.dart';
import 'package:travel_app/scr/models/places_search_controller.dart';
import 'package:travel_app/scr/screens/Home/home_page.dart';
import 'package:travel_app/scr/screens/home_drawer/home_drawer.dart';
import 'package:travel_app/scr/screens/Hotels/HotelSearchPage.dart';
import 'package:travel_app/scr/screens/Main/Componenet/Nav_bar_item.dart';
import 'package:travel_app/scr/screens/Trip/trip_types_screen.dart';
import 'package:travel_app/scr/shared/constants.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late PageController _myPage;
  late int selectedPage;
  String img = 'images/1.jpg';
  @override
  void initState() {
    super.initState();
    _myPage = PageController(initialPage: 1);
    selectedPage = 1;
    Get.put(PlacesSearchController());
    Get.put(FilterController());
    MySize.init(Get.context!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: false,
      drawer: HomeDrawer(),
      body: Stack(
        children: <Widget>[
          PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: _myPage,
            children: <Widget>[
              HotelSearchPage(),
              HomePage(),
              TripsPage(),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: 60.0,
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.96),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    NavBarItem(
                      title: 'Hotels',
                      icon: FontAwesomeIcons.hotel,
                      color: selectedPage == 0
                          ? Colors.indigo[500]
                          : Colors.black54,
                      onPressed: () {
                        _myPage.jumpToPage(0);
                        setState(() {
                          selectedPage = 0;
                          print('Hotels Pressed!');
                        });
                      },
                    ),
                    NavBarItem(
                      title: 'Home',
                      icon: FontAwesomeIcons.home,
                      color: selectedPage == 1
                          ? Colors.indigo[500]
                          : Colors.black54,
                      onPressed: () {
                        _myPage.jumpToPage(1);
                        setState(() {
                          selectedPage = 1;
                          print('Home Pressed!');
                        });
                      },
                    ),
                    NavBarItem(
                      title: 'Plans',
                      icon: FontAwesomeIcons.mapMarkedAlt,
                      color: selectedPage == 2
                          ? Colors.indigo[500]
                          : Colors.black54,
                      onPressed: () {
                        _myPage.jumpToPage(2);
                        setState(() {
                          selectedPage = 2;
                          print('Plans Pressed!');
                          img = 'images/hotel_.jpg';
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
