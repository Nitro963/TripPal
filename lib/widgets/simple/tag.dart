import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Tag extends StatelessWidget {
  const Tag({
    Key? key,
    required this.kind,
  }) : super(key: key);
  final String kind;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(4.0),
        margin: EdgeInsets.all(2.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2.0),
            color: Colors.lightBlue[50]),
        child: Text(
          kind.capitalizeFirst!,
          style: TextStyle(
              color: Colors.lightBlue[400],
              fontSize: 14.0,
              fontWeight: FontWeight.bold),
        ));
  }
}
