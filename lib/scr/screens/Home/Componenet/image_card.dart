import 'package:flutter/material.dart';
import 'package:travel_app/scr/models/places.dart';
import 'package:travel_app/scr/screens/Home/details.dart';
import 'package:travel_app/scr/shared/Constants/constants.dart';

class ImageCard extends StatelessWidget {
  final double width;
  final double radius;
  final Widget child;
  final Place place;

  // ImageCard(
  //     {@required this.name,
  //     @required this.days,
  //     @required this.picture,
  //     this.place});

  ImageCard( {this.child,this.place,this.width=120, this.radius = 20});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Material(
      borderRadius: BorderRadius.circular(radius),
      elevation: 8,
      child: InkWell(
        onTap: () {
          print('expand image card');
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (_) => Details(place)));
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: Stack(
            children: [
              Image.asset(
                place.image,
                height: double.infinity,
                width: width,
                fit: BoxFit.cover,
              ),
              child != null ? child : Material(),
            ],
          ),
        ),
      ),
    );
  }
}
