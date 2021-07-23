import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:trip_pal_null_safe/screens/filtering/trip_filters_page.dart';

class UserTripsAppBar extends StatelessWidget {
  const UserTripsAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
                onPressed: () => Get.back(),
                icon: Icon(
                  FontAwesomeIcons.arrowLeft,
                  color: Colors.black,
                  size: 16,
                )),
            Text(
              'Trips',
              style: TextStyle(color: Colors.black),
            ),
            IconButton(
                onPressed: () => Get.to(TripFiltersPage()),
                icon: Icon(
                  FontAwesomeIcons.slidersH,
                  color: Colors.black,
                  size: 20,
                )),
          ],
        ));
  }
}
