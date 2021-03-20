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
        top: SizeConfig.blockSizeHorizontal * 16,
        child: Container(
          height: SizeConfig.blockSizeHorizontal * 6,
          decoration: BoxDecoration(
              color: const Color(0xff24253D).withOpacity(0.46),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5),
                  bottomRight: Radius.circular(5))),
          child: Center(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.0),
            child: Text(place,
                style: TextStyle(color: Colors.white, fontSize: 12)),
          )),
        ),
      ),
    );
  }
}
