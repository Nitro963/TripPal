import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';
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
                image: AssetImage(
                    'assets/images/Small Widget Images/trips_bg.jpg'),
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
                          .copyWith(color: Colors.white, fontSize: 17),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  TripTypeCard(
                      tripType: 'Plan a trip automatically',
                      tripWriter:
                          'Enter your preferences and let us customize a trip plan for you.',
                      // onTap: !Get.find<AuthControl>().isGuest
                      //     ? () => Get.toNamed('/home/trips/auto')
                      //     : null,
                      onTap: () => Get.toNamed('/home/trips/auto'),
                      img: 'assets/images/Small Widget Images/trip_3.png'),
                  TripTypeCard(
                      tripType: 'Explore new places',
                      tripWriter:
                          'Search and find the best places to visit wherever you want.',
                      onTap: () => Get.toNamed('/home/trips/search'),
                      img: 'assets/images/Small Widget Images/trip_1.png'),
                  TripTypeCard(
                    tripType: 'Plan a trip yourself',
                    tripWriter:
                        'Use all the places you want to visit to organize a trip accordingly.',
                    // onTap: !Get.find<AuthControl>().isGuest
                    //     ? () {
                    //         Get.put(SearchBarController());
                    //         Get.to(() => PlacesSearchPage());
                    //       }
                    //     : null,
                    onTap: () => Get.toNamed('/home/trips/manual'),

                    img: 'assets/images/Small Widget Images/trip_4.png',
                  ),
                  TripTypeCard(
                    tripType: 'Trips planned by users',
                    tripWriter:
                        'Check and search among the trips other users have built for their travels',
                    onTap: () {
                      Get.toNamed('/home/trips/list');
                    },
                    img: 'assets/images/Small Widget Images/trip_2.png',
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
