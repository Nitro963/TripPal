import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

// import 'package:travel_app/scr/screens/trip/trip_result_screen.dart';
import 'package:trip_pal_null_safe/controllers/filters_controller.dart';
import 'package:trip_pal_null_safe/screens/filtering/filters_header.dart';
import 'package:trip_pal_null_safe/widgets/simple/rounded_button.dart';
import 'package:trip_pal_null_safe/widgets/simple/rounded_slider.dart';
import 'package:trip_pal_null_safe/widgets/simple/custom_icon_button.dart';
import 'package:trip_pal_null_safe/widgets/simple/rounded_check_box.dart';
import 'package:trip_pal_null_safe/widgets/simple/rounded_gesture_widget.dart';
import 'package:trip_pal_null_safe/widgets/simple/rounded_radio_button.dart';
import 'package:trip_pal_null_safe/widgets/simple/rounded_widget.dart';

class FiltersPage extends GetView<FilterController> {
  FiltersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            Stack(
              children: <Widget>[
                FiltersHeader(
                    title: 'Tell us your preferences',
                    subTitle:
                        'And we will help to build best trips special for you'),
                CustomIconButton(controller: controller)
              ],
            ),
            FilterSubTitle(filterName: 'Selected Countries'),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 2.0),
              height: 50.0,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: controller.selectedCities.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return RoundedWidget(title: controller.selectedCities[index]);
                },
              ),
            ),
            FilterSubTitle(filterName: 'Place Types'),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 2.0),
                height: 50.0,
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.placeType.length,
                    itemBuilder: (ctx, i) {
                      var type = controller.placeType[i];
                      return RoundedGestWidget(
                          title: type,
                          selected: controller.placesContentCheck[type]!,
                          onTap: () =>
                              controller.placesContentCheck[type]!.toggle());
                    })),
            FilterSubTitle(filterName: 'Tourist Facilities'),
            FilterCheckBox(
                title: 'Foods Included',
                icon: Icon(Icons.check, color: Colors.white, size: 18.0),
                isChecked: controller.foodsChecked.value,
                onTap: (selected) => controller.foodsChecked.toggle()),
            FilterCheckBox(
                title: 'Shops Included',
                icon: Icon(Icons.check, color: Colors.white, size: 18.0),
                isChecked: controller.shopsChecked.value,
                onTap: (selected) => controller.shopsChecked.toggle()),
            FilterSubTitle(filterName: 'Trip Mode'),
            RoundedRadioButton(
                groupValue: controller.tripMode,
                value: controller.tripModes[0],
                onChanged: (value) => controller.onClickRadioButton(value)),
            RoundedRadioButton(
                groupValue: controller.tripMode,
                value: controller.tripModes[1],
                onChanged: (value) => controller.onClickRadioButton(value)),
            FilterSubTitle(filterName: 'Trip Duration'),
            FiltersSlider(
                count: controller.daysCount,
                label: ' days',
                divisions: 13,
                maxLabel: '2 weeks',
                minLabel: '3 days',
                maxRange: 14,
                onChanged: (newValue) => controller.daysCount.value = newValue),
            RoundedButton(
              title: 'Save Preferences',
              icon: Icon(FontAwesomeIcons.solidSave,
                  color: Colors.white, size: 18.0),
              onPressed: () {
                // TODO use named routes
                // Get.to(TripPage());
              },
            ),
          ],
        ),
      ),
    );
  }
}
