import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/scr/models/DemoData.dart';
import 'package:travel_app/scr/screens/Hotels/HotelResults.dart';
import 'package:travel_app/scr/screens/filters/components/rounded_button.dart';
import 'package:travel_app/scr/shared/constants.dart';
import 'package:intl/intl.dart';

class HotelSearchController extends GetxController {
  Rx<String> cityName = ''.obs;
  Rx<String> date = ''.obs;
  Rx<int> selectedIndex = 0.obs;
}

class HotelSearchPage extends GetView {
  final HotelSearchController controller = HotelSearchController();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/hotel_sp.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          color: Colors.black38,
        ),
        Container(
          padding: EdgeInsets.all(20),
          child: SafeArea(
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 100.0, 30.0, 50.0),
                  child: Text(
                    'Our Engine let\'s you find the most amazing hotels in the world, easly.',
                    style:
                        kPrimaryFiltersTitleStyle.copyWith(color: Colors.white),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 3),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white.withOpacity(0.86),
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 15.0),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 40.0, top: 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'City Name',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(height: 12.0),
                            Obx(
                              () => TextField(
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color:
                                                  controller.cityName.value !=
                                                          ""
                                                      ? activationColor
                                                      : deactivatedColor)),
                                      hintText: "City",
                                      prefixIcon: Icon(Icons.search),
                                      hintStyle: TextStyle(
                                          fontSize: 17,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500)),
                                  // validator: validateCity,
                                  onChanged: (val) =>
                                      controller.cityName.value = val),
                            ),
                            SizedBox(height: 20.0),
                            Text(
                              'Check-In & Check-Out',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(height: 10.0),
                            Obx(
                              () => GestureDetector(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            left: BorderSide(
                                      color: controller.date.value != ""
                                          ? activationColor
                                          : deactivatedColor,
                                      width: 3,
                                    ))),
                                    child: Row(
                                      children: [
                                        SizedBox(width: 8),
                                        Icon(
                                          Icons.calendar_today_outlined,
                                          color: deactivatedColor,
                                        ),
                                        SizedBox(width: 10),
                                        Text(controller.date.value == ""
                                                ? "Wed 02 Jun - Thu 23 Jun"
                                                : controller.date.value
                                            //style:TextStyle()
                                            )
                                      ],
                                    ),
                                  ),
                                  onTap: () async {
                                    DateTimeRange? _tmp =
                                        await showDateRangePicker(
                                            context: context,
                                            firstDate: DateTime.now(),
                                            lastDate: DateTime.now()
                                                .add(Duration(days: 365)));
                                    if (_tmp != null)
                                      controller.date.value =
                                          DateFormat(DateFormat.MONTH_DAY)
                                                  .format(_tmp.start) +
                                              " - " +
                                              DateFormat(DateFormat.MONTH_DAY)
                                                  .format(_tmp.end);
                                  }),
                            ),
                            SizedBox(height: 28.0),
                            Text(
                              'Rooms and Guests',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(height: 10.0),
                            DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              controller.selectedIndex.value !=
                                                      -1
                                                  ? activationColor
                                                  : deactivatedColor)),
                                  contentPadding: EdgeInsets.all(12)),
                              icon: const Icon(Icons.arrow_downward),
                              iconSize: 24,
                              elevation: 16,
                              style: const TextStyle(color: Colors.deepPurple),
                              value: controller.selectedIndex.value != -1
                                  ? rooms[controller.selectedIndex.value]
                                  : "please Select",
                              onChanged: (val) {
                                controller.selectedIndex.value =
                                    rooms.indexOf(val!);
                              },
                              items: rooms.map((String item) {
                                return DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(item,
                                      style:
                                          TextStyle(color: Colors.grey[800])),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30.0),
                RoundedButton(
                    title: 'Search',
                    onPressed: () => Get.to(HotelResult()),
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    )),
                SizedBox(
                  height: 60.0,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
