import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';
import 'package:trip_pal_null_safe/widgets/simple/blend_shimmer_image.dart';

class TripCard extends StatelessWidget {
  const TripCard(
      {Key? key,
      required this.imgPath,
      required this.tripType,
      required this.location,
      required this.details,
      required this.days,
      this.onTap})
      : super(key: key);
  final String imgPath;
  final String tripType;
  final String location;
  final String details;
  final int days;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.0,
      width: MySize.screenWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.black38,
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: BlendShimmerImage(
              color: Colors.black38,
              blendMode: BlendMode.darken,
              imageUrl: imgPath,
              boxFit: BoxFit.cover,
              width: MySize.screenWidth,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: GestureDetector(
              onTap: onTap,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    tripType,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.locationArrow,
                          color: Colors.white,
                          size: 16.0,
                        ),
                        SizedBox(
                          width: 12.0,
                        ),
                        Expanded(
                          child: Text(
                            location,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 26.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        details,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.solidCalendarAlt,
                            size: 14.0,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 3.0,
                          ),
                          Text(
                            days.toString(),
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
