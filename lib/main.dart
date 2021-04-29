import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/scr/screens/clima.dart';
import 'package:travel_app/scr/screens/place_details.dart';
import 'package:travel_app/scr/screens/review_writing.dart';
import 'package:travel_app/scr/screens/reviews.dart';
import 'package:travel_app/scr/screens/trip_planning.dart';
import 'package:travel_app/scr/shared/constants.dart';
import 'package:travel_app/scr/screens/login.dart';
import 'package:travel_app/scr/widgets/image_card.dart';

class Home extends StatelessWidget {
  final List<String> pictures = ['14.jpg', '15.jpg', '16.jpg', '13.jpg'];

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('TripPal'),
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
                  builder: (context) => PlaceDetails(),
                ));
          },
        ),
        body: Align(
          child: Text("Welcome to TripPal App."),
        )
        // body: Container(
        //   height: 400,
        //   child: StaggeredGridView.countBuilder(
        //     physics: BouncingScrollPhysics(),
        //     itemCount: 10,
        //     scrollDirection: Axis.horizontal,
        //     crossAxisCount: 2,
        //     mainAxisSpacing: 8,
        //     crossAxisSpacing: 10,
        //     staggeredTileBuilder: (int index) =>
        //         StaggeredTile.count(index == 0 ? 2 : 1, 1),
        //     itemBuilder: (context, index) => new Container(
        //         color: Colors.green,
        //         child: new Center(
        //           child: new CircleAvatar(
        //             backgroundColor: Colors.white,
        //             child: new Text('$index',
        //                 style:
        //                     TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        //           ),
        //         )),
        //   ),
        // ),
        );
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
