import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip_pal_null_safe/controllers/profile_controller.dart';
import 'package:trip_pal_null_safe/screens/maps/map_page.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';
import 'package:trip_pal_null_safe/widgets/simple/place_card.dart';

class SavedPlaces extends StatelessWidget {
  SavedPlaces({Key? key}) : super(key: key);
  // TODO convert to get view and use named routes with bindings!
  // never ever do this shit!
  final controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Places'),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: Container(
        margin: Spacing.symmetric(vertical: 10, horizontal: 5),
        child: ListView.builder(
          itemCount: controller.userSavedPlaces.length,
          physics: BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return PlaceCard(
              activated: true,
              place: controller.userSavedPlaces[index],
              onTap: () => Get.to(
                MapPage(
                    latitude: controller.userSavedPlaces[index].coordinate!.lat,
                    longitude:
                        controller.userSavedPlaces[index].coordinate!.lon,
                    placeName: controller.userSavedPlaces[index].name),
              ),
            );
          },
        ),
      ),
    );
  }
}
