import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/scr/screens/Home/Componenet/HomeDrawer.dart';
import 'package:travel_app/scr/screens/Home/home.dart';
import 'package:travel_app/scr/screens/Hotels/HotelSearchPage.dart';
import 'package:travel_app/scr/screens/Main/Componenet/Nav_bar_item.dart';
import 'package:travel_app/scr/screens/Profile/Profile.dart';
import 'package:travel_app/scr/screens/Trip/trip_types_screen.dart';
import 'package:travel_app/scr/screens/plan/trip_planning.dart';

class HomePagePV extends StatefulWidget {
  HomePagePV({Key key}) : super(key: key);

  @override
  _HomePagePVState createState() => _HomePagePVState();
}

class _HomePagePVState extends State<HomePagePV> {
  PageController _myPage;
  var selectedPage;
  String img = 'images/1.jpg';
  @override
  void initState() {
    super.initState();
    _myPage = PageController(initialPage: 3);
    selectedPage = 3;
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
            TripPlanning(),
            HotelSearchPage(),
            HomePage(),
            TripsPage(),
            ProfilePage(),
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
            color: Colors.white.withOpacity(0.8), borderRadius: BorderRadius.circular(20.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            NavBarItem(
              title: 'Browse',
              icon: FontAwesomeIcons.placeOfWorship,
              color: selectedPage == 0 ? Colors.blueAccent : Colors.black54,
              onPressed: () {
                _myPage.jumpToPage(0);
                setState(() {
                  selectedPage = 0;
                  img = 'images/map.jpg';
                });
              },
            ),
            NavBarItem(
              title: 'Hotels',
              icon: FontAwesomeIcons.hotel,
              color: selectedPage == 1 ? Colors.blueAccent : Colors.black54,
              onPressed: () {
                _myPage.jumpToPage(1);
                setState(() {
                  selectedPage = 1;
                });
              },
            ),
            NavBarItem(
              title: 'Home',
              icon: FontAwesomeIcons.home,
              color: selectedPage == 2 ? Colors.blueAccent : Colors.black54,
              onPressed: () {
                _myPage.jumpToPage(2);
                setState(() {
                  selectedPage = 2;
                });
              },
            ),
            NavBarItem(
              title: 'Plans',
              icon: FontAwesomeIcons.mapMarkedAlt,
              color: selectedPage == 3 ? Colors.blueAccent : Colors.black54,
              onPressed: () {
                _myPage.jumpToPage(3);
                setState(() {
                  selectedPage = 3;
                  img = 'images/hotel_.jpg';
                });
              },
            ),
            NavBarItem(
              title: 'Profile',
              icon: FontAwesomeIcons.user,
              color: selectedPage == 4 ? Colors.blueAccent : Colors.black54,
              onPressed: () {
                _myPage.jumpToPage(4);
                setState(() {
                  selectedPage = 4;
                  img = 'images/2.jpg';
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
