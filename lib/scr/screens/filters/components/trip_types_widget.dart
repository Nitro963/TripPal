
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'rounded_gesture_widget.dart';

class TripTypeRow extends StatelessWidget {
  const TripTypeRow({
    Key key,
    @required RxBool exSelected,
    @required RxBool fuSelected,
  }) : _exSelected = exSelected, _fuSelected = fuSelected, super(key: key);

  final RxBool _exSelected;
  final RxBool _fuSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 30.0, vertical: 20.0),
      child: Text(
        'Trip Mode',
        textAlign: TextAlign.left,
        style: TextStyle(
            fontSize: 16,
            fontFamily: 'Lato',
            fontWeight: FontWeight.bold),
      ),
    ),
    Container(
      padding: EdgeInsets.symmetric(horizontal: 2.0),
      height: 50.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RoundedGestWidget(
            title: 'Extended Trip',
            onTap: () {
              _exSelected.toggle();
            },
            selected: _exSelected,
          ),
          RoundedGestWidget(
            title: 'Focused Trip',
            onTap: () {
              _fuSelected.toggle();
            },
            selected: _fuSelected,
          )
        ],
      ),
    ),
      ],
    );
  }
}
