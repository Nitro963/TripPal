
import 'package:flutter/material.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

class FilterCheckBox extends StatelessWidget {
  FilterCheckBox({
    @required this.title,
    @required this.onTap,
    @required this.icon,
  });
  final String title;
  final onTap;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 50.0,
      child: Padding(
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
            RoundCheckBox(
              borderColor: Colors.grey[350],
              size: 25.0,
              checkedColor: Colors.blueAccent,
              onTap: onTap,
              checkedWidget: icon,
            ),
          ],
        ),
      ),
    );
  }
}


