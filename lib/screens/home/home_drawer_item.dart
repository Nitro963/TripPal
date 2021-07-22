import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeDrawerItem extends StatelessWidget {
  const HomeDrawerItem({
    Key? key,
    required this.title,
    required this.subTitle,
    this.onTap,
    required this.icon,
  }) : super(key: key);
  final String title;
  final String subTitle;
  final void Function()? onTap;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 70.0,
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            border: Border.symmetric(
                horizontal: BorderSide(
                    color: Theme.of(context).dividerColor.withAlpha(40)))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(
                  icon,
                  size: 16.0,
                  color: Colors.lightBlue[900],
                ),
                SizedBox(width: 16.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          color: Colors.blueGrey[800]),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      subTitle,
                      style: TextStyle(
                          color: Colors.blueGrey[200],
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0),
                    ),
                  ],
                )
              ],
            ),
            Icon(
              // FontAwesomeIcons.caretRight,
              FontAwesomeIcons.angleRight,
              color: Colors.blueGrey[300],
              size: 16.0,
            )
          ],
        ),
      ),
    );
  }
}
