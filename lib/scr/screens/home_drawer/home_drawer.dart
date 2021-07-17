import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:travel_app/scr/controllers/profile_controller.dart';
import 'package:travel_app/scr/controllers/weather_buddy_controller.dart';
import 'package:travel_app/scr/screens/Profile/Profile_page.dart';
import 'package:travel_app/scr/screens/chat/chat.dart';
import 'package:travel_app/scr/screens/credentials/login.dart';
import 'package:travel_app/scr/screens/places/user_saved_places.dart';
import 'package:travel_app/scr/screens/weather/weather_buddy.dart';

import 'components/home_drawer_item.dart';

class HomeDrawer extends StatelessWidget {
  final controller = Get.put(ProfileContnroller());

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(children: [
      CustomDrawerHeader(controller: controller),
      HomeDrawerItem(
          title: 'Account',
          subTitle: 'Go to your profile',
          iconName: FontAwesomeIcons.solidUserCircle,
          onTap: () => Get.to(ProfilePage())),
      HomeDrawerItem(
          title: 'Saved Places',
          subTitle: 'Check out your saved places',
          iconName: FontAwesomeIcons.solidHeart,
          onTap: () => Get.to(SavedPlaces())),
      HomeDrawerItem(
        title: 'Address',
        subTitle: 'Add or remove an address',
        iconName: Icons.location_on,
        onTap: () {},
      ),
      HomeDrawerItem(
          title: 'AI-Assistant',
          subTitle: 'Ask questions to our bot',
          iconName: Icons.message,
          onTap: () => Get.to(Chat())),
      HomeDrawerItem(
          title: 'Weather Service ',
          subTitle: 'Check the weather condition',
          iconName: FontAwesomeIcons.cloudRain,
          onTap: () {
            Get.put(WeatherBuddyController(10));
            Get.to(() => WeatherBuddy());
          }),
      HomeDrawerItem(
          title: 'TODO List',
          subTitle: 'Save your notes',
          iconName: FontAwesomeIcons.solidCheckCircle,
          onTap: () {}),
      HomeDrawerItem(
        title: 'Privacy policy',
        subTitle: 'See our privacy policies',
        iconName: FontAwesomeIcons.lock,
        onTap: () {},
      ),
      HomeDrawerItem(
        title: 'Log out',
        subTitle: 'Return to guest mode',
        iconName: Icons.logout,
        onTap: () => Get.to(() => Login()),
      ),
      Container(
        padding: EdgeInsets.only(top: 45.0),
        child: Center(
          child: TypewriterAnimatedTextKit(
            speed: Duration(microseconds: 100000),
            text: ['Trip-Pal  \u00a9'],
            textStyle: TextStyle(
                fontSize: 16.0,
                color: Colors.blueGrey[900].withOpacity(0.4),
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat'),
          ),
        ),
      ),
    ]));
  }
}

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({
    Key key,
    @required this.controller,
  }) : super(key: key);

  final ProfileContnroller controller;

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(14.0)),
      ),
      child: Row(
        children: <Widget>[
          Flexible(
            child: Hero(
              tag: 1,
              child: Container(
                height: 120.0,
                width: 120.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  image: DecorationImage(
                      image: AssetImage(controller.imgPath),
                      fit: BoxFit.cover),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: Offset(2, -4),
                    ),
                  ],
                ),
              ),
            ),
          ),
          ProfileMiniInfo(controller: controller)
        ],
      ),
    );
  }
}

class ProfileMiniInfo extends StatelessWidget {
  const ProfileMiniInfo({
    Key key,
    @required this.controller,
  }) : super(key: key);

  final ProfileContnroller controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Flexible(
            flex: 2,
            child: Text(
              controller.userName,
              style: TextStyle(
                  color: Colors.blueGrey[900], fontSize: 20.0),
            ),
          ),
          SizedBox(
            height: 6.0,
          ),
          Flexible(
            flex: 1,
            child: Text(
              controller.userSubName,
              style: TextStyle(
                  color: Colors.blueGrey[600], fontSize: 12.0),
            ),
          ),
          SizedBox(height: 8.0),
          Flexible(
            flex: 3,
            child: Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.grey[200]),
              child: Row(
                children: <Widget>[
                  InfoItem(
                    title: 'Plans',
                    count: 7,
                  ),
                  SizedBox(
                    width: 6.0,
                  ),
                  InfoItem(
                    title: 'Reviews',
                    count: 16,
                  ),
                  SizedBox(
                    width: 6.0,
                  ),
                  InfoItem(
                    title: 'Blogs',
                    count: 10,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class InfoItem extends StatelessWidget {
  const InfoItem({
    Key key,
    @required this.title,
    @required this.count,
  }) : super(key: key);
  final String title;
  final int count;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
          flex: 2,
          child: Text(
            title,
            style: TextStyle(color: Colors.grey, fontSize: 10.0),
          ),
        ),
        Flexible(
          flex: 3,
          child: Text(
            count.toString(),
            style: TextStyle(fontSize: 18.0),
          ),
        )
      ],
    );
  }
}
