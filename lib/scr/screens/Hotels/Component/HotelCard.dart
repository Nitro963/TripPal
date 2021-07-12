import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:travel_app/scr/screens/Map/map_page.dart';
import 'package:travel_app/scr/screens/places/components/hotel_class.dart';

import 'package:travel_app/scr/shared/Animation/Heart.dart';
import 'package:travel_app/scr/shared/constants.dart';
import 'package:travel_app/scr/shared/Widgets/stars.dart';

class HotelCard extends StatelessWidget {
  const HotelCard({
    Key key,
    @required this.data,
    @required this.onTap,
  }) : super(key: key);
  final Hotel data;
  final onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 6.0),
        width: SizeConfig.screenWidth,
        height: SizeConfig.blockSizeHorizontal * 50,
        child: Stack(
          children: <Widget>[
            Card(
              elevation: 8,
              child: Row(
                children: <Widget>[
                  Container(
                    height: SizeConfig.blockSizeHorizontal * 55,
                    width: 135.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4),
                            bottomLeft: Radius.circular(4)),
                        image: DecorationImage(
                          image: NetworkImage(data.imgURL),
                          fit: BoxFit.cover,
                        )),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4.9, vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Text(
                            data.name,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 17.0, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8.0),
                          StarRating(
                            starCount: data.starRating.toInt() != 0
                                ? data.starRating.toInt()
                                : 5,
                            rating: data.starRating,
                            isStatic: false,
                            size: 20,
                            color: starsActivationColor,
                            onRatingChanged: (i) {},
                          ),
                          SizedBox(height: 8.0),
                          Row(
                            children: [
                              Container(
                                  width: 28,
                                  height: 18,
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColorDark,
                                      borderRadius: BorderRadius.circular(2)),
                                  child: Center(
                                      child: Text(
                                    data.guestrating.toString(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                    textAlign: TextAlign.center,
                                  ))),
                              SizedBox(
                                width: SizeConfig.blockSizeHorizontal * 3,
                              ),
                              Text(data.stringRaitingExp()),
                            ],
                          ),
                          SizedBox(height: 8.0),
                          CardDetail(
                            title: 'Guests Rating',
                            value: data.guestrating,
                          ),
                          SizedBox(height: 8.0),
                          CardDetail(
                            title: 'Price pre Night',
                            value: data.price,
                          ),
                          SizedBox(height: 8.0),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_rounded,
                                color: Colors.lightBlue[800],
                                size: 16,
                              ),
                              Text(
                                data.address,
                                style: TextStyle(
                                    color: Colors.grey[700],
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
                right: SizeConfig.blockSizeHorizontal * 3,
                top: SizeConfig.blockSizeVertical * 4,
                child: Heart(
                  startingIcon: Icons.favorite_outline,
                  endingIcon: Icons.favorite,
                )),
            Positioned(
              right: SizeConfig.blockSizeHorizontal * 4,
              bottom: SizeConfig.blockSizeVertical * 2,
              child: GestureDetector(
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
                onTap: () => Get.to(MapPage(
                    latitude: data.coordinate.lat,
                    longitude: data.coordinate.lon,
                    placeName: data.name)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CardDetail extends StatelessWidget {
  const CardDetail({Key key, @required this.title, @required this.value})
      : super(key: key);

  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(title,
            style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
                fontWeight: FontWeight.bold)),
        SizedBox(width: 4.0),
        Text(value, style: TextStyle(fontSize: 16, color: Colors.grey[600])),
      ],
    );
  }
}
