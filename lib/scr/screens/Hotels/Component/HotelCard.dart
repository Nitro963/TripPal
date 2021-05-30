import 'package:flutter/material.dart';
import 'package:travel_app/scr/models/Hotel.dart';
import 'package:travel_app/scr/shared/Animation/Heart.dart';
import 'package:travel_app/scr/shared/Constants/constants.dart';
import 'package:travel_app/scr/shared/Widgets/stars.dart';

class HotelCard extends StatelessWidget {
  final Hotel hotel;
  final onTap;
  HotelCard({this.hotel, @required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: double.infinity,
        height: SizeConfig.blockSizeHorizontal * 55,
        child: Stack(children: [
          Card(
            elevation: 8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4),
                        bottomLeft: Radius.circular(4)),
                    child: Image.asset(hotel.image,
                        width: 150,
                        height: SizeConfig.blockSizeHorizontal * 50,
                        fit: BoxFit.cover)),
                SizedBox(
                  width: SizeConfig.blockSizeHorizontal * 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 7.0),
                  child: Container(
                    // width: ,
                    height: SizeConfig.blockSizeHorizontal * 30,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(hotel.name,
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w600)),
                        Spacer(),
                        StarRating(
                          starCount: hotel.stars,
                          rating: hotel.stars * 1.0,
                          isStatic: true,
                          size: 20,
                          color: starsActivationColor,
                          onRatingChanged: (i) {},
                        ),
                        Spacer(),
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
                                  hotel.raiting.toString(),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                  textAlign: TextAlign.center,
                                ))),
                            SizedBox(
                              width: SizeConfig.blockSizeHorizontal * 3,
                            ),
                            Text(Hotel.stringRaiting(hotel.raiting)),
                          ],
                        ),
                        Spacer(),
                        Text("${hotel.numReviews.toString()} reviews"),
                        Spacer(),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: Colors.grey[700],
                              size: 16,
                            ),
                            Text(
                              hotel.location,
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
                )
              ],
            ),
          ),
          Positioned(
            right: SizeConfig.blockSizeHorizontal * 3,
            top: SizeConfig.blockSizeVertical * 2,
            child:
                // Icon(Icons.favorite_border_outlined, color: deactivatedColor)
                Heart(
              startingIcon: Icons.favorite_outline,
              endingIcon: Icons.favorite,
              tapCallBack: (bool t) {
                if (t)
                  print("${hotel.name} is liked ");
                else
                  print("${hotel.name} is desliked ");
              },
            ),
          ),
          Positioned(
            right: SizeConfig.blockSizeHorizontal * 3,
            bottom: SizeConfig.blockSizeVertical * 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                //replace with a search results
                Text("Price for ${hotel.avalibaleRooms[0].details}",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w500)),
                SizedBox(height: 3),
                Text(
                  hotel.avalibaleRooms[0].type,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                SizedBox(height: 3),
                Text(
                  "${hotel.avalibaleRooms[0].price.toString()}",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
