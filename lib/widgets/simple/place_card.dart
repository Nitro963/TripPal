import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:trip_pal_null_safe/dialogs/availablity_dialog.dart';
import 'package:trip_pal_null_safe/models/map_place.dart';
import 'package:trip_pal_null_safe/utilities/constants.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';
import 'package:trip_pal_null_safe/widgets/animated/growing_icon.dart';
import 'package:trip_pal_null_safe/widgets/animated/stars.dart';
import 'package:trip_pal_null_safe/widgets/simple/tag.dart';

class PlaceCard extends StatelessWidget {
  const PlaceCard(
      {Key? key, this.onTap, required this.place, required this.activated})
      : super(key: key);
  final MapPlace place;
  final void Function()? onTap;
  final bool activated;

  @override
  Widget build(BuildContext context) {
    List<String> tags = place.properties!.kinds!.split(',');
    return Card(
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
                        place.properties!.name!,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 19.0,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 4.0,
                      ),
                      Container(
                        height: MySize.getScaledSizeHeight(35),
                        child: Row(
                          children: <Widget>[
                            for (String tag
                                in tags.take(tags.length > 3 ? 2 : tags.length))
                              Tag(
                                tag: tag.replaceAll(RegExp(r'_'), ' '),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                GrowingIcon(
                  startingIcon:
                      activated ? Icons.favorite : Icons.favorite_border,
                  endingIcon:
                      activated ? Icons.favorite_border : Icons.favorite,
                  startingColor:
                      activated ? Colors.red[600]! : Colors.grey[200]!,
                  endingColor: activated ? Colors.grey[200]! : Colors.red[600]!,
                  tapCallBack: (value) async {},
                ),
              ],
            ),
            SizedBox(height: MySize.size12),
            Row(
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
                      '${(place.properties!.dist!.round()) / 1000} km from the city center',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14.0),
                    ),
                  ],
                ),
                GestureDetector(
                    child: Row(
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.mapMarkedAlt,
                          size: 15.0,
                        ),
                        SizedBox(width: 6.0),
                        Text('Map', style: Get.theme.textTheme.subtitle2),
                      ],
                    ),
                    onTap: onTap),
              ],
            )
          ],
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

  final MapPlace place;

  @override
  Widget build(BuildContext context) {
    String headLineTag = place.properties!.kinds!
        .split(',')[place.properties!.kinds!.split(',').length - 1]
        .replaceAll(RegExp(r'_'), ' ')
        .capitalizeFirst!;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: Colors.lightBlue[800],
                borderRadius: BorderRadius.circular(3.0),
              ),
              child: Icon(
                FontAwesomeIcons.locationArrow,
                color: Colors.white,
                size: 11.0,
              ),
            ),
            SizedBox(width: 4.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  headLineTag,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
                ),
              ],
            )
          ],
        ),
        Row(
          children: <Widget>[
            StarRating(
              starCount: 5,
              rating: place.properties!.rate!.toDouble() > 5
                  ? 5
                  : place.properties!.rate!.toDouble(),
              isStatic: true,
              size: 15,
              color: starsActivationColor,
              onRatingChanged: (i) {},
            ),
          ],
        ),
        GestureDetector(
          onTap: () => Get.dialog(NotAvailableDialog()),
          child: Row(
            children: <Widget>[
              Text(
                'More Info',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0,
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
