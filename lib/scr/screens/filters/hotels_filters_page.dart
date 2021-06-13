import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:travel_app/scr/controllers/filters_controller.dart';
import 'package:travel_app/scr/shared/constants.dart';

import 'components/filters_header.dart';

class HotelFiltersPage extends StatelessWidget {
  HotelFiltersPage({Key key}) : super(key: key);
  // final controller = Get.find<FilterController>();
  final controller = Get.put(FilterController());
  // List data;
  // Future<String> loadJsonData() async {
  //   var jsonText = await rootBundle.loadString('data/booking.json');
  //   data = json.decode(jsonText);
  //   return 'success';
// }
  @override
  Widget build(BuildContext context) {
  // loadJsonData();
  //   print(data);
    return Scaffold(
      body: Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: ListView(
          children: [
            FiltersHeader(
                title: 'Filtering Available Hotels',
                subTitle:
                    'Let us help you find the perfect hotel that you want'),
          ],
        ),
      ),
    );
  }
}
