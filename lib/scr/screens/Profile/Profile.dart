import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel_app/scr/screens/Profile/Component/FavoritesSection.dart';
import 'Component/UpperProfileContainer.dart';
import 'Component/PagesIndectors.dart';
import 'package:get/get.dart';
import 'Component/HistorySection.dart';
import 'Component/SettingsSection.dart';

Rx<int> selectedIndex = 0.obs;
PageController controller = PageController();

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.blue[300],
    ));
    return Scaffold(
        body: ListView(
      children: [
        UpperProfileContainer(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12),
          child: Obx(() => PagesIndecators(
                controller: controller,
                index: selectedIndex.value,
              )),
        ),
        SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            height: 800,
            child: PageView(
                controller: controller,
                children: [
                  HistorySection(),
                  FavoritesSection(),
                  SettingsSection(),
                ],
                onPageChanged: (index) {
                  selectedIndex.value = index;
                }),
          ),
        )
      ],
    ));
  }
}
