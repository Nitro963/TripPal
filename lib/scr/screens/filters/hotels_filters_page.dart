import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/scr/controllers/filters_controller.dart';
import 'package:travel_app/scr/screens/filters/components/rounded_button.dart';
import 'package:travel_app/scr/shared/constants.dart';

import 'components/filters_header.dart';
import 'components/rounded_slider.dart';

class HotelFiltersPage extends StatelessWidget {
  final FilterController controller = Get.find<FilterController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          child: Column(
            children: [
              FiltersHeader(
                  title: 'Filtering Available Hotels',
                  subTitle:
                      'Let us help you find the perfect hotel that you want'),
              Expanded(
                  child: ListView(children: <Widget>[
                FilterSubTitle(filterName: 'Star Rating'),
                FiltersSlider(
                    count: controller.selectedStarRating,
                    label: ' Stars',
                    divisions: 4,
                    maxLabel: '5 Stars',
                    minLabele: '1 star',
                    maxrange: 5,
                    onChanged: (newValue) =>
                        controller.selectedStarRating.value = newValue),
                FilterSubTitle(filterName: 'Guests Rating'),
                FiltersSlider(
                    count: controller.selectedGuestRating,
                    label: '',
                    divisions: 9,
                    maxLabel: 'Excelente',
                    minLabele: 'Bad',
                    maxrange: 10,
                    onChanged: (newValue) =>
                        controller.selectedGuestRating.value = newValue),
                FilterSubTitle(filterName: 'Price per Night'),
                FiltersSlider(
                    count: controller.selectedPrice,
                    label: '\$',
                    divisions: 100,
                    maxLabel: '500\$',
                    minLabele: '0\$',
                    maxrange: 500,
                    onChanged: (newValue) =>
                        controller.selectedPrice.value = newValue),
              ])),
              RoundedButton(
                  title: 'Apply Filters',
                  onPressed: () => Get.back(),
                  icon: Icon(
                    Icons.filter_list,
                    color: Colors.white,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
