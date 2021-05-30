import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/scr/screens/Hotels/HotelSearchPage.dart';
import 'package:travel_app/scr/screens/Main/Componenet/Nav_bar_item.dart';
import 'package:travel_app/scr/screens/Main/Componenet/trip_card.dart';
import 'package:travel_app/scr/screens/Profile/Profile.dart';
import 'package:travel_app/scr/screens/Trip/filters.dart';

class HomePagePV extends StatefulWidget {
  HomePagePV({Key key}) : super(key: key);

  @override
  _HomePagePVState createState() => _HomePagePVState();
}

class _HomePagePVState extends State<HomePagePV> {
  PageController _myPage;
  var selectedPage;
  @override
  void initState() {
    super.initState();
    _myPage = PageController(initialPage: 2);
    selectedPage = 2;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _myPage,
        children: <Widget>[
          Center(child: Text('Places Search Engine')),
          Center(
              child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom : 30.0),
                  child: Text(
                    'Chose your fucking type',
                    style:  TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Lato'
                    ),
                  ),
                ),
                TripCard(
                  tripType: 'First Type',
                  tripWriter: 'A trip suggested by the work team',
                  tripExp: 'write a simple explanation write a simple explanation write a simple explanation write a simple explanation',
                  onTap: (){
                    Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FiltersScreen()),
                        );
                  },
                  img: AssetImage('images/1.jpg')
                ),
                TripCard(
                  tripType: 'Seconde Type',
                  tripWriter: 'A trip used by the other users',
                  tripExp: 'write a simple explanation write a simple explanation write a simple explanation write a simple explanation',
                  onTap: (){Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FiltersScreen()),
                        );},
                  img: AssetImage('images/2.jpg'),
                ),
                TripCard(
                  tripType: 'Third Type',
                  tripWriter: 'A trip you build by yourself',
                  tripExp: 'write a simple explanation write a simple explanation write a simple explanation write a simple explanation',
                  onTap: (){Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FiltersScreen()),
                        );},
                  img: AssetImage('images/3.jpg'),
                )
                ],
            ),
          )),
          Center(child: Text('Home')),
          HotelSearchPage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: Container(
        height: 60.0,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: Colors.grey.withAlpha(80),
            borderRadius: BorderRadius.circular(20.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            NavBarItem(
              title: 'Search',
              icon: FontAwesomeIcons.placeOfWorship,
              color: selectedPage == 0 ? Colors.blueAccent : Colors.black54,
              onPressed: () {
                _myPage.jumpToPage(0);
                setState(() {
                  selectedPage = 0;
                });
              },
            ),
            NavBarItem(
              title: 'Trip',
              icon: FontAwesomeIcons.mapMarkedAlt,
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
              title: 'Hotels',
              icon: FontAwesomeIcons.hotel,
              color: selectedPage == 3 ? Colors.blueAccent : Colors.black54,
              onPressed: () {
                _myPage.jumpToPage(3);
                setState(() {
                  selectedPage = 3;
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
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
