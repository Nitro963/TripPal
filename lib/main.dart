import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/scr/models/search_model.dart';
import 'package:travel_app/scr/screens/chat.dart';
import 'package:travel_app/scr/screens/check_list.dart';
import 'package:travel_app/scr/screens/clima.dart';
import 'package:travel_app/scr/screens/password_reset.dart';
import 'package:travel_app/scr/screens/place_details.dart';
import 'package:travel_app/scr/screens/review_writing.dart';
import 'package:travel_app/scr/screens/reviews.dart';
import 'package:travel_app/scr/shared/constants.dart';
import 'package:travel_app/scr/screens/login.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ClimaSearch(),
                ));
          },
        ),
        body: Align(
          child: Text("Welcome to TripPal App.",
              style: TextStyle(color: Colors.black)),
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
