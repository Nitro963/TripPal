import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:trip_pal_null_safe/controllers/filters_controller.dart';
import 'package:trip_pal_null_safe/screens/filtering/filters_header.dart';
import 'package:trip_pal_null_safe/widgets/simple/rounded_button.dart';
import 'package:trip_pal_null_safe/widgets/simple/rounded_radio_button.dart';

class SortTripsWidget extends GetView<FilterController> {
  const SortTripsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Get.theme.backgroundColor,
      child: ListView(
          children: [
            FiltersHeader(
              backButton: true,
                title: 'Sorting User Trip Plans',
                subTitle: 'Let us help you find the trip plans that you want'),
            FilterSubTitle(filterName: 'Sorting Type'),
            ...controller.tripsSortType.map((e) => Obx(()=>RoundedRadioButton(
                groupValue: controller.sortType.value,
                value: e.value,
                onChanged: (value) => controller.changeTripsSortType(value)))),
            FilterSubTitle(filterName: 'Sorting By'),
            ...controller.tripsSortOrder.map((e) => Obx(()=>RoundedRadioButton(
                groupValue: controller.sortOrder.value,
                value: e.value,
                onChanged: (value) => controller.changeTripsSortOrder(value)))),
            RoundedButton(
                title: 'Save Preferences',
                icon: Icon(FontAwesomeIcons.solidSave,
                    color: Colors.white, size: 18.0),
                onPressed: () => Get.back()),
          ],
        ),
    );
  }
}
