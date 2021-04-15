import 'package:flutter/material.dart';
import 'package:travel_app/scr/models/places.dart';
import 'package:travel_app/scr/shared/Constants/constants.dart';

import 'image_card.dart';

class PlaceCard extends StatelessWidget {
  final Place place;

  PlaceCard({this.place});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return ImageCard(
      place:place,
      radius: 10,
      child: Positioned(
        bottom: SizeConfig.blockSizeVertical* 2,
        child: Container(
          padding: EdgeInsets.only(left:6),
          height: SizeConfig.blockSizeVertical * 2,
          decoration: BoxDecoration(
              color: const Color(0xff24253D).withOpacity(0.46),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5),
                  bottomRight: Radius.circular(5))),
          child: Center(
              child: Text(place.place.split(" ")[0],
                  style: TextStyle(color: Colors.white, fontSize: 12))),
        ),
      ),
    );
  }
}
