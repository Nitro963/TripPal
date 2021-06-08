
import 'package:flutter/material.dart';
import 'package:travel_app/scr/screens/filters/cities_page.dart';
import 'package:travel_app/scr/screens/trip/components/trip_card.dart';
import 'package:travel_app/scr/screens/trip/users_trips_screen.dart';
import 'package:travel_app/scr/shared/constants.dart';

class TripsPage extends StatelessWidget {
  const TripsPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.only(bottom: 72.0),
       decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/trip_3.jpg'),
          fit: BoxFit.cover,
        ),
      ),
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
                      // fontFamily: 'Patrick',
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
                child: Text(
                    'We\'ll use this type as base for building a great plan for you',
                    style: kSeconderyFiltersTitleStyle.copyWith(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
              ),
              TripCard(
                  tripType: 'Plan a trip automatically',
                  tripWriter: 'Enter your preferences and let the app plan the trip for you',
                  tripExp:
                      'wlanation write a simple explanation write a simple explanation',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CitiesPage()),
                    );
                  },
                  img: 'images/1.jpg'),
              TripCard(
                tripType: 'Plan a trip yourself',
                tripWriter: 'Find the places you want to visit and let us organize the trip accordingly',
                tripExp: 'write a simple explanation write a',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CitiesPage()),
                  );
                },
                img: 'images/2.jpg',
              ),
              TripCard(
                tripType: 'Trips planned by users',
                tripWriter: 'Check and search among the trips other users have built for their travels',
                tripExp:
                    'write a simple explanation write a simple explanation write a simple explanation write a simple explanation',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UsersTripsScreen()),
                  );
                },
                img: 'images/3.jpg',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

