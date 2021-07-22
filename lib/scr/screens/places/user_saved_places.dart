import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/scr/controllers/profile_controller.dart';
import 'package:travel_app/scr/screens/Map/map_page.dart';
import 'components/place_card.dart';

class SavedPlaces extends StatelessWidget {
  SavedPlaces({Key? key}) : super(key: key);

  final controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.blueGrey[700],
            size: 22,
          ),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Favorite Places',
          style: TextStyle(color: Colors.blueGrey[900]),
        ),
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: true,
      ),
      body: Container(
          child: ListView.builder(
        itemCount: controller.userSavedPlaces.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return PlaceCard(
            activated: true,
            place: controller.userSavedPlaces[index],
            onTap: () => Get.to(MapPage(
                latitude: controller.userSavedPlaces[index].coordinate!.lat,
                longitude: controller.userSavedPlaces[index].coordinate!.lon,
                placeName: controller.userSavedPlaces[index].name)),
          );
        },
      )),
    );
  }
}
