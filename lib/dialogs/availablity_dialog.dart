import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';

class NotAvailableDialog extends StatelessWidget {
  const NotAvailableDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: SizedBox(
      height: MySize.getScaledSizeHeight(50),
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(FontAwesomeIcons.rocket,
              size: 16, color: Get.theme.toggleableActiveColor),
          Space.width(4),
          Text(
            'Not Available Yet!',
            style: Get.theme.textTheme.bodyText1,
          )
        ],
      )),
    ));
  }
}
