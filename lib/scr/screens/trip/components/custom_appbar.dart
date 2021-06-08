
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserTripsAppBar extends StatelessWidget {
  const UserTripsAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
          margin: const EdgeInsets.only(top :16.0 ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Row(
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.angleLeft,
                    color: Colors.black,
                    size: 20,
                  ),
                  Text('back', style: TextStyle(color: Colors.black),)
                ],
              )),
              Text(
                'Trips',
                style: TextStyle(
                  color: Colors.black
                ),
              ),
          TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(
            FontAwesomeIcons.slidersH,
            color: Colors.black,
            size: 20,
          )),
            ],
          )
        );
  }
}
