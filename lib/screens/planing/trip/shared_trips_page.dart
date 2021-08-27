import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip_pal_null_safe/controllers/trips_controller.dart';
import 'package:trip_pal_null_safe/controllers/trips_list_controller.dart';
import 'package:trip_pal_null_safe/dummy_data.dart';
import 'package:trip_pal_null_safe/models/abstract_model.dart';
import 'package:trip_pal_null_safe/models/trip.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';
import 'package:trip_pal_null_safe/widgets/extendable/animated_list_view.dart';
import 'package:trip_pal_null_safe/widgets/simple/sort_bottom_sheet.dart';

import 'trip_card.dart';

class SharedTripsPage extends AnimatedIModelListView {
  TripsListController get controller => Get.find<TripsListController>();

  @override
  Widget buildItem(IModel item, int index, double scale, BuildContext context) {
    var trip = item as Trip;
    return Align(
      heightFactor: 1.08,
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: TripCard(
          days: trip.days.length,
          // TODO convert to Fancy shimmer image
          imgPath:
              "/assets/images/5.jpg", //'assets/images/${dummyTrips[0].city}.jpg'.toLowerCase(),
          tripType: "Extended",
          location:
              "Damas", // '${dummyTrips[0].city}, ${dummyTrips[0].country}',
          details: "dummyTrips[0].details",
          // onTap: () => Get.to(TripPlan()),
        ),
      ),
    );
  }

  @override
  double calcScale(int index) {
    double scale = 1.0;
    if (controller.topContainer > 0.5) {
      scale = index + 0.9 - controller.topContainer;
      if (scale < 0) {
        scale = 0;
      } else if (scale > 1) scale = 1;
    }
    return scale;
  }

  @override
  Widget buildHeader() {
    return Container(
      padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Most Popular Plans',
              overflow: TextOverflow.clip,
              style: Get.textTheme.headline4!
                  .copyWith(fontWeight: FontWeight.bold)),
          Text('See some trips planned Manualy by other users',
              overflow: TextOverflow.clip, style: Get.textTheme.headline5!),
        ],
      ),
    );
  }

  @override
  double get headerHeight => MySize.getScaledSizeHeight(80);

  @override
  PreferredSizeWidget? buildAppBar() {
    return AppBar(
      title: Text('Shared Trips'),
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(Icons.tune_outlined),
          onPressed: () async {
            Future.delayed(Duration(milliseconds: 150), () async {
              final res = await Get.bottomSheet(SortBottomSheet(
                  policies: controller.sortPolices,
                  initialValue: controller.sortPolicy));
              controller.sortPolicy = res;
            });
          },
        ),
      ],
    );
  }

  @override
  IconData get itemIcon => Icons.edit;
}
