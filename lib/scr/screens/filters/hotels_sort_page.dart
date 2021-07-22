import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:travel_app/scr/controllers/filters_controller.dart';
import 'package:travel_app/scr/shared/constants.dart';

import 'components/filters_header.dart';
import 'components/rounded_button.dart';
import 'components/rounded_radio_button.dart';

class HotelSortPage extends GetView<FilterController> {
  HotelSortPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MySize.screenHeight,
        width: MySize.screenWidth,
        child: ListView(
          children: [
            FiltersHeader(
                title: 'Sorting Available Hotels',
                subTitle:
                    'Let us help you find the perfect hotel that you want'),
            FilterSubTitle(filterName: 'Sorting Type'),
            for (int i = 0; i < controller.hotelSortTypes.length; i++)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: RoundedRadioButton(
                    groupValue: controller.hotelsSortType,
                    value: controller.hotelSortTypes[i],
                    onChanged: (value) =>
                        controller.changeHotelsSortType(value)),
              ),
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
