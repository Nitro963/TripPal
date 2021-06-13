import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:travel_app/scr/controllers/filters_controller.dart';

import 'components/filters_header.dart';
import 'components/rounded_button.dart';
import 'components/rounded_radio_button.dart';

class TripFiltersPage extends StatelessWidget {
  TripFiltersPage({Key key}) : super(key: key);
  // final controller = Get.find<FilterController>();
  final controller = Get.put(FilterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            FiltersHeader(
                title: 'Sorting User Trip Plans',
                subTitle: 'Let us help you find the trip plans that you want'),
            FilterSubTitle(filterName: 'Sorting Type'),
            for (int i = 0; i < controller.tripsSortType.length;i++)
              RoundedRadioButton(
                groupValue: controller.sortType,
                value: controller.tripsSortType[i],
                onChanged: (value) => controller.changeTripsSorttype(value)),
            FilterSubTitle(filterName: 'Sorting By'),
            for (int i = 0; i < controller.tripsSortOrder.length;i++)
              RoundedRadioButton(
                groupValue: controller.sortOrder,
                value: controller.tripsSortOrder[i],
                onChanged: (value) => controller.changeTripsSortOrder(value)),
            RoundedButton(
                title: 'Save Preferences',
                icon: Icon(FontAwesomeIcons.solidSave,
                    color: Colors.white, size: 18.0),
                onPressed: () => Get.back()),
          ],
        ),
      ),
    );
  }
}
