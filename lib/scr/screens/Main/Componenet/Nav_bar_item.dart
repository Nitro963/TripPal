
import 'package:flutter/material.dart';

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
            size: 24.0,
            color: color,
          ),
          SizedBox(height: 4),
          Text(title,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
                fontSize: 14.0
              ))
        ],
      ),
    );
  }
}
