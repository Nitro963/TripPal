import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart' hide Response;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'package:trip_pal_null_safe/controllers/trips_controller.dart';
import 'package:trip_pal_null_safe/models/trip.dart';
import 'package:trip_pal_null_safe/screens/filtering/advanced_filters_page.dart';
import 'package:trip_pal_null_safe/screens/filtering/filters_header.dart';
import 'package:trip_pal_null_safe/services/auth_service.dart';
import 'package:trip_pal_null_safe/utilities/constants.dart';
import 'package:trip_pal_null_safe/utilities/error_handlers.dart';
import 'package:trip_pal_null_safe/utilities/networking_utils.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';
import 'package:trip_pal_null_safe/widgets/simple/rounded_button.dart';
import 'package:trip_pal_null_safe/widgets/simple/rounded_slider.dart';
import 'package:trip_pal_null_safe/widgets/simple/rounded_check_box.dart';
import 'package:trip_pal_null_safe/widgets/simple/rounded_gesture_widget.dart';
import 'package:trip_pal_null_safe/widgets/simple/rounded_radio_button.dart';

class FiltersPage extends GetView<TripsController> {
  FiltersPage({Key? key}) : super(key: key) {
    // client.requestModifiers.add((request) {
    //   print(request.data);
    //   return request;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => ModalProgressHUD(
          inAsyncCall: controller.inAsyncCall,
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              toolbarHeight: 80,
              titleSpacing: 0,
              elevation: 0,
              title: Stack(
                children: <Widget>[
                  FiltersHeader(
                      backButton: true,
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
                              onPressed: () {
                                controller.selectPlaces();
                                Get.to(() => AdvancedFiltersPage());
                              })))
                ],
              ),
            ),
            body: Center(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: <Widget>[
                  FilterSubTitle(filterName: 'Place Types'),
                  Container(
                      height: 50.0,
                      child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.placeType.length,
                          itemBuilder: (ctx, i) {
                            var type = controller.placeType[i];
                            return Obx(() => Padding(
                                  padding: i == 0
                                      ? Spacing.left(20)
                                      : EdgeInsets.zero,
                                  child: RoundedGestWidget(
                                      title: type,
                                      selected: controller
                                          .placesContentCheck[type]!.value,
                                      onTap: () => controller
                                          .placesContentCheck[type]!
                                          .toggle()),
                                ));
                          })),
                  FilterSubTitle(filterName: 'Tourist Facilities'),
                  FilterCheckBox(
                      title: 'Foods & Drinks Included',
                      icon: Icon(Icons.check, color: Colors.white, size: 18.0),
                      isChecked: controller.foodsChecked.value,
                      onTap: (selected) => controller.foodsChecked.toggle()),
                  FilterCheckBox(
                      title: 'Shopping Included',
                      icon: Icon(Icons.check, color: Colors.white, size: 18.0),
                      isChecked: controller.shopsChecked.value,
                      onTap: (selected) => controller.shopsChecked.toggle()),
                  FilterSubTitle(filterName: 'Trip Mode'),
                  Obx(() => RoundedRadioButton(
                      description: 'Visit as much as possible places',
                      groupValue: controller.tripMode.value,
                      value: controller.tripModes[0].value,
                      onChanged: (value) =>
                          controller.onClickRadioButton(value))),
                  Obx(() => RoundedRadioButton(
                      description:
                          'Visit couple places and really get to explore them',
                      groupValue: controller.tripMode.value,
                      value: controller.tripModes[1].value,
                      onChanged: (value) =>
                          controller.onClickRadioButton(value))),
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
                      title: 'MAKE TRIP',
                      icon: Icon(FontAwesomeIcons.solidSave,
                          color: Colors.white, size: 18.0),
                      onPressed: makeTrip),
                ],
              ),
            ),
          ),
        ));
  }

  final client = DioConnect(
      baseUrl: LOCAL_SERVER_END_POINT,
      httpScheme: DEFAULT_CONNECTION_PROTOCOL,
      connectTimeout: 1000 * 120 * 2);

  void makeTrip() {
    controller.inAsyncCall = true;
    client
        .post<List<Trip>>('/api/trips/auto/', controller.serializePreferences(),
            headers: {
              'Authorization': 'Token ${Get.find<AuthControl>().token}'
            },
            decoder: (data) =>
                data['trips'].map<Trip>((json) => Trip.fromJson(json)).toList())
        .then((response) {
      controller.inAsyncCall = false;
      Get.toNamed('/home/trips/auto/details', arguments: response.decodedBody);
    }).onError((error, stackTrace) {
      controller.inAsyncCall = false;
      handelError(error, makeTrip);
    });
  }
}
