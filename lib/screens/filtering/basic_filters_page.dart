import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart' hide Response;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

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
                          'And we\'ll customize a trip plan especially for you.'),
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
                  FilterSubTitle(filterName: 'Attraction Place types'),
                  Container(
                      height: MySize.getScaledSizeHeight(52),
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
                  FilterSubTitle(filterName: 'Places Quality'),
                  Container(
                      height: MySize.getScaledSizeHeight(52),
                      child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.placesQuality.length,
                          itemBuilder: (ctx, i) {
                            var quality = controller.placesQuality[i];
                            return Padding(
                              padding:
                                  i == 0 ? Spacing.left(20) : EdgeInsets.zero,
                              child: Obx(()=>RoundedGestWidget(
                                  title: quality,
                                  selected: controller.qualityContentCheck[quality]!.value,
                                  onTap: () => controller.selectQuality(quality)
                                          ),
                            ));
                          })),
                  FilterSubTitle(filterName: 'Tourist Facilities'),
                  FilterCheckBox(
                      title: 'Dining included.',
                      description: 'From cafes to fine dining and dast foods.',
                      isChecked: controller.foodsChecked.value,
                      onTap: (selected) => controller.foodsChecked.toggle()),
                  FilterCheckBox(
                      title: 'Shopping included',
                      description: 'Malls, outdoors pazars and supermarkets.',
                      isChecked: controller.shopsChecked.value,
                      onTap: (selected) => controller.shopsChecked.toggle()),
                  FilterCheckBox(
                      title: 'Amusements included',
                      description: 'Pools, amusement parks and so on.',
                      isChecked: controller.shopsChecked.value,
                      onTap: (selected) => controller.shopsChecked.toggle()),
                  FilterSubTitle(filterName: 'Trip Mode'),
                  Obx(() => RoundedRadioButton(
                      description: 'Usual Tourism tour, visit about 5 places per day',
                      groupValue: controller.tripMode.value,
                      value: controller.tripModes[0].value,
                      onChanged: (value) =>
                          controller.onClickRadioButton(value))),
                  Obx(() => RoundedRadioButton(
                      description: 'Visit as much as possible places',
                      groupValue: controller.tripMode.value,
                      value: controller.tripModes[1].value,
                      onChanged: (value) =>
                          controller.onClickRadioButton(value))),
                  Obx(() => RoundedRadioButton(
                      description:
                          'Visit couple places and really get to explore them',
                      groupValue: controller.tripMode.value,
                      value: controller.tripModes[2].value,
                      onChanged: (value) =>
                          controller.onClickRadioButton(value))),
                  FilterSubTitle(filterName: 'Wanted Budget'),
                  Obx(() => FiltersSlider(
                      count: controller.budget.value,
                      label: ' stars',
                      divisions: 4,
                      maxLabel: 'Open budget',
                      minLabel: 'As little as possible',
                      maxRange: 5,
                      onChanged: (newValue) =>
                          controller.budget.value = newValue)),
                  FilterSubTitle(filterName: 'Touring duration per day'),
                  Obx(() => FiltersSlider(
                      count: controller.daysCount.value,
                      label: ' hours per day',
                      divisions: 15,
                      maxLabel: '16 hours',
                      minLabel: 'An hours',
                      maxRange: 16,
                      onChanged: (newValue) =>
                          controller.daysCount.value = newValue)),
                  FilterSubTitle(filterName: 'Trip Duration'),
                  Container(
                    margin: Spacing.horizontal(20),
                    decoration: BoxDecoration(
                        color: Get.theme.cardColor,
                        border: Border.all(color: Colors.grey[200]!),
                        borderRadius: BorderRadius.circular(10)),
                    child: SfDateRangePicker(
                      minDate: DateTime.now(),
                      maxDate: DateTime.now().add(const Duration(days: 14)),
                      startRangeSelectionColor: Get.theme.toggleableActiveColor,
                      endRangeSelectionColor: Get.theme.toggleableActiveColor,
                      rangeSelectionColor:
                          Get.theme.toggleableActiveColor.withOpacity(0.3),
                      todayHighlightColor: Get.theme.toggleableActiveColor,
                      selectionColor: Get.theme.toggleableActiveColor,
                      // onSelectionChanged: controller.onSelectionChanged,
                      selectionMode: DateRangePickerSelectionMode.range,
                      initialSelectedRange: PickerDateRange(
                          DateTime.now().add(const Duration(days: 1)),
                          DateTime.now().add(const Duration(days: 8))),
                    ),
                  ),

                  RoundedButton(
                      title: 'MAKE TRIP',
                      icon: Icon(Icons.checklist_outlined,
                          color: Colors.white, size: 25.0),
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
