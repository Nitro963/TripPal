import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel_app/scr/controllers/profile_controller.dart';
import 'package:travel_app/scr/screens/Profile/Component/FavoritesSection.dart';
import 'package:travel_app/scr/screens/home_drawer/home_drawer.dart';
import 'package:travel_app/scr/screens/places/components/profile_appbar.dart';
import 'Component/PagesIndectors.dart';
import 'package:get/get.dart';
import 'Component/HistorySection.dart';
import 'Component/SettingsSection.dart';

Rx<int> selectedIndex = 0.obs;
PageController controller = PageController();
final profileController = Get.put(ProfileContnroller());
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.blue[300],
    ));
    return Scaffold(
      backgroundColor: Colors.grey[50],
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0) ,
          child: ListView(
            children: [
             Container(
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                //  crossAxisAlignment: CrossAxisAlignment.stretch,
                 children: <Widget>[
                   Container(
                  height: 120.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    image: DecorationImage(
                        image: AssetImage(profileController.imgPath),
                        fit: BoxFit.cover),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: Offset(2, -4),
                      ),
                    ],
                  ),
                ),
                 ],
               ),
             ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12),
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
          ),
        ));
  }
}
