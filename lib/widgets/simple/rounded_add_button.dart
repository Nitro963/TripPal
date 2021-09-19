import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class RoundedAddButton extends StatelessWidget {
  const RoundedAddButton({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);
  final String title;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
        // width: MySize.getScaledSizeWidth(100),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: Colors.grey[200]!),
            color: Get.theme.cardColor),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              FontAwesomeIcons.plusCircle,
              color: Colors.grey[500],
              size: 18,
            ),
            SizedBox(
              width: 8.0,
            ),
            Text(
              title,
              style: Get.theme.textTheme.subtitle2!.copyWith(
                  color: Get.theme.colorScheme.onBackground,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
