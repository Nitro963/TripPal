import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';

class RoundedGestWidget extends StatelessWidget {
  RoundedGestWidget({
    Key? key,
    required this.title,
    required this.selected,
    this.onTap,
  }) : super(key: key);

  final String title;
  final bool selected;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
        margin: Spacing.bottom(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
              color: !selected ? Colors.grey[100]! : Colors.grey[200]!),
          color:
              !selected ? Get.theme.cardColor : Get.theme.colorScheme.surface,
        ),
        // alignment: Alignment.center,
        child: Text(title,
            textAlign: TextAlign.center,
            style: Get.theme.textTheme.subtitle2!.copyWith(
                color: !selected
                    ? Get.theme.colorScheme.onBackground
                    : Get.theme.colorScheme.onSurface,
                fontWeight: !selected ? FontWeight.normal : FontWeight.bold)),
      ),
    );
  }
}
