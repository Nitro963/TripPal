
import 'package:flutter/material.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

class FilterCheckBox extends StatelessWidget {
  FilterCheckBox({
    @required this.title,
    @required this.onTap,
    @required this.icon,
    @required this.isChecked
  });
  final String title;
  final onTap;
  final Icon icon;
  final bool isChecked;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(26.0, 0.0, 40.0, 0.0),
      height: 50.0,
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
          RoundCheckBox(
            borderColor: Colors.blue[800],
            isChecked: isChecked,
            size: 25.0,
            checkedColor: Colors.blue[800],
            onTap: onTap,
            checkedWidget: icon,
          ),
        ],
      ),
    );
  }
}


