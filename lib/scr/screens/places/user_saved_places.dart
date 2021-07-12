import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/scr/controllers/profile_controller.dart';
import 'package:travel_app/scr/models/PlacesSEData.dart';
import 'package:travel_app/scr/screens/Map/map_page.dart';
import 'components/place_card.dart';
import 'components/profile_appbar.dart';

class SavedPlaces extends StatelessWidget {
  SavedPlaces({Key key}) : super(key: key);

  final controller = Get.put(ProfileContnroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 80.0,
        elevation: 0.9,
        backgroundColor: Colors.white,
        title: ProfileAppbar(
          title: 'Your Saved Places',
        ),
      ),
      body: Container(
          child: ListView.builder(
        itemCount: controller.userSavedPlaces.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return PlaceCard(
            primaryColor: selectPrimaryColor(
                controller.userSavedPlaces[index].kinds.split(',')[0]),
            secondaryColor: selectSecondartColor(
                controller.userSavedPlaces[index].kinds.split(',')[0]),
            data: controller.userSavedPlaces[index],
            onTap: () => Get.to(MapPage(
                latitude: controller.userSavedPlaces[index].coordinate.lat,
                longitude: controller.userSavedPlaces[index].coordinate.lon,
                placeName: controller.userSavedPlaces[index].name)),
          );
        },
      )),
    );
  }
}
