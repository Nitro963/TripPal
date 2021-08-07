import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:trip_pal_null_safe/controllers/app_theme_controller.dart';
import 'package:trip_pal_null_safe/controllers/search_bar_controller.dart';
import 'package:trip_pal_null_safe/screens/home/main_map_page.dart';
import 'package:trip_pal_null_safe/screens/home/profile_page.dart';
import 'package:trip_pal_null_safe/screens/home/home_drawer.dart';
import 'package:trip_pal_null_safe/screens/planing/trip/trip_types_screen.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';
import 'package:trip_pal_null_safe/utilities/themes.dart';
import 'package:trip_pal_null_safe/widgets/simple/rounded_navbar.dart';

import '../../controllers/main_page_controller.dart';
import 'blog_page.dart';
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
        Obx(
          () => RoundedNavBarItem(
            label: 'Planning',
            iconData: FontAwesomeIcons.mapMarked,
            itemColor: controller.tabIndex.value == 0 ? selected : unselected,
            onTap: () => controller.changeTabIndex(0),
            textStyle: labelStyle(0),
          ),
        ),
        Obx(
          () => RoundedNavBarItem(
            label: 'BOOKING',
            iconData: FontAwesomeIcons.hotel,
            itemColor: controller.tabIndex.value == 1 ? selected : unselected,
            onTap: () => controller.changeTabIndex(1),
            textStyle: labelStyle(1),
          ),
        ),
        SizedBox(width: MySize.screenWidth * 0.2),
        Obx(
          () => RoundedNavBarItem(
            label: 'BLOG',
            iconData: FontAwesomeIcons.newspaper,
            itemColor: controller.tabIndex.value == 2 ? selected : unselected,
            onTap: () => controller.changeTabIndex(2),
            textStyle: labelStyle(3),
          ),
        ),
        Obx(
          () => RoundedNavBarItem(
            label: 'PROFILE',
            iconData: FontAwesomeIcons.solidUserCircle,
            itemColor: controller.tabIndex.value == 3 ? selected : unselected,
            onTap: () => controller.changeTabIndex(3),
            textStyle: labelStyle(3),
          ),
        ),
      ];
      return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        extendBody: true,
        drawer: HomeDrawer(),
        bottomNavigationBar: RoundedNavBar(
          color: Themes.getNavigationThemeFromMode(_controller.themeMode)
              .backgroundColor!,
          size: Size(MySize.screenWidth, MySize.screenHeight),
          actions: actions,
          centerFloatingButton: FloatingActionButton(
            onPressed: () {
              // controller.changeTabIndex(2);
              Get.lazyPut(() => SearchBarController());
              Get.to(() => MainMapScreen());
            },
            child: Icon(
              FontAwesomeIcons.streetView,
              color: Themes.getNavigationThemeFromMode(_controller.themeMode)
                  .backgroundColor!,
            ),
            elevation: 0.1,
            backgroundColor: selected,
          ),
        ),
        body: SizedBox.expand(
          child: Obx(
            () => IndexedStack(
              index: controller.tabIndex.value,
              children: [
                TripsPage(),
                HotelSearchPage(),
                // MainMapScreen(),
                BlogPage(),
                ProfilePage(),
              ],
            ),
          ),
        ),
      );
    });
  }
}
