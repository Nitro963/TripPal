import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart' as intl;
import 'package:trip_pal_null_safe/controllers/app_theme_controller.dart';
import 'package:trip_pal_null_safe/controllers/trip_planning_controller.dart';
import 'package:trip_pal_null_safe/models/day_item.dart';
import 'package:trip_pal_null_safe/models/trip.dart';
import 'package:trip_pal_null_safe/screens/maps/map_page.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';
import 'package:trip_pal_null_safe/utilities/themes.dart';
import 'package:trip_pal_null_safe/utilities/transformers.dart';
import 'package:trip_pal_null_safe/utilities/utils.dart';
import 'package:trip_pal_null_safe/widgets/extendable/model_details_view.dart';
import 'package:trip_pal_null_safe/widgets/transformer_page_view/transformer_page_view.dart';
import 'trip_planning_widgets.dart';

class TripPlan extends DetailsScaffold {
  TripPlanningController get controller => Get.find<TripPlanningController>();
  PreferredSizeWidget buildAppBar() {
    return PreferredSize(
      preferredSize: Size(MySize.screenWidth, MySize.getScaledSizeHeight(140)),
      child: Obx(()=>Column(
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
          if(controller.hasData)
            Container(
              height: MySize.getScaledSizeHeight(60),
              child: PagesIndicators(
                  index: controller.selectedIndex,
                  daysCount:controller.trip.days.length
              ),
            )
        ],
      )),
    );
  }
  Widget buildBody(){
    final customTheme =
    Themes.getCustomAppTheme(Get.find<AppThemeController>().themeMode);
    return Column(
      children: [
        Expanded(
          child: TransformerPageView(
              pageController: controller.pageController,
              physics: BouncingScrollPhysics(),
              itemCount: controller.trip.days.length,
              duration: Duration(seconds: 1),
              onPageChanged: (index) {
                controller.selectedIndex = index;
              },
              transformer: ZoomInPageTransformer(),
              itemBuilder: (context, pageIndex) {
                var subtypes = controller.generateSubType(
                    controller.trip.days[pageIndex]);
                return ListView.builder(
                    itemCount: controller.trip.days[pageIndex].activities.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: index == 0
                            ? Spacing.only(top: 8)
                            : Spacing.only(top: 2.5),
                        child: CustomStepper(
                          subType: 'unknown',
                          place: controller.trip.days[pageIndex].activities[index].place!,
                          time: DateTime.now(),
                          lineColor: customTheme.colorInfo,
                        ),
                      );
                    });
              }),
        ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // List<Item> mapPoint = List<Item>.empty(growable: true);
          // controller.trip.days[controller.selectedIndex].activities.forEach((element) {
          //   var place = element.place!;
          //   mapPoint.add(Item(
          //       type: 'place',
          //       id: place.id.toString(),
          //       coordinate: LatLng(place.latitude!, place.longitude!),
          //       name: place.name!,
          //       rate: (place.guestRating ?? 0).toString()));
          //   });
          // Get.to(()=>MapPage(points: mapPoint));
        },
        child: Icon(FontAwesomeIcons.mapMarkedAlt, size: 20),
      ),
      body: Obx(() {
        if (controller.hasData) return buildBody();
        return Center(
            child: !controller.hasError
                ? CircularProgressIndicator()
                : buildErrorContent(controller.errorModel!));
      }),
    );
  }
}
