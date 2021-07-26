import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoundedRadioButton extends StatelessWidget {
  RoundedRadioButton({
    Key? key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  }) : super(key: key);

  final String value;
  final String groupValue;
  final void Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
            Text(
            value,
            style: Get.theme.textTheme.subtitle2!.copyWith(fontSize: 19.0)
          ),
            Transform.scale(
              scale: 1.4,
              child: Radio(
                  value: value,
                  groupValue: groupValue,
                  onChanged: onChanged),
            ),
          ],
        ),
      ),
    );
  }
}
