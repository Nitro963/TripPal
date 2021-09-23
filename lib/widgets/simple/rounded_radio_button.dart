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
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(value,
                      style: Get.theme.textTheme.bodyText2!
                          .copyWith(fontSize: 16.0)),
                  SizedBox(height: 2.0),
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
            ),
            Transform.scale(
              scale: 1.2,
              child: Radio(
                  value: value, groupValue: groupValue, onChanged: onChanged),
            ),
          ],
        ),
      ),
    );
  }
}
