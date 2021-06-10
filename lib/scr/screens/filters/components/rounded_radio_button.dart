
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/scr/controllers/filters_controller.dart';
import 'package:travel_app/scr/shared/constants.dart';

class RoundedRadioButton extends StatelessWidget {
  const RoundedRadioButton({
    Key key,
    @required this.controller,
    @required this.title,
    @required this.idx
  }) : super(key: key);

  final FilterController controller;
  final String title;
  final int idx;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: SizeConfig.screenWidth,
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(26.0, 0.0, 26.0, 0.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          GetBuilder<FilterController>(
            builder: (_) => Transform.scale(
              scale: 1.4,
              child: Radio(
                  fillColor: MaterialStateColor.resolveWith(
                      (states) => Colors.blue[800]),
                  value: controller.tripModes[idx],
                  groupValue: controller.tripMode,
                  onChanged: (value) => controller.onClickRadioButton(value)),
            ),
          ),
        ],
      ),
    );
  }
}
