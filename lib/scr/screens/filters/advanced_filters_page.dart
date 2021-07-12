import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:travel_app/scr/controllers/filters_controller.dart';
import 'package:travel_app/scr/shared/constants.dart';

import 'components/filters_header.dart';
import 'components/rounded_button.dart';
import 'components/rounded_slider.dart';

class AdvancedFiltersPage extends StatelessWidget {
  AdvancedFiltersPage({Key key}) : super(key: key);
  final controller = Get.find<FilterController>();

  @override
  Widget build(BuildContext context) {
    List<Widget> builsSliders() {
      List<Widget> result = List<Widget>.empty(growable: true);
      for (String type in controller.selectedTypes) {
        result.add(FilterSubTitle(
            filterName: 'How interested are you in ' + type + ' places?'));
        result.add(FiltersSlider(
          count: controller.contentValues[type],
          onChanged: (newValue) =>
              controller.contentValues[type].value = newValue,
          divisions: 9,
          maxLabel: '10',
          minLabele: '1',
          maxrange: 10,
          label: '',
        ));
      }
      if (controller.foodsChecked.value) {
        result.add(FilterSubTitle(
            filterName: 'How interested are you in Foods & Drinks?'));
        result.add(FiltersSlider(
          count: controller.foods,
          onChanged: (newValue) => controller.foods.value = newValue,
          divisions: 9,
          maxLabel: '10',
          minLabele: '1',
          maxrange: 10,
          label: '',
        ));
      }
      if (controller.shopsChecked.value) {
        result.add(
            FilterSubTitle(filterName: 'How interested are you in Shopping?'));
        result.add(FiltersSlider(
          count: controller.shops,
          onChanged: (newValue) => controller.shops.value = newValue,
          divisions: 9,
          maxLabel: '10',
          minLabele: '1',
          maxrange: 10,
          label: '',
        ));
      }
      result.add(FilterSubTitle(
          filterName: 'How many places would you visit in a single day?'));
      result.add(FiltersSlider(
        count: controller.placesPerDay,
        onChanged: (newValue) => controller.placesPerDay.value = newValue,
        divisions: 9,
        maxLabel: '10',
        minLabele: '1',
        maxrange: 10,
        label: '',
      ));
      return result;
    }

    return Scaffold(
      body: SafeArea(
          child: Container(
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight,
        child: Column(children: <Widget>[
          FiltersHeader(
            title: 'Preferences Control',
            subTitle:
                'Tell us more about your preferences, and we\'ll build a trip specialized for you',
          ),
          Expanded(
              child: ListView(
            physics: BouncingScrollPhysics(),
            children: builsSliders(),
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
      )),
    );
  }
}
