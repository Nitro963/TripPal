import 'package:flutter/material.dart';
import 'package:travel_app/scr/shared/Widgets/stars.dart';
import 'package:travel_app/scr/shared/constants.dart';

Color firstWidgetColor = Color(0xff41ae73);
Color secondWidgetColor = Color(0xff6c5996);

class HistorySection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init();

    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("Reviews By You",
              style: TextStyle(
                  color: Color(0xff898E8A),
                  fontSize: 26,
                  fontWeight: FontWeight.w700)),
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: SizedBox(
              height: SizeConfig.blockSizeVertical * 20,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ReviewsHistoryCard(
                    color: firstWidgetColor,
                  ),
                  SizedBox(width: SizeConfig.blockSizeHorizontal * 10),
                  ReviewsHistoryCard(
                    color: secondWidgetColor,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: Text("Rated By You",
                style: TextStyle(
                    color: Color(0xff898E8A),
                    fontSize: 26,
                    fontWeight: FontWeight.w700)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: SizedBox(
              height: SizeConfig.blockSizeHorizontal * 45,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ReatiedByYouWidget(),
                  SizedBox(width: SizeConfig.blockSizeHorizontal * 10),
                  ReatiedByYouWidget()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ReatiedByYouWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
          height: SizeConfig.blockSizeHorizontal * 45,
          width: SizeConfig.blockSizeHorizontal * 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset("images/hotel3.jpg", fit: BoxFit.cover))),
      Positioned(
          bottom: SizeConfig.blockSizeHorizontal * 15,
          left: 0,
          child: Container(
            width: SizeConfig.blockSizeHorizontal * 35,
            height: SizeConfig.blockSizeVertical * 5,
            decoration:
                BoxDecoration(color: Color(0xff786969).withOpacity(.64)),
            child: Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Center(
                  child: Text(
                "Four Seasons",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              )),
            ),
          )),
      Positioned(
        bottom: 10,
        left: SizeConfig.blockSizeHorizontal * 3,
        child: StarRating(
          isStatic: true,
          rating: 3,
          size: 35,
        ),
      )
    ]);
  }
}

class ReviewsHistoryCard extends StatelessWidget {
  final Color color;
  final String hotelName;
  final String review;
  ReviewsHistoryCard({this.color, this.hotelName, this.review});
  @override
  Widget build(BuildContext context) {
    SizeConfig.init();
    return Container(
      width: SizeConfig.blockSizeHorizontal * 50,
      height: 10,
      decoration: BoxDecoration(
          color: color.withOpacity(.48),
          borderRadius: BorderRadius.circular(14)),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
              top: SizeConfig.blockSizeVertical * 3,
              left: SizeConfig.blockSizeHorizontal * 4,
              child: SizedBox(
                width: SizeConfig.blockSizeHorizontal * 42,
                height: SizeConfig.blockSizeHorizontal * 12,
                child: Row(
                  children: [
                    Container(
                      width: SizeConfig.blockSizeHorizontal * 12,
                      height: SizeConfig.blockSizeHorizontal * 12,
                      decoration: BoxDecoration(
                          color: color, borderRadius: BorderRadius.circular(6)),
                      child: Center(
                        child:
                            Icon(Icons.hotel, size: 34, color: Colors.red[400]),
                      ),
                    ),
                    Spacer(),
                    Text("Hotel Name",
                        style: TextStyle(
                            color: Color(0xff898E8A),
                            fontSize: 18,
                            fontWeight: FontWeight.w700)),
                  ],
                ),
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 12, 12, 20),
              child: Text("\"This is a bad Hotel\" "),
            ),
          ),
          Positioned(
            bottom: SizeConfig.blockSizeVertical * 3,
            right: SizeConfig.blockSizeHorizontal * -5,
            child: CircleAvatar(
                backgroundColor: color,
                child: Center(
                    child: Icon(
                  Icons.arrow_right_alt,
                  color: Colors.white,
                  size: 40,
                ))),
          )
        ],
      ),
    );
  }
}
