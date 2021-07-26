import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SavedTripsHeader extends StatelessWidget {
  const SavedTripsHeader({
    Key? key,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
      child: FittedBox(
        fit: BoxFit.fill,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: Get.textTheme.headline4!.copyWith(fontWeight: FontWeight.bold)
            ),
            Text(
              subTitle,
              style: Get.textTheme.headline5!
            ),
          ],
        ),
      ),
    );
  }
}
