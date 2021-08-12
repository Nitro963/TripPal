import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart' as intl;
import 'package:trip_pal_null_safe/controllers/app_theme_controller.dart';
import 'package:trip_pal_null_safe/controllers/trip_planning_controller.dart';
import 'package:trip_pal_null_safe/models/day_item.dart';
import 'package:trip_pal_null_safe/screens/maps/map_page.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';
import 'package:trip_pal_null_safe/utilities/themes.dart';
import 'package:trip_pal_null_safe/utilities/transformers.dart';
import 'package:trip_pal_null_safe/widgets/transformer_page_view/transformer_page_view.dart';
import '../../../dummy_data.dart';
import 'trip_planning_widgets.dart';

class TripPlan extends GetView<TripPlanningController> {
  PreferredSizeWidget buildAppBar() {
    return PreferredSize(
      preferredSize: Size(MySize.screenWidth, MySize.getScaledSizeHeight(140)),
      child: Column(
        children: [
          AppBar(
            title: Text("Trip Plan Details"),
            centerTitle: true,
            backgroundColor: Get.theme.backgroundColor,
            elevation: 0,
            actions: [
              IconButton(
                  icon: Icon(Icons.edit_location_outlined),
                  onPressed: () {
                    // TODO edit mode
                  })
            ],
          ),
          Container(
            height: MySize.getScaledSizeHeight(60),
            child: PagesIndicators(
              index: controller.selectedIndex,
              daysCount: londonTrip['days']!.length,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final customTheme =
        Themes.getCustomAppTheme(Get.find<AppThemeController>().themeMode);
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        children: [
          Expanded(
            child: TransformerPageView(
                pageController: controller.pageController,
                physics: BouncingScrollPhysics(),
                itemCount: londonTrip['days']!.length,
                duration: Duration(seconds: 1),
                onPageChanged: (index) {
                  controller.selectedIndex = index;
                },
                transformer: ZoomInPageTransformer(),
                itemBuilder: (context, pageIndex) {
                  return ListView.builder(
                      itemCount:
                          (londonTrip['days']![pageIndex]['items'] as List)
                                  .length -
                              1,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: index == 0
                              ? Spacing.only(top: 8)
                              : Spacing.only(top: 2.5),
                          child: CustomStepper(
                            subType: controller.generateSubType(
                                (londonTrip['days']![pageIndex]['items']
                                    as List))[index],
                            plan: (londonTrip['days']![pageIndex]['items']
                                as List)[index],
                            time: controller.generateTime(
                                (londonTrip['days']![pageIndex]['items']
                                    as List))[index],
                            lineColor: controller
                                    .generateTime(
                                        (londonTrip['days']![pageIndex]['items']
                                            as List))[index]
                                    .isBefore(DateTime.now())
                                ? customTheme.colorInfo
                                : customTheme.disabledColor,
                          ),
                        );
                      });
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          List<Item> mapPoint = List<Item>.empty(growable: true);
          londonTrip['days']!.forEach((element) {
            (element['items'] as List).forEach((element) {
              mapPoint.add(Item(
                  type: element['item_type'].toString(),
                  id: ['item_id'].toString(),
                  coordinate: LatLng(element['coordinate']['lat'], element['coordinate']['lon']),
                  name: element['name'].toString(),
                  rate: element['rate'].toString()));
            });
          });
          print(mapPoint.length);
          Get.to(MapPage(points: mapPoint));
        },
        child: Icon(FontAwesomeIcons.mapMarkedAlt, size: 20),
      ),
    );
  }
}
