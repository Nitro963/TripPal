import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/scr/screens/places/components/place_class.dart';
import 'package:travel_app/scr/shared/Animation/Heart.dart';
import 'package:travel_app/scr/shared/constants.dart';
import 'package:travel_app/scr/shared/widgets/stars.dart';

class PlaceCard extends StatelessWidget {
  const PlaceCard(
      {Key key,
      @required this.primaryColor,
      @required this.secondaryColor,
      @required this.onTap,
      @required this.data})
      : super(key: key);
  final Color primaryColor;
  final Color secondaryColor;
  final Place2 data;
  final onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 150.0,
        margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.blueGrey[100]),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[100],
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
            BasicInfo(primaryColor: primaryColor, data: data),
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
                        data.name,
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
                          if (data.kinds != null)
                            for (String kind in data.kinds.split(',').take(2))
                              Tag(
                                  secondaryColor: secondaryColor,
                                  kind: kind,
                                  primaryColor: primaryColor),
                        ],
                      ),
                    ],
                  ),
                ),
                Heart(
                  startingIcon: Icons.favorite_outline,
                  endingIcon: Icons.favorite,
                  tapCallBack: () {},
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
                        ),
                      ),
                      Text(
                        '${data.distance.round()} m from city center',
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
      ),
    );
  }
}

class BasicInfo extends StatelessWidget {
  const BasicInfo({
    Key key,
    @required this.primaryColor,
    @required this.data,
  }) : super(key: key);

  final Color primaryColor;
  final Place2 data;

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
                color: primaryColor,
                borderRadius: BorderRadius.circular(6.0),
              ),
              child: Icon(
                FontAwesomeIcons.candyCane,
                color: Colors.white,
                size: 15.0,
              ),
            ),
            SizedBox(width: 4.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  data.kinds.split(',')[0],
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
                ),
                Text(
                  'place',
                  style: TextStyle(fontSize: 14.0),
                )
              ],
            )
          ],
        ),
        Row(
          children: <Widget>[
            Text(
              data.guestrating.toString(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
            ),
            SizedBox(width: 4.0),
            StarRating(
              starCount: 5,
              rating: data.guestrating.toDouble(),
              isStatic: false,
              size: 15,
              color: starsActivationColor,
              onRatingChanged: (i) {},
            ),
          ],
        ),
        GestureDetector(
          onTap: (){},
          child: Column(
            children: <Widget>[
              Text(
                'read more',
                style: TextStyle(fontSize: 14.0),
              ),
              Text(
                'Information',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13.0,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class Tag extends StatelessWidget {
  const Tag({
    Key key,
    @required this.secondaryColor,
    @required this.kind,
    @required this.primaryColor,
  }) : super(key: key);

  final Color secondaryColor;
  final String kind;
  final Color primaryColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(4.0),
        margin: EdgeInsets.all(2.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0), color: secondaryColor),
        child: Text(
          kind,
          style: TextStyle(
              color: primaryColor, fontSize: 14.0, fontWeight: FontWeight.bold),
        ));
  }
}
