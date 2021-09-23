import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:trip_pal_null_safe/controllers/trips_controller.dart';
import 'package:trip_pal_null_safe/screens/filtering/filters_header.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';
import 'package:trip_pal_null_safe/widgets/simple/rounded_button.dart';
import 'package:trip_pal_null_safe/widgets/simple/rounded_slider.dart';

class AdvancedFiltersPage extends GetView<TripsController> {
  AdvancedFiltersPage({Key? key}) : super(key: key);

  List<Widget> buildSliders() {
    print(controller.selectedTypes);
    List<Widget> result = List<Widget>.empty(growable: true);
    controller.selectedTypes.forEach((type) {
      result.add(FilterSubTitle(
          filterName: 'How interested are you in ' + type + ' places?'));
      result.add(Obx(() => FiltersSlider(
            count: controller.contentValues[type]!.value,
            onChanged: (newValue) =>
                controller.contentValues[type]!.value = newValue,
            divisions: 9,
            maxLabel: '10',
            minLabel: '1',
            maxRange: 10,
            label: '',
          )));
    });
    if (controller.foodsChecked.value) {
      result.add(FilterSubTitle(
          filterName: 'How interested are you in Foods & Drinks?'));
      result.add(Obx(() => FiltersSlider(
            count: controller.foods.value,
            onChanged: (newValue) => controller.foods.value = newValue,
            divisions: 2,
            maxLabel: '3',
            minLabel: '1',
            maxRange: 3,
            label: '',
          )));
    }
    if (controller.shopsChecked.value) {
      result.add(
          FilterSubTitle(filterName: 'How interested are you in Shopping?'));
      result.add(Obx(() => FiltersSlider(
            count: controller.shops.value,
            onChanged: (newValue) => controller.shops.value = newValue,
            divisions: 2,
            maxLabel: '3',
            minLabel: '1',
            maxRange: 3,
            label: '',
          )));
    }

    // result.add(FilterSubTitle(
    //     filterName: 'How many places would you visit in a single day?'));

    // result.add(Obx(() => FiltersSlider(
    //       count: controller.placesPerDay.value,
    //       onChanged: (newValue) => controller.placesPerDay.value = newValue,
    //       divisions: 9,
    //       maxLabel: '10',
    //       minLabel: '1',
    //       maxRange: 10,
    //       label: '',
    //     )));
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MySize.screenWidth,
          height: MySize.screenHeight,
          child: Column(children: <Widget>[
            FiltersHeader(
              backButton: true,
              title: 'Preferences Control',
              subTitle:
                  'Tell us more about your preferences, and we\'ll build a trip specialized for you',
            ),
            Expanded(
                child: ListView(
              physics: BouncingScrollPhysics(),
              children: buildSliders(),
            )),
            RoundedButton(
                title: 'Save Controls',
                onPressed: () => Get.back(),
                icon: Icon(
                  FontAwesomeIcons.save,
                  color: Colors.white,
                  size: 18.0,
                ))
          ]),
        ),
      ),
    );
  }
}
