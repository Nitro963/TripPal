import 'package:flutter/material.dart';
import 'package:travel_app/scr/shared/constants.dart';

class SavedTripsHeader extends StatelessWidget {
  const SavedTripsHeader({
    Key? key,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Container(
          child: FittedBox(
            fit: BoxFit.fill,
            alignment: Alignment.topCenter,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: kPrimaryFiltersTitleStyle,
                  ),
                  Text(
                    subTitle,
                    style: kSecondaryFiltersTitleStyle,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
