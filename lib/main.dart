import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/scr/screens/clima.dart';
import 'package:travel_app/scr/screens/trip_planning.dart';
import 'package:travel_app/scr/shared/constants.dart';
import 'package:travel_app/scr/screens/login.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                icon: Icon(Icons.cloud),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Clima(),
                      ));
                }),
            IconButton(
              icon: Icon(FontAwesomeIcons.mapMarkedAlt, color: Colors.white),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TripPlanning()));
              },
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Login(),
                ));
          },
        ),
        body: Align(
          child: Text("Welcome to TripPal App."),
        ));
  }
}

void main() {
  Paint.enableDithering = true;
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: Themes.mainTheme,
    home: Home(),
  ));
}
