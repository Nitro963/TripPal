import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip_pal_null_safe/controllers/trips_controller.dart';
import 'package:trip_pal_null_safe/screens/filtering/filters_header.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';
import 'package:trip_pal_null_safe/widgets/simple/rounded_button.dart';
import 'package:trip_pal_null_safe/widgets/simple/rounded_slider.dart';

class HotelFiltersPage extends StatelessWidget {
  final TripsController controller = Get.find<TripsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MySize.screenHeight,
          width: MySize.screenWidth,
          child: Column(
            children: [
              FiltersHeader(
                  backButton: true,
                  title: 'Filtering Available Hotels',
                  subTitle:
                      'Let us help you find the perfect hotel that you want'),
              Expanded(
                  child: ListView(children: <Widget>[
                FilterSubTitle(filterName: 'Star Rating'),
                Obx(() => FiltersSlider(
                    count: controller.selectedStarRating.value,
                    label: ' Stars',
                    divisions: 4,
                    maxLabel: '5 Stars',
                    minLabel: '1 star',
                    maxRange: 5,
                    onChanged: (newValue) =>
                        controller.selectedStarRating.value = newValue)),
                FilterSubTitle(filterName: 'Guests Rating'),
                Obx(() => FiltersSlider(
                    count: controller.selectedGuestRating.value,
                    label: '',
                    divisions: 9,
                    maxLabel: 'Excelente',
                    minLabel: 'Bad',
                    maxRange: 10,
                    onChanged: (newValue) =>
                        controller.selectedGuestRating.value = newValue)),
                FilterSubTitle(filterName: 'Price per Night'),
                Obx(() => FiltersSlider(
                    count: controller.selectedPrice.value,
                    label: '\$',
                    divisions: 100,
                    maxLabel: '500\$',
                    minLabel: '0\$',
                    maxRange: 500,
                    onChanged: (newValue) =>
                        controller.selectedPrice.value = newValue)),
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
