import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:trip_pal_null_safe/models/hotel.dart';
import 'package:trip_pal_null_safe/utilities/constants.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';
import 'package:trip_pal_null_safe/widgets/animated/stars.dart';
import 'package:trip_pal_null_safe/widgets/simple/tag.dart';

class DBPlaceCard extends StatelessWidget {
  const DBPlaceCard({Key? key, required this.place}) : super(key: key);
  final Place place;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed('/home/place-details?type=1&place_id=${place.id}');
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(MySize.size8)),
        margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              BasicInfo(place: place),
              SizedBox(height: MySize.size12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          place.name!,
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
                        if (place.properties.isNotEmpty)
                          Row(
                            children: place.properties
                                .take(2)
                                .map((element) => Tag(kind: element.name!))
                                .toList(),
                          ),
                      ],
                    ),
                  ),
                  // GrowingIcon(
                  //   startingIcon:
                  //       activated ? Icons.favorite : Icons.favorite_border,
                  //   endingIcon:
                  //       activated ? Icons.favorite_border : Icons.favorite,
                  //   startingColor:
                  //       activated ? Colors.red[600]! : Colors.grey[200]!,
                  //   endingColor: activated ? Colors.grey[200]! : Colors.red[600]!,
                  //   tapCallBack: (value) async {},
                  // ),
                ],
              ),
              SizedBox(height: MySize.size12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.location_pin,
                        size: 18.0,
                        color: Colors.lightBlue[900],
                      ),
                      Text(
                        '${place.distance!.round()}m from city center',
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
                          ),
                          SizedBox(width: 6.0),
                          Text('Map', style: Get.theme.textTheme.subtitle2),
                        ],
                      ),
                      onTap: () {
                        // TODO show on map
                      }),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BasicInfo extends StatelessWidget {
  const BasicInfo({
    Key? key,
    required this.place,
  }) : super(key: key);

  final Place place;

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
            if (place.properties.isNotEmpty)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    place.properties[0].name!.capitalizeFirst! + ' Place',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
                  ),
                ],
              )
          ],
        ),
        Row(
          children: <Widget>[
            StarRating(
              starCount: 5,
              rating: (place.guestRating ?? 0).toDouble() > 5
                  ? 5
                  : (place.guestRating ?? 0),
              isStatic: true,
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
