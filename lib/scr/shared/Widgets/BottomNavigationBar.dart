import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/scr/screens/Chat/chat.dart';
import 'package:travel_app/scr/screens/Home/home.dart';
import 'package:travel_app/scr/screens/Hotels/HotelSearchPage.dart';
import 'package:travel_app/scr/screens/LogIn/login.dart';
import 'package:travel_app/scr/screens/Profile/Profile.dart';

class BottomNavBar extends StatefulWidget {
  int currentIndex;

  BottomNavBar({this.currentIndex = 0});
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List<NavItem> childs = [
    NavItem(icon: Icons.home,title: "Home",nav: (){Get.to(()=>HomePage());}),
    NavItem(icon: Icons.flight, title: "Flights",nav:(){Get.to(()=>Login());}),
    NavItem(icon: Icons.chat, title: "ChatBot",nav: (){Get.to(()=>Chat());}),
    NavItem(icon: Icons.hotel, title: "Hotels",nav:(){Get.to(()=>HotelSearchPage());}),
    NavItem(icon: Icons.person, title: "Profile",nav:(){Get.to(()=>ProfilePage());}),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void _changeIndex(int index) {
      widget.currentIndex = index;
    }

    return Container(
        height: 50,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 8),
        color: Colors.grey[100],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: childs.map((item) {
            return Container(
              margin: EdgeInsets.all(5),
              child: GestureDetector(
                  child: Column(children: [
                    Icon(item.icon,
                        color: widget.currentIndex == childs.indexOf(item)
                            ? Theme.of(context).primaryColorDark
                            : Colors.grey[700],
                        size: 30),
                    Spacer(),
                    Text(
                      item.title,
                      style: TextStyle(
                          color: widget.currentIndex == childs.indexOf(item)
                              ? Theme.of(context).primaryColorDark
                              : Colors.grey,
                          fontSize: 8.4,fontWeight: FontWeight.w900
                          ),
                    ),
                  ]),
                  onTap: () {
                    setState((){
                    _changeIndex(childs.indexOf(item));
                    item.nav();
                    });
                  }
                  ),
            );
          }).toList(),
        ));
  }
}

class NavItem {
  final IconData icon;
  final String title;
  final Function nav;
  NavItem({this.icon, this.title,this.nav});
}
