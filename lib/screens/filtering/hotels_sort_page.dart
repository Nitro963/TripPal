
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:trip_pal_null_safe/controllers/filters_controller.dart';
import 'package:trip_pal_null_safe/screens/filtering/filters_header.dart';
import 'package:trip_pal_null_safe/widgets/simple/rounded_button.dart';
import 'package:trip_pal_null_safe/widgets/simple/rounded_radio_button.dart';

class HotelSortWidget extends GetView<FilterController> {
  const HotelSortWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Get.theme.backgroundColor,
      child: ListView(
        children: [
          FiltersHeader(
            backButton: false,
              title: 'Sorting Available Hotels',
              subTitle:
                  'Let us help you find the perfect hotel that you want'),
          FilterSubTitle(filterName: 'Sorting Type'),
          ...controller.hotelSortTypes.map(
            (e) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Obx(()=>RoundedRadioButton(
                  groupValue: controller.hotelsSortType.value,
                  value: e.value,
                  onChanged: (value) =>
                      controller.changeHotelsSortType(value)),
            )),
          ),
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
