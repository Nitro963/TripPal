import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart' hide Response;
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

class ManualFilterPage extends GetView<TripsController> {
  ManualFilterPage({Key? key}) : super(key: key) {
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
                      title: 'Give us your favorite places',
                      subTitle:
                          'And we\'ll customize a trip plan especially for you.'),
                ],
              ),
            ),
            body: Center(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: <Widget>[
                  
                  // FilterSubTitle(filterName: 'Trip Mode (Number of places per day)'),
                  // Container(
                  //   height: MySize.getScaledSizeHeight(68),
                  //   child: ListView(
                  //     scrollDirection: Axis.horizontal,
                  //     children: <Widget>[
                  //       Padding(
                  //         padding: const EdgeInsets.symmetric(horizontal: 8),
                  //         child: TripModeCard(
                  //           title: 'Extended Trip',
                  //           subTitle: '7 Places',
                  //         ),
                  //       ),
                  //       Padding(
                  //         padding: const EdgeInsets.symmetric(horizontal: 8),
                  //         child: TripModeCard(
                  //           title: 'Focused Trip',
                  //           subTitle: '3 Places',
                  //         ),
                  //       ),
                  //       Padding(
                  //         padding: const EdgeInsets.symmetric(horizontal: 8),
                  //         child: TripModeCard(
                  //           title: 'Standard Trip',
                  //           subTitle: '5 Places',
                  //         ),
                  //       ),
                  //       Padding(
                  //         padding: const EdgeInsets.symmetric(horizontal: 8),
                  //         child: TripModeCard(
                  //           title: 'Working Trip',
                  //           subTitle: '1 Place',
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),

                  // FilterSubTitle(filterName: 'Tourist Facilities'),
                  // Container(
                  //   height: MySize.getScaledSizeHeight(84),
                  //   child: ListView(
                  //     scrollDirection: Axis.horizontal,
                  //     children: <Widget>[
                  //       Padding(
                  //           padding: const EdgeInsets.symmetric(horizontal: 8),
                  //           child: IntCard(desc: 'Shopping & Dining', title: 'Malls', label: 'Indoors', icon: Icon(MdiIcons.pizza),)),
                  //           Padding(
                  //           padding: const EdgeInsets.symmetric(horizontal: 8),
                  //           child: IntCard(desc: 'Drining', title: 'Cafes', label: 'Outdoors', icon: Icon(MdiIcons.coffee),)),
                  //           Padding(
                  //           padding: const EdgeInsets.symmetric(horizontal: 8),
                  //           child: IntCard(desc: 'Dining & Drinking', title: 'Restaurants', label: 'Outdoors', icon: Icon(MdiIcons.food),)),
                  //           Padding(
                  //           padding: const EdgeInsets.symmetric(horizontal: 8),
                  //           child: IntCard(desc: 'Shopping', title: 'Shops', label: 'Outdoors', icon: Icon(MdiIcons.shopping),)),
                  //           Padding(
                  //           padding: const EdgeInsets.symmetric(horizontal: 8),
                  //           child: IntCard(desc: 'Playing', title: 'Amusements', label: 'Intertenment', icon: Icon(Icons.attractions),)),
                  //           Padding(
                  //           padding: const EdgeInsets.symmetric(horizontal: 8),
                  //           child: IntCard(desc: 'Break', title: 'Parks', label: 'Outdoors/Indoors', icon: Icon(Icons.park),)),
                  //     ],
                  //   ),
                  // ),
                  
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
                  FilterSubTitle(filterName: 'Your Saved Trip Destinations'),
                   Padding(
              padding: Spacing.only(left: 12, right: 12,bottom: 10),
              child: Wrap(
                  spacing: 10.0,
                  alignment: WrapAlignment.center,
                  runSpacing: 20.0,
                  children: [
                    for (String city in controller.cities.reversed.take(5))
                      new Obx(() => RoundedGestWidget(
                            title: city,
                            selected: controller.locsContentCheck[city]!.value,
                            onTap: () {
                              controller.locsContentCheck[city]!.toggle();
                            },
                          ))
                  ]),
            ),
                  RoundedButton(
                      title: 'MAKE TRIP',
                      icon: Icon(FontAwesomeIcons.solidSave,
                          color: Colors.white, size: 18.0),
                      onPressed: (){}),
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