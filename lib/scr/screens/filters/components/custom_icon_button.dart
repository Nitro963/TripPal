
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:travel_app/scr/controllers/filters_controller.dart';

import '../advanced_filters_page.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    Key key,
    @required this.controller,
  }) : super(key: key);

  final FilterController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
          alignment: Alignment.topRight,
          child: IconButton(
              icon: Icon(
                FontAwesomeIcons.slidersH,
                size: 18.0,
              ),
              onPressed: () {
                controller.selectPlaces();
                Get.to(AdvancedFiltersPage());
              }
              )
        ));
  }
}
