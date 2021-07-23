import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:trip_pal_null_safe/controllers/filters_controller.dart';
import 'package:trip_pal_null_safe/screens/filtering/filters_header.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';
import 'package:trip_pal_null_safe/widgets/simple/rounded_button.dart';
import 'package:trip_pal_null_safe/widgets/simple/rounded_gesture_widget.dart';

import 'basic_filters_page.dart';

class LocationsPage extends GetView<FilterController> {
  LocationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> content = List<Widget>.empty(growable: true).obs;
    // never make a observable list of widget. Make a model and read from it dynamically.
    // TODO use onInit and polymorphism never ever do this (i.e extends filter controller for each screen and override the property)
    // TODO use binding to ensure the controller is initialized and in memory.
    for (String city in controller.cities) {
      controller.locsContentCheck[city] = false.obs;
      content.add(new RoundedGestWidget(
        title: city,
        selected: controller.locsContentCheck[city]!,
        onTap: () {
          controller.locsContentCheck[city]!.toggle();
        },
      ));
    }
    // TODO apply themes
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            FiltersHeader(
                title: 'Choose preferred countries',
                subTitle:
                    'We\'ll use these countries as base for searching places for you'),
            Space.height(10),
            // TODO convert to dynamic wrap (i.e read from observable list in a GetxController)
            // search for places using a floating search bar and photon api
            // expandable body is a simple implicitly animated list
            // user can add, disable and delete location
            // delete with long press
            // disable with tap
            // add using floating search bar
            Padding(
              padding: Spacing.all(30.0),
              child: Wrap(
                  spacing: 10.0,
                  alignment: WrapAlignment.center,
                  runSpacing: 20.0,
                  children: content),
            ),
            RoundedButton(
                title: 'Add Places',
                icon: Icon(FontAwesomeIcons.plus,
                    color: Colors.white, size: 14.0),
                onPressed: () {
                  controller.selectLocs();
                  // TODO use named routes
                  if (controller.selectedCities.length > 0)
                    Get.to(FiltersPage());
                }),
            Space.height(40),
          ],
        ),
      ),
    );
  }
}
