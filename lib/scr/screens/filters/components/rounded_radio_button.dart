import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoundedRadioButton extends StatelessWidget {
  RoundedRadioButton({
    Key? key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  }) : super(key: key);

  final RxString value;
  final RxString groupValue;
  final void Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      color: Theme.of(context).backgroundColor,
      padding: const EdgeInsets.fromLTRB(26.0, 0.0, 26.0, 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            value.value,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Transform.scale(
            scale: 1.4,
            child: Obx(
              () => Radio(
                  fillColor: MaterialStateColor.resolveWith(
                      (states) => Colors.blue[800]!),
                  value: value.value,
                  groupValue: groupValue.value,
                  onChanged: onChanged),
            ),
          )
        ],
      ),
    );
  }
}
