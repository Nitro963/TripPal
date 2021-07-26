import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color:
                      !selected ? Colors.grey[100]! : Colors.grey[200]!),
                color: !selected
                  ? Get.theme.cardColor
                  : Get.theme.colorScheme.surface,
              ),
              child: Text(title,
                  textAlign: TextAlign.center,
                  style: Get.theme.textTheme.bodyText2),
            ),
      ),
    );
  }
}
