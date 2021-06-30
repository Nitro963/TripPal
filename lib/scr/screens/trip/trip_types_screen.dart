import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/scr/screens/filters/locations_page.dart';
import 'package:travel_app/scr/screens/places/user_saved_places.dart';
import 'package:travel_app/scr/screens/trip/components/trip_card.dart';
import 'package:travel_app/scr/screens/trip/users_trips_screen.dart';
import 'package:travel_app/scr/shared/constants.dart';

class TripsPage extends StatelessWidget {
  const TripsPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/trip_3.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          color: Colors.black38,
        ),
        Container(
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight,
          padding: EdgeInsets.only(bottom: 72.0),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                    child: Text(
                      'Pick Up Your Type',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 10),
                    child: Text(
                      'We\'ll use this type as base for building a great plan for you',
                      style: kSeconderyFiltersTitleStyle.copyWith(
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  TripCard(
                      tripType: 'Plan a trip automatically',
                      tripWriter:
                          'Enter your preferences and let the app plan the trip for you',
                      onTap: () => Get.to(LocationsPage()),
                      img: 'images/1.jpg'),
                  TripCard(
                    tripType: 'Plan a trip yourself',
                    tripWriter:
                        'Find the places you want to visit and let us organize the trip accordingly',
                    onTap: () => Get.to(SavedPlaces()),
                    img: 'images/2.jpg',
                  ),
                  TripCard(
                    tripType: 'Trips planned by users',
                    tripWriter:
                        'Check and search among the trips other users have built for their travels',
                    onTap: () => Get.to(UsersTripsScreen()),
                    img: 'images/3.jpg',
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
