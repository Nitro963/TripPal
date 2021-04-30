import 'package:flutter/material.dart';

import 'image_card.dart';

class PlaceCard extends StatelessWidget {
  final String picture;
  final double height;
  final double width;
  final String place;

  PlaceCard(
    this.picture,
    this.place,
    this.height,
    this.width,
  );

  @override
  Widget build(BuildContext context) {
    return ImageCard(
      picture,
      height: height,
      width: width,
      borderRadius: 10,
      child: Positioned(
        top: height * .65,
        child: Container(
          height: height * 0.25,
          decoration: BoxDecoration(
              color: const Color(0xff24253D).withOpacity(0.46),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5),
                  bottomRight: Radius.circular(5))),
          child: Center(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(place,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w700)),
          )),
        ),
      ),
    );
  }
}
