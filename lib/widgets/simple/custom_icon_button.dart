import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:trip_pal_null_safe/controllers/filters_controller.dart';

// import '../../../screens/filtering/advanced_filters_page.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final FilterController controller;
  // TODO make a call back function not a controller member (i.e make abstract widget)
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
                  // TODO use named routes
                  // Get.to(AdvancedFiltersPage());
                })));
  }
}
