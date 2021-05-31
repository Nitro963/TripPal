import 'package:flutter/material.dart';

class RoundedWidget extends StatelessWidget {
  final title;
  const RoundedWidget({
    Key key,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flex(
          direction: Axis.vertical,
          children : <Widget>[
            Container(
          margin: EdgeInsets.symmetric(horizontal: 3.0, vertical: 10.0),
          padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
          decoration: BoxDecoration(
            color: Colors.grey.withAlpha(50),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            title ,
            style: TextStyle(
              fontFamily: 'Sta',
              fontSize: 20.2,
              color: Colors.black,
            ),
          )),
          ]
    );
  }
}
