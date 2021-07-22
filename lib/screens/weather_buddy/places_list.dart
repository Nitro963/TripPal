import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:trip_pal_null_safe/controllers/weather_buddy_controller.dart';
import 'package:trip_pal_null_safe/widgets/animated/arrangeable_places_list.dart';
import 'package:trip_pal_null_safe/controllers/places_search_view_controller.dart';

import 'search_view.dart';

class WeatherBuddyPlaces extends GetView<WeatherBuddyController> {
  static const List<String> OPTIONS = ['Clear all', 'Add current trip cities'];
  static const Map<String, IconData> ICONS = {
    'Clear all': Icons.clear,
    'Add current trip cities': Icons.list_alt
  };

  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Scaffold(
        appBar: AppBar(
          title: const Text('The Weather Buddy'),
          actions: <Widget>[
            _buildPopupMenuButton(context, textTheme),
          ],
        ),
        body: Obx(() => ListView(
                controller: scrollController,
                // Prevent the ListView from scrolling when an item is
                // currently being dragged.
                physics: controller.inReorder
                    ? const NeverScrollableScrollPhysics()
                    : const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.only(bottom: 24),
                children: <Widget>[
                  WeatherBuddyPlacesView(scrollController: scrollController),
                ])));
  }

  Widget _buildPopupMenuButton(BuildContext context, TextTheme textTheme) {
    return PopupMenuButton<String>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      onSelected: (value) {
        switch (value) {
          case 'Clear all':
            controller.clear();
            break;
          case 'Add current trip cities':
            // TODO add current trip places to the list
            break;
        }
      },
      itemBuilder: (context) => OPTIONS.map((option) {
        return PopupMenuItem(
          value: option,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(ICONS[option], color: Colors.black, size: 20),
              SizedBox(width: 10),
              Text(
                option,
                style: textTheme.bodyText2,
              )
            ],
          ),
        );
      }).toList(),
    );
  }
}

class WeatherBuddyPlacesView extends ArrangeablePlacesListView {
  WeatherBuddyPlacesView(
      {Key? key, required scrollController, buildFooter = true})
      : super(
            key: key,
            scrollController: scrollController,
            buildFooter: buildFooter);

  void onAddButtonPressed() {
    Get.toNamed('/weather-buddy/list/search')!.then((value) {
      if (value != null) controller.addPlace(value);
    });
  }

  @override
  WeatherBuddyController get controller => Get.find<WeatherBuddyController>();
}
