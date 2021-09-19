import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';

class FilterCheckBox extends StatelessWidget {
  FilterCheckBox(
      {required this.title, required this.onTap, required this.isChecked, this.description});
  final String title;
  final dynamic Function(bool?) onTap;
  final bool isChecked;
  final String? description;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(26.0, 0.0, 40.0, 0.0),
      height: MySize.getScaledSizeHeight(48),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(title,
              overflow: TextOverflow.ellipsis,
              style: Get.theme.textTheme.bodyText2!.copyWith(fontSize: 16.0)),
              description != null
                  ? FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(description!,
                          overflow: TextOverflow.ellipsis,
                          style: Get.theme.textTheme.bodyText2!.copyWith(
                              fontSize: 12,
                              color: Get.theme.colorScheme.onBackground
                                  .withOpacity(0.7))),
                    )
                  : SizedBox(),
            ],
          ),
          
          RoundCheckBox(
            borderColor: Get.theme.toggleableActiveColor,
            isChecked: isChecked,
            size: 22.0,
            checkedColor: Get.theme.toggleableActiveColor,
            onTap: onTap,
            checkedWidget:
                Icon(FontAwesomeIcons.check, color: Colors.white, size: 10.0),
          ),
        ],
      ),
    );
  }
}
