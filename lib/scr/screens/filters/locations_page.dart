import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:travel_app/scr/controllers/filters_controller.dart';
import 'package:travel_app/scr/screens/filters/basic_filters_page.dart';

import 'components/filters_header.dart';
import 'components/rounded_button.dart';
import 'components/rounded_gesture_widget.dart';

class LocationsPage extends StatelessWidget {
  LocationsPage({Key key}) : super(key: key);

  final FilterController controller = Get.put(FilterController());
  @override
  Widget build(BuildContext context) {
    List<Widget> content = List<Widget>.empty(growable: true).obs;

    for (String city in controller.cities) {
      controller.locsContentCheck[city] = false.obs;
      content.add(new RoundedGestWidget(
        title: city,
        selected: controller.locsContentCheck[city],
        onTap: () {
          controller.locsContentCheck[city] =
              controller.locsContentCheck[city].toggle();
        },
      ));
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: ListView(
        children: <Widget>[
          FiltersHeader(
              title: 'Choose prefered countries',
              subTitle:
                  'We\'ll use these countries as base for seaching places for you'),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Wrap(
                spacing: 10.0,
                alignment: WrapAlignment.center,
                runSpacing: 20.0,
                children: content),
          ),
          RoundedButton(
              title: 'Add Countries',
              icon:
                  Icon(FontAwesomeIcons.plus, color: Colors.white, size: 14.0),
              onPressed: () {
                controller.selectLocs();
                if (controller.selectedCities.length > 0) 
                  Get.to(FiltersPage());
              },
              color: Colors.blue[800],
              textColor: Colors.white),
          SizedBox(height: 40.0)
        ],
      )),
    );
  }
}
