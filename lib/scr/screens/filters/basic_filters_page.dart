import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:travel_app/scr/controllers/filters_controller.dart';
import 'package:travel_app/scr/screens/trip/trip_result_screen.dart';
import 'components/custom_icon_button.dart';
import 'components/filters_header.dart';
import 'components/rounded_button.dart';
import 'components/rounded_check_box.dart';
import 'components/rounded_gesture_widget.dart';
import 'components/rounded_radio_button.dart';
import 'components/rounded_slider.dart';
import 'components/rounded_widget.dart';

class FiltersPage extends StatelessWidget {
  FiltersPage({Key key}) : super(key: key);
  
  final controller = Get.find<FilterController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
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
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.placeType.length,
                    itemBuilder: (ctx, i) {
                      var type = controller.placeType[i];
                      return RoundedGestWidget(
                          title: type,
                          selected: controller.placesContentCheck[type],
                          onTap: () =>
                              controller.placesContentCheck[type].toggle());
                    })),
            FilterSubTitle(filterName: 'Tourist Facilities'),
            FilterCheckBox(
                title: 'Foods Inculded',
                icon: Icon(Icons.check, color: Colors.white, size: 18.0),
                onTap: (selected) =>
                    controller.foodsChecked = !controller.foodsChecked),
            FilterCheckBox(
                title: 'Shops Inculded',
                icon: Icon(Icons.check, color: Colors.white, size: 18.0),
                onTap: (selected) =>
                    controller.shopsChecked = !controller.shopsChecked),
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
                sliderType: 'Days',
                onChanged: (newValue) => controller.daysCount.value = newValue),
            RoundedButton(
                title: 'Save Preferences',
                icon: Icon(FontAwesomeIcons.solidSave,
                    color: Colors.white, size: 18.0),
                onPressed: () {
                  Get.to(TripPage());
                },),
          ],
        ),
      ),
    );
  }
}
