import 'package:flutter/material.dart';
import 'package:trip_pal_null_safe/utilities/constants.dart';

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
      child: Container(
        child: FittedBox(
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: kPrimaryFiltersTitleStyle.copyWith(color: Colors.black),
              ),
              Text(
                subTitle,
                style:
                    kSecondaryFiltersTitleStyle.copyWith(color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
