import 'package:flutter/material.dart';
import 'package:travel_app/scr/models/places.dart';
import 'package:travel_app/scr/shared/constants.dart';

import 'image_card.dart';

class PlaceCard extends StatelessWidget {
  final String picture;
  final double width;
  final String place;

  PlaceCard(this.picture, this.width, this.place);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return ImageCard(
      picture,
      width,
      radius: 10,
      child: Positioned(
        top: SizeConfig.blockSizeHorizontal * 12,
        child: Container(
          width: SizeConfig.blockSizeHorizontal * 14,
          height: SizeConfig.blockSizeHorizontal * 5,
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.6),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5),
                  bottomRight: Radius.circular(5))),
          child: Center(
              child: Text(place,
                  style: TextStyle(color: Colors.white, fontSize: 12))),
        ),
      ),
    );
  }
}
