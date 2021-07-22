import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:trip_pal_null_safe/models/place2.dart';
import 'package:trip_pal_null_safe/utilities/constants.dart';
import 'package:trip_pal_null_safe/widgets/animated/growing_icon.dart';
import 'package:trip_pal_null_safe/widgets/animated/stars.dart';
import 'package:trip_pal_null_safe/widgets/simple/tag.dart';

class PlaceCard extends StatelessWidget {
  const PlaceCard(
      {Key? key, this.onTap, required this.place, required this.activated})
      : super(key: key);
  final Place2 place;
  final void Function()? onTap;
  final bool activated;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.0,
      margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Get.theme.cardColor,
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(color: Colors.grey[200]!),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[100]!,
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(1, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          BasicInfo(place: place),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      place.name,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 19.0,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Row(
                      children: <Widget>[
                        if (place.kinds != null)
                          for (String kind in place.kinds!.split(' ').take(2))
                            Tag(
                              kind: kind,
                            ),
                      ],
                    ),
                  ],
                ),
              ),
              GrowingIcon(
                startingIcon:
                    activated ? Icons.favorite : Icons.favorite_border,
                endingIcon: activated ? Icons.favorite_border : Icons.favorite,
                startingColor: activated ? Colors.red[600]! : Colors.grey[200]!,
                endingColor: activated ? Colors.grey[200]! : Colors.red[600]!,
              ),
            ],
          ),
          SizedBox(
            height: 8.0,
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {}, //go to map
                      child: Icon(
                        Icons.location_pin,
                        size: 18.0,
                        color: Colors.lightBlue[900],
                      ),
                    ),
                    Text(
                      '${place.distance.round()}m from city center',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14.0),
                    ),
                  ],
                ),
                GestureDetector(
                    child: Row(
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.solidMap,
                          size: 15.0,
                          color: Colors.blueGrey[700],
                        ),
                        SizedBox(width: 6.0),
                        Text(
                          'Map',
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey[600]),
                        ),
                      ],
                    ),
                    onTap: onTap),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class BasicInfo extends StatelessWidget {
  const BasicInfo({
    Key? key,
    required this.place,
  }) : super(key: key);

  final Place2 place;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                color: Colors.lightBlue[800],
                borderRadius: BorderRadius.circular(3.0),
              ),
              child: Icon(
                FontAwesomeIcons.locationArrow,
                color: Colors.white,
                size: 13.0,
              ),
            ),
            SizedBox(width: 4.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  place.kinds!.split(' ')[0].capitalizeFirst! + ' Place',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
                ),
              ],
            )
          ],
        ),
        Row(
          children: <Widget>[
            Text(
              place.guestRating.toDouble() > 5
                  ? '5'
                  : place.guestRating.toString(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
            ),
            SizedBox(width: 4.0),
            StarRating(
              starCount: 5,
              rating: place.guestRating.toDouble() > 5
                  ? 5
                  : place.guestRating.toDouble(),
              isStatic: false,
              size: 15,
              color: starsActivationColor,
              onRatingChanged: (i) {},
            ),
          ],
        ),
        GestureDetector(
          onTap: () {},
          child: Row(
            children: <Widget>[
              Text(
                'More Info',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 10.0,
                color: Colors.blueGrey[700],
              ),
            ],
          ),
        )
      ],
    );
  }
}
