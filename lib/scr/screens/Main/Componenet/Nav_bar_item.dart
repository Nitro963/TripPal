
import 'package:flutter/material.dart';
import 'package:travel_app/scr/screens/Main/Componenet/constants.dart';

class NavBarItem extends StatelessWidget {
  const NavBarItem({
    Key key,
    @required this.title,
    @required this.icon,
    @required this.onPressed,
    @required this.color,
  }) : super(key: key);
  final String title;
  final icon;
  final onPressed;
  final color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            size: 20.0,
            color: color,
          ),
          Text(title,
              style: kSecondaryTitleStyle.copyWith(
                color: color,
              ))
        ],
      ),
    );
  }
}
