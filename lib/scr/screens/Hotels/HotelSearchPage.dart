import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/scr/models/DemoData.dart';
import 'package:travel_app/scr/screens/Hotels/HotelResults.dart';
import 'package:travel_app/scr/screens/Hotels/HotelSearchPage.dart';
import 'package:travel_app/scr/shared/constants.dart';
import 'package:intl/intl.dart';
import 'package:travel_app/scr/shared/Widgets/bottom_navigation_bar.dart';
import 'package:travel_app/scr/shared/services/validators.dart';

class HotelSearchController extends GetxController {
  Rx<String> cityName = ''.obs;
  Rx<String> date = ''.obs;
  Rx<int> selectedIndex = 0.obs;
}

class HotelSearchPage extends GetView {
  final HotelSearchController controller = HotelSearchController();

  @override
  Widget build(BuildContext context) {
    SizeConfig.init();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: BottomNavBar(
          currentIndex: 3,
        ),
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/BaiscBackground.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Text(
                        "TripPal will provide you what you really Need ",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.lightBlue[700],
                            fontWeight: FontWeight.w500)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      "Search for your perfect Hotel",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.blueGrey),
                    ),
                  ),
                  Spacer(),
                  Expanded(
                    flex: 4,
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        height: SizeConfig.blockSizeVertical * 40,
                        child: Column(children: [
                          Obx(
                            () => TextField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color:
                                                controller.cityName.value != ""
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
                          SizedBox(height: SizeConfig.blockSizeVertical * 5),
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
                                              ? "From - To"
                                              : controller.date.value
                                          //style:TextStyle()
                                          )
                                    ],
                                  ),
                                ),
                                onTap: () async {
                                  DateTimeRange _tmp =
                                      await showDateRangePicker(
                                          context: context,
                                          firstDate: DateTime.now(),
                                          lastDate: DateTime.now()
                                              .add(Duration(days: 365)));
                                  controller.date.value =
                                      DateFormat(DateFormat.MONTH_DAY)
                                              .format(_tmp.start) +
                                          " - " +
                                          DateFormat(DateFormat.MONTH_DAY)
                                              .format(_tmp.end);
                                }),
                          ),
                          SizedBox(height: SizeConfig.blockSizeVertical * 5),
                          DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            controller.selectedIndex.value != -1
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
                                  rooms.indexOf(val);
                            },
                            items: rooms.map((String item) {
                              return DropdownMenuItem<String>(
                                value: item,
                                child: Text(item,
                                    style: TextStyle(color: Colors.grey[800])),
                              );
                            }).toList(),
                          ),
                          Spacer(
                            flex: 2,
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                                minimumSize: MaterialStateProperty.all<Size>(
                                    Size(SizeConfig.blockSizeHorizontal * 70,
                                        SizeConfig.blockSizeVertical * 6))),
                            child: Text(
                              "Search",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.italic),
                            ),
                            onPressed: () {
                              print(controller.cityName.value);
                              print(controller.date.value);
                              print(controller.selectedIndex.value);
                              Get.to(HotelResult());
                            },
                          )
                        ])),
                  ),
                ],
              ),
            )));
  }
}
