import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

class FilterCheckBox extends StatelessWidget {
  FilterCheckBox(
      {required this.title,
      required this.onTap,
      required this.icon,
      required this.isChecked});
  final String title;
  final dynamic Function(bool?) onTap;
  final Icon icon;
  final bool isChecked;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(26.0, 0.0, 40.0, 0.0),
      height: 50.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: Get.theme.textTheme.subtitle2!.copyWith(fontSize: 19.0)
          ),
          RoundCheckBox(
            borderColor: Get.theme.toggleableActiveColor,
            isChecked: isChecked,
            size: 25.0,
            checkedColor: Get.theme.toggleableActiveColor,
            onTap: onTap,
            checkedWidget: icon,
          ),
        ],
      ),
    );
  }
}
