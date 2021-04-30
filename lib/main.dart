import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:travel_app/scr/models/places_search_controller.dart';
import 'package:travel_app/scr/screens/clima.dart';
import 'package:travel_app/scr/screens/place_details.dart';
import 'package:travel_app/scr/screens/review_writing.dart';
import 'package:travel_app/scr/screens/reviews.dart';
import 'package:travel_app/scr/screens/trip_planning.dart';
import 'package:travel_app/scr/shared/constants.dart';
import 'package:travel_app/scr/screens/login.dart';
import 'package:travel_app/scr/widgets/image_card.dart';

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
                  Get.to(() => Clima());
                }),
            IconButton(
              icon: Icon(FontAwesomeIcons.mapMarkedAlt, color: Colors.white),
              onPressed: () {
                Get.put(PlacesSearchController());
                Get.to(() => TripPlanning());
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

void main() {
  Paint.enableDithering = true;
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: Themes.mainTheme,
    home: Home(),
  ));
}
