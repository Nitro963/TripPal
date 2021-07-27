import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoundedRadioButton extends StatelessWidget {
  RoundedRadioButton(
      {Key? key,
      required this.value,
      required this.groupValue,
      required this.onChanged,
      this.description})
      : super(key: key);

  final String value;
  final String groupValue;
  final String? description;
  final void Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () {
        if (onChanged != null) onChanged!(value);
      },
      child: Container(
        height: 50.0,
        color: Get.theme.backgroundColor,
        padding: const EdgeInsets.fromLTRB(26.0, 0.0, 26.0, 0.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(value,
                    style: Get.theme.textTheme.subtitle2!
                        .copyWith(fontSize: 19.0)),
                        SizedBox(height: 2.0),
                description != null
                    ? Text(description!,
                        overflow: TextOverflow.ellipsis,
                        style: Get.theme.textTheme.bodyText2!.copyWith(
                            color: Get.theme.colorScheme.onBackground))
                    : SizedBox(),
              ],
            ),
            Transform.scale(
              scale: 1.4,
              child: Radio(
                  value: value, groupValue: groupValue, onChanged: onChanged),
            ),
          ],
        ),
      ),
    );
  }
}
