import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:travel_app/scr/controllers/weather_buddy_controller.dart';
import 'package:travel_app/scr/models/places_search_controller.dart';
import 'package:travel_app/scr/screens/Main/home.dart';
import 'package:travel_app/scr/screens/credentials/login.dart';
import 'package:travel_app/scr/screens/weather/weather_buddy.dart';
import 'package:travel_app/scr/shared/constants.dart';

import 'scr/screens/places/trip_planning.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> pictures = ['14.jpg', '15.jpg', '16.jpg', '13.jpg'];

  void initState() {
    SizeConfig.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('TripPal'),
          actions: [
            IconButton(
                icon: Icon(Icons.cloud),
                onPressed: () {
                  Get.put(WeatherBuddyController(10));
                  Get.to(() => WeatherBuddy());
                }),
            IconButton(
              icon: Icon(FontAwesomeIcons.mapMarkedAlt, color: Colors.white),
              onPressed: () {
                Get.put(PlacesSearchController());
                Get.to(() => TripPlanning());
              },
            ),
            IconButton(
              icon: Icon(Icons.home, color: Colors.white),
              onPressed: () {
                Get.put(PlacesSearchController());
                Get.to(() => HomePagePV());
              },
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(() => Login());
          },
        ),
        body: Align(
          child: Text("Welcome to TripPal App."),
        ));
  }
}

void main() async {
  Paint.enableDithering = true;
  WidgetsFlutterBinding.ensureInitialized();
  //LocationCustom location =LocationCustom();
  //await location.init();
  //  Get.put(location);
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: Themes.mainTheme,
    home: Home(),
  ));
}
