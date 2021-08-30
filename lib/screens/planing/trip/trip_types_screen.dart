import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip_pal_null_safe/controllers/search_bar_controller.dart';
import 'package:trip_pal_null_safe/screens/filtering/locations_page.dart';
import 'package:trip_pal_null_safe/screens/home/home_drawer.dart';
import 'package:trip_pal_null_safe/screens/planing/trip/shared_trips_page.dart';
import 'package:trip_pal_null_safe/services/auth_service.dart';
import 'package:trip_pal_null_safe/utilities/constants.dart';
import 'package:trip_pal_null_safe/screens/details/user_saved_places.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';

import '../places_search_page.dart';
import 'trip_type_card.dart';

class TripsPage extends StatelessWidget {
  const TripsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Get.theme;
    return SizedBox.expand(
      child: Stack(
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
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: Spacing.only(right: 10),
                    child: Row(
                      children: [
                        IconButton(
                            icon: Icon(Icons.menu,
                                size: MySize.size24, color: Colors.white),
                            onPressed: () {
                              Scaffold.of(context).openDrawer();
                            }),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: Spacing.only(right: MySize.size24),
                                child: Text(
                                  'Pick Up Your Type',
                                  style: themeData.textTheme.headline6!
                                      .copyWith(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: Spacing.only(left: 36, right: 16),
                    child: Text(
                      'We\'ll use this type as base for building a great plan for you',
                      style: themeData.textTheme.headline5!
                          .copyWith(color: Colors.white, fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  // TODO use named routes
                  TripTypeCard(
                      tripType: 'Plan a trip automatically',
                      tripWriter:
                          'Enter your preferences and let the app plan the trip for you',
                      onTap: !Get.find<AuthControl>().isGuest
                          ? () => Get.toNamed('/home/trips/auto')
                          : null,
                      img: 'assets/images/1.jpg'),
                  TripTypeCard(
                    tripType: 'Plan a trip yourself',
                    tripWriter:
                        'Find the places you want to visit and let us organize the trip accordingly',
                    onTap: !Get.find<AuthControl>().isGuest
                        ? () {
                            Get.put(SearchBarController());
                            Get.to(() => PlacesSearchPage());
                          }
                        : null,
                    img: 'assets/images/Small Widget Images/self_planning.png',
                  ),
                  TripTypeCard(
                    tripType: 'Trips planned by users',
                    tripWriter:
                        'Check and search among the trips other users have built for their travels',
                    onTap: () {
                      Get.toNamed('/home/trips/list');
                    },
                    img: 'assets/images/3.jpg',
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
