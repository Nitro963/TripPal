import 'package:flutter/material.dart';
import 'package:travel_app/scr/shared/constants.dart';

import 'Componenet/BlogListWidget.dart';
import 'Componenet/ContienetListView.dart';
import 'Componenet/PopularPlacesPageView.dart';
import 'Componenet/TopCitiesWidget.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  var isSearching = false.obs;
  @override
  Widget build(BuildContext context) {
    SizeConfig.init();
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ContinentListView(),
                    PopularPlacesPageView(),
                    TopCities(),
                    BlogList(),
                  ],
                ),
                Obx(() => isSearching.value ? HomeSearch() : Container()),
              ],
            ),
          )),
      ),
    );
  }
}

class HomeSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: SizeConfig.blockSizeVertical * .4,
      child: Container(
        color: Colors.white,
        width: SizeConfig.blockSizeHorizontal * 94,
        height: SizeConfig.blockSizeVertical * 7,
        child: TextField(
            autofocus: true,
            decoration: InputDecoration(
              hintText: "Main Search ",
              hintStyle: TextStyle(color: Colors.grey),
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(color: Colors.amber),
              ),
            )),
      ),
    );
  }
}
