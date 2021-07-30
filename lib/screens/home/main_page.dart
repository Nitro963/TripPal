import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip_pal_null_safe/screens/home/home_drawer.dart';
import 'package:trip_pal_null_safe/screens/planing/trip/trip_types_screen.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';
import 'package:trip_pal_null_safe/widgets/simple/rounded_navbar.dart';

import '../../controllers/main_page_controller.dart';
import 'hotel_search_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainPageController>(builder: (controller) {
      List<Widget> actions = [
        Obx(() => IconButton(
            icon: Icon(Icons.local_florist_rounded),
            onPressed: () => controller.changeTabIndex(0),
            color: controller.tabIndex.value == 0
                ? Colors.white
                : Colors.blue[100])),
        Obx(() => IconButton(
            icon: Icon(Icons.restaurant_menu),
            onPressed: () => controller.changeTabIndex(1),
            color: controller.tabIndex.value == 1
                ? Colors.white
                : Colors.blue[100])),
        SizedBox(width: MySize.screenWidth * 0.2),
        Obx(() => IconButton(
            icon: Icon(Icons.local_attraction),
            onPressed: () => controller.changeTabIndex(3),
            color: controller.tabIndex.value == 3
                ? Colors.white
                : Colors.blue[100])),
        Obx(() => IconButton(
            icon: Icon(Icons.hotel_rounded),
            onPressed: () => controller.changeTabIndex(4),
            color: controller.tabIndex.value == 4
                ? Colors.white
                : Colors.blue[100])),
      ];
      return Scaffold(
        drawer: HomeDrawer(),
          body: Stack(
        children: <Widget>[
          SafeArea(
            child: Obx(() => IndexedStack(
                  index: controller.tabIndex.value,
                  children: [TripsPage(), HotelSearchPage()],
                )),
          ),
          RoundedNavBar(
            color: Get.theme.primaryColor,
            size: Size(MySize.screenWidth, MySize.screenHeight),
            actions: actions,
            centerFloatingButton: FloatingActionButton(
              onPressed: () {
                controller.changeTabIndex(2);
              },
              child: Icon(
                Icons.home_filled,
              ),
              elevation: 0.1,
              backgroundColor: Get.theme.primaryColorDark,
            ),
          ),
        ],
      ));
    });
  }
}
