import 'package:flutter/material.dart';

import 'image_card.dart';

class PlaceImageCard extends StatelessWidget {
  final String picture;
  final double height;
  final double width;
  final String place;
  final void Function()? onTap;

  PlaceImageCard(
    this.picture,
    this.place,
    this.height,
    this.width, {
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ImageCard(
      picture,
      height: height,
      width: width,
      onTap: onTap,
      borderRadius: 10,
      child: Positioned(
        bottom: height * .15,
        left: 0,
        child: Container(
          //   height: height * 0.25,
          decoration: BoxDecoration(
              color: const Color(0xff24253D).withOpacity(0.46),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5),
                  bottomRight: Radius.circular(5))),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Center(
              child: Text(place,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600)),
            ),
          ),
        ),
      ),
    );
  }
}
