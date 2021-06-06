import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
import 'package:implicitly_animated_reorderable_list/transitions.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:travel_app/scr/models/place.dart';
import 'package:travel_app/scr/models/places_search_controller.dart';
import 'package:travel_app/scr/shared/constants.dart';

class TripPlanning extends StatelessWidget {
  final searchBarController = FloatingSearchBarController();
  final searchController = Get.find<PlacesSearchController>();
  Widget buildSearchBar() {
    final actions = [
      FloatingSearchBarAction.icon(
        showIfOpened: false,
        icon: Icons.not_listed_location_outlined,
        onTap: () {},
      ),
      FloatingSearchBarAction.searchToClear(
        showIfClosed: false,
      ),
    ];

    return Obx(() => FloatingSearchBar(
          backgroundColor: Colors.white,
          controller: searchBarController,
          clearQueryOnClose: true,
          iconColor: Colors.grey,
          transitionDuration: const Duration(milliseconds: 800),
          transitionCurve: Curves.easeInOutCubic,
          physics: const BouncingScrollPhysics(),
          axisAlignment: 0,
          openAxisAlignment: 0.0,
          maxWidth: SizeConfig.screenWidth,
          actions: actions,
          progress: searchController.isLoading,
          debounceDelay: const Duration(milliseconds: 500),
          onQueryChanged: searchController.onQueryChanged,
          transition: CircularFloatingSearchBarTransition(),
          accentColor: Colors.blueAccent,
          builder: (context, _) => buildExpandableBody(),
          body: buildBody(),
        ));
  }

  Widget buildExpandableBody() {
    return Material(
      color: Colors.white,
      elevation: 4.0,
      borderRadius: BorderRadius.circular(8),
      child: Obx(() => ImplicitlyAnimatedList<Place>(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            items: searchController.suggestions.take(6).toList(),
            areItemsTheSame: (a, b) => a == b,
            itemBuilder: (_, animation, place, i) {
              return SizeFadeTransition(
                animation: animation,
                child: buildItem(place),
              );
            },
            updateItemBuilder: (_, animation, place) {
              return FadeTransition(
                opacity: animation,
                child: buildItem(place),
              );
            },
          )),
    );
  }

  Widget buildList() {
    return Container(
      height: 300.0,
      width: 300.0,
      color: Colors.blue,
      child: Text(
        'fuck',
        style: TextStyle(fontSize: 50.0),
      ),
    );
  }

  Widget buildItem(Place place) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: () {
            searchBarController.close();

            Future.delayed(
              const Duration(milliseconds: 500),
              () => searchController.clear(),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                SizedBox(
                  width: 36,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    child: searchController.isHistory
                        ? const Icon(Icons.history, key: Key('history'))
                        : const Icon(Icons.place, key: Key('place')),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        place.name,
                        style: Get.textTheme.subtitle1,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        place.level2Address,
                        style: Get.textTheme.bodyText2
                            .copyWith(color: Colors.grey.shade600),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        if (searchController.suggestions.isNotEmpty &&
            place != searchController.suggestions.last)
          const Divider(height: 0),
      ],
    );
  }

  Widget buildBody() {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      floatingActionButton: Padding(
          padding: const EdgeInsetsDirectional.only(bottom: 16),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.white,
              child: const Icon(Icons.gps_fixed, color: Color(0xFF4d4d4d)),
            ),
            // const SizedBox(height: 16),
            // FloatingActionButton(
            //   onPressed: () {},
            //   backgroundColor: Colors.blue,
            //   child: const Icon(Icons.workspaces_filled),
            // )
          ])),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/map.jpg'),
              fit: BoxFit.fill,
            ),
          ),
      child: Directionality(
              textDirection: TextDirection.ltr, child: buildSearchBar()),
    );
  }
}
