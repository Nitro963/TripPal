import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

// import 'package:travel_app/scr/screens/trip/trip_result_screen.dart';
import 'package:trip_pal_null_safe/controllers/filters_controller.dart';
import 'package:trip_pal_null_safe/screens/filtering/advanced_filters_page.dart';
import 'package:trip_pal_null_safe/screens/filtering/filters_header.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';
import 'package:trip_pal_null_safe/widgets/simple/rounded_button.dart';
import 'package:trip_pal_null_safe/widgets/simple/rounded_slider.dart';
import 'package:trip_pal_null_safe/widgets/simple/rounded_check_box.dart';
import 'package:trip_pal_null_safe/widgets/simple/rounded_gesture_widget.dart';
import 'package:trip_pal_null_safe/widgets/simple/rounded_radio_button.dart';
import 'package:trip_pal_null_safe/screens/planing/trip/trip.dart';

// TODO use dynamic padding
// TODO convert types to model
// TODO use meaningful names for filters (What can I understand from Basic Filters Screen!)
class FiltersPage extends GetView<FilterController> {
  FiltersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        titleSpacing: 0,
        elevation: 0,
        title: Stack(
          children: <Widget>[
            FiltersHeader(
                title: 'Tell us your preferences',
                subTitle:
                    'And we will help to build best trips special for you'),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                        icon: Icon(
                          FontAwesomeIcons.slidersH,
                          size: 18.0,
                        ),
                        onPressed: () => Get.to(AdvancedFiltersPage()))))
          ],
        ),
      ),
      body: Center(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
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
                      return Obx(() => RoundedGestWidget(
                          title: type,
                          selected: controller.placesContentCheck[type]!.value,
                          onTap: () =>
                              controller.placesContentCheck[type]!.toggle()));
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
            Obx(() => RoundedRadioButton(
                groupValue: controller.tripMode.value,
                value: controller.tripModes[0].value,
                onChanged: (value) => controller.onClickRadioButton(value))),
            Obx(() => RoundedRadioButton(
                groupValue: controller.tripMode.value,
                value: controller.tripModes[1].value,
                onChanged: (value) => controller.onClickRadioButton(value))),
            FilterSubTitle(filterName: 'Trip Duration'),
            Obx(() => FiltersSlider(
                count: controller.daysCount.value,
                label: ' days',
                divisions: 13,
                maxLabel: '2 weeks',
                minLabel: '3 days',
                maxRange: 14,
                onChanged: (newValue) =>
                    controller.daysCount.value = newValue)),
            RoundedButton(
              title: 'Save Preferences',
              icon: Icon(FontAwesomeIcons.solidSave,
                  color: Colors.white, size: 18.0),
              onPressed: () {
                // TODO use named routes
                // also never do it like this if it is a must
                // rather do it like () => TripPage
                Get.to(TripPlan());
              },
            ),
          ],
        ),
      ),
    );
  }
}
