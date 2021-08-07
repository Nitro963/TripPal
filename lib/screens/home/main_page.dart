import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:trip_pal_null_safe/controllers/app_theme_controller.dart';
import 'package:trip_pal_null_safe/screens/credentials/Profile_page.dart';
import 'package:trip_pal_null_safe/screens/home/home_drawer.dart';
import 'package:trip_pal_null_safe/screens/planing/trip/trip_types_screen.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';
import 'package:trip_pal_null_safe/utilities/themes.dart';
import 'package:trip_pal_null_safe/widgets/simple/rounded_navbar.dart';

import '../../controllers/main_page_controller.dart';
import 'blogs_page.dart';
import 'main_map_page.dart';
import 'hotel_search_page.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  final AppThemeController _controller = Get.find<AppThemeController>();
  @override
  Widget build(BuildContext context) {
    Color selected = Themes.getNavigationThemeFromMode(_controller.themeMode)
        .selectedItemColor!;
    Color unselected = Themes.getNavigationThemeFromMode(_controller.themeMode)
        .unselectedItemColor!;

    return GetBuilder<MainPageController>(builder: (controller) {
      TextStyle labelStyle(int index) {
        return TextStyle(
            fontSize: controller.tabIndex.value == index ? 12.0 : 10.0,
            color: controller.tabIndex.value == index ? selected : unselected,
            fontWeight: controller.tabIndex.value == index
                ? FontWeight.bold
                : FontWeight.normal);
      }

      List<Widget> actions = [
        Obx(() => RoundedNavBarItem(
              label: 'Planning',
              iconData: FontAwesomeIcons.mapMarked,
              itemColor: controller.tabIndex.value == 0 ? selected : unselected,
              onTap: () => controller.changeTabIndex(0),
              textStyle: labelStyle(0),
            )),
        Obx(() => RoundedNavBarItem(
              label: 'BOOKING',
              iconData: FontAwesomeIcons.hotel,
              itemColor: controller.tabIndex.value == 1 ? selected : unselected,
              onTap: () => controller.changeTabIndex(1),
              textStyle: labelStyle(1),
            )),
        SizedBox(width: MySize.screenWidth * 0.2),
        Obx(() => RoundedNavBarItem(
              label: 'BLOG',
              iconData: FontAwesomeIcons.newspaper,
              itemColor: controller.tabIndex.value == 3 ? selected : unselected,
              onTap: () => controller.changeTabIndex(3),
              textStyle: labelStyle(3),
            )),
        Obx(() => RoundedNavBarItem(
              label: 'PROFILE',
              iconData: FontAwesomeIcons.solidUserCircle,
              itemColor: controller.tabIndex.value == 4 ? selected : unselected,
              onTap: () => controller.changeTabIndex(4),
              textStyle: labelStyle(4),
            )),
      ];
      // final GlobalKey<ScaffoldState> _scaffoldKey =
      //     new GlobalKey<ScaffoldState>();
      return Scaffold(
        // key: _scaffoldKey,
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        drawer: HomeDrawer(),
        body: SizedBox.expand(
          child: Stack(
            children: [
              Obx(
                () => IndexedStack(
                  index: controller.tabIndex.value,
                  children: [
                    TripsPage(),
                    HotelSearchPage(),
                    MainMapPage(),
                    BlogPage(),
                    ProfilePage(),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: RoundedNavBar(
                  color:
                      Themes.getNavigationThemeFromMode(_controller.themeMode)
                          .backgroundColor!,
                  size: Size(MySize.screenWidth, MySize.screenHeight),
                  actions: actions,
                  centerFloatingButton: FloatingActionButton(
                    onPressed: () {
                      controller.changeTabIndex(2);
                    },
                    child: Icon(
                      FontAwesomeIcons.streetView,
                      color: Themes.getNavigationThemeFromMode(
                              _controller.themeMode)
                          .backgroundColor!,
                    ),
                    elevation: 0.1,
                    backgroundColor: selected,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
