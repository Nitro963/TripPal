import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:trip_pal_null_safe/controllers/trips_controller.dart';
import 'package:trip_pal_null_safe/dialogs/availablity_dialog.dart';
import 'package:trip_pal_null_safe/screens/filtering/filters_header.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';
import 'package:trip_pal_null_safe/widgets/simple/rounded_add_button.dart';
import 'package:trip_pal_null_safe/widgets/simple/rounded_button.dart';
import 'package:trip_pal_null_safe/widgets/simple/rounded_gesture_widget.dart';

import 'basic_filters_page.dart';

class LocationsPage extends GetView<TripsController> {
  LocationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            FiltersHeader(
                backButton: true,
                title: 'Choose preferred cities',
                subTitle:
                    'We\'ll use these cities as base for searching places for you'),
            Space.height(6),
            FilterSubTitle(filterName: 'Most visited cities this year'),
            Padding(
              padding: Spacing.only(),
              child: Wrap(
                  spacing: 10.0,
                  alignment: WrapAlignment.center,
                  runSpacing: 20.0,
                  children: [
                    for (String city in controller.cities.take(12))
                      new Obx(() => RoundedGestWidget(
                            title: city,
                            selected: controller.locsContentCheck[city]!.value,
                            onTap: () {
                              controller.locsContentCheck[city]!.toggle();
                            },
                          )),
                  ]),
            ),
            FilterSubTitle(filterName: 'Selected Cities'),
            Padding(
              padding: Spacing.only(),
              child: Obx(() => Wrap(
                      spacing: 10.0,
                      alignment: WrapAlignment.center,
                      runSpacing: 20.0,
                      children: [
                        for (String city in controller.getSelectedCities())
                          RoundedGestWidget(
                            title: city,
                            selected: false,
                            onTap: null,
                          ),
                        RoundedAddButton(
                          title: 'Add City',
                          onTap: () => Get.dialog(NotAvailableDialog()),
                        )
                      ])),
            ),
            RoundedButton(
                title: 'Add Places',
                icon: Icon(FontAwesomeIcons.plus,
                    color: Colors.white, size: 14.0),
                onPressed: () {
                  controller.selectLocs();
                  if (controller.selectedCities.length > 0)
                    Get.to(() => FiltersPage());
                }),
            Space.height(40),
          ],
        ),
      ),
    );
  }
}
