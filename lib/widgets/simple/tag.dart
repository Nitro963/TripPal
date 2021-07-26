import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Tag extends StatelessWidget {
  const Tag({
    Key? key,
    required this.kind,
  }) : super(key: key);
  final String kind;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(4.0),
        margin: EdgeInsets.all(2.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2.0),
            color: Get.theme.canvasColor
            ),
        child: Text(
          kind.capitalizeFirst!,
          style: Get.theme.textTheme.subtitle2!.copyWith(color: Get.theme.colorScheme.onSecondary, fontWeight: FontWeight.bold),
        ));
  }
}

