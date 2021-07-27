import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip_pal_null_safe/screens/filtering/locations_page.dart';
import 'package:trip_pal_null_safe/utilities/constants.dart';
import 'package:trip_pal_null_safe/screens/details/user_saved_places.dart';

import 'trip_card.dart';
import 'users_trips_screen.dart';

// TODO use named routes
class TripsPage extends StatelessWidget {
  const TripsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/trip_3.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          color: Colors.black38,
        ),
        SafeArea(
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
                    style: kSecondaryFiltersTitleStyle.copyWith(
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                TripCard(
                    tripType: 'Plan a trip automatically',
                    tripWriter:
                        'Enter your preferences and let the app plan the trip for you',
                    onTap: () => Get.to(LocationsPage()),
                    img: 'assets/images/1.jpg'),
                TripCard(
                  tripType: 'Plan a trip yourself',
                  tripWriter:
                      'Find the places you want to visit and let us organize the trip accordingly',
                  onTap: () => Get.to(SavedPlaces()),
                  img: 'assets/images/Small Widget Images/self_planning.png',
                ),
                TripCard(
                  tripType: 'Trips planned by users',
                  tripWriter:
                      'Check and search among the trips other users have built for their travels',
                  onTap: () => Get.to(UsersTripsScreen()),
                  img: 'assets/images/3.jpg',
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
