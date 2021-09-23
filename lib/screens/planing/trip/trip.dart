import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:trip_pal_null_safe/controllers/app_theme_controller.dart';
import 'package:trip_pal_null_safe/controllers/maps_controller.dart';
import 'package:trip_pal_null_safe/controllers/trip_planning_controller.dart';
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
      child: Obx(() => Column(
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
              if (controller.hasData)
                Container(
                  height: MySize.getScaledSizeHeight(60),
                  child: PagesIndicators(controller.trip.startDate!,
                      index: controller.selectedIndex,
                      daysCount: controller.trip.days.length),
                )
            ],
          )),
    );
  }

  Widget buildBody() {
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
                final subTypes =
                    controller.generateSubType(controller.trip.days[pageIndex]);
                return ListView.builder(
                    itemCount:
                        controller.trip.days[pageIndex].activities.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: index == 0
                            ? Spacing.only(top: 8)
                            : Spacing.only(
                                top: 2.5,
                                bottom: (index ==
                                        controller.trip.days[pageIndex]
                                                .activities.length -
                                            1)
                                    ? 32
                                    : 0),
                        child: CustomStepper(
                          subType: subTypes[index],
                          place: controller
                              .trip.days[pageIndex].activities[index].place!,
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
          Get.lazyPut(() => MapController());
          Get.to(() => MapPage(
              points:
                  controller.trip.days[controller.selectedIndex].activities));
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

class TripPlanAuto extends GetView<TripPlanningControllerAuto> {
  PreferredSizeWidget buildAppBar() {
    return PreferredSize(
      preferredSize: Size(MySize.screenWidth, MySize.getScaledSizeHeight(140)),
      child: Obx(() {
        var trip = controller.selectedTrip.value == 1
            ? controller.trip1
            : controller.trip2;
        return Column(
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
              child: PagesIndicatorsAuto(trip.startDate!,
                  index: controller.selectedIndex, daysCount: trip.days.length),
            )
          ],
        );
      }),
    );
  }

  Widget buildBody() {
    final customTheme =
        Themes.getCustomAppTheme(Get.find<AppThemeController>().themeMode);
    return Column(children: [
      Expanded(
        child: IndexedStack(
          index: controller.selectedTrip.value - 1,
          children: [
            TransformerPageView(
                pageController: controller.pageController1,
                physics: BouncingScrollPhysics(),
                itemCount: controller.trip1.days.length,
                duration: Duration(seconds: 1),
                onPageChanged: (index) {
                  controller.selectedIndex = index;
                },
                transformer: ZoomInPageTransformer(),
                itemBuilder: (context, pageIndex) {
                  final subTypes = controller
                      .generateSubType(controller.trip1.days[pageIndex]);
                  return ListView.builder(
                      itemCount:
                          controller.trip1.days[pageIndex].activities.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: index == 0
                              ? Spacing.only(top: 8)
                              : Spacing.only(
                                  top: 2.5,
                                  bottom: (index ==
                                          controller.trip1.days[pageIndex]
                                                  .activities.length -
                                              1)
                                      ? 32
                                      : 0),
                          child: CustomStepper(
                            subType: subTypes[index],
                            place: controller
                                .trip1.days[pageIndex].activities[index].place!,
                            time: DateTime.now(),
                            lineColor: customTheme.colorInfo,
                          ),
                        );
                      });
                }),
            TransformerPageView(
                pageController: controller.pageController2,
                physics: BouncingScrollPhysics(),
                itemCount: controller.trip1.days.length,
                duration: Duration(seconds: 1),
                onPageChanged: (index) {
                  controller.selectedIndex = index;
                },
                transformer: ZoomInPageTransformer(),
                itemBuilder: (context, pageIndex) {
                  final subTypes = controller
                      .generateSubType(controller.trip2.days[pageIndex]);
                  return ListView.builder(
                      itemCount:
                          controller.trip2.days[pageIndex].activities.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: index == 0
                              ? Spacing.only(top: 8)
                              : Spacing.only(
                                  top: 2.5,
                                  bottom: (index ==
                                          controller.trip2.days[pageIndex]
                                                  .activities.length -
                                              1)
                                      ? 32
                                      : 0),
                          child: CustomStepper(
                            subType: subTypes[index],
                            place: controller
                                .trip2.days[pageIndex].activities[index].place!,
                            time: DateTime.now(),
                            lineColor: customTheme.colorInfo,
                          ),
                        );
                      });
                }),
          ],
        ),
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: null,
              onPressed: () {
                var trip = controller.selectedTrip.value == 1
                    ? controller.trip1
                    : controller.trip2;
                Get.lazyPut(() => MapController());
                Get.to(() => MapPage(
                    points: trip.days[controller.selectedIndex].activities));
              },
              child: Icon(FontAwesomeIcons.mapMarkedAlt, size: 20),
            ),
            Space.height(16),
            FloatingActionButton(
              heroTag: null,
              onPressed: () {
                controller.switchTrip();
                // Get.put(MapViewController());
                // Get.to(() => MapView());
              },
              child: Icon(Icons.swap_horiz, size: 20),
            ),
          ],
        ),
        body: Obx(() => buildBody()));
  }
}
