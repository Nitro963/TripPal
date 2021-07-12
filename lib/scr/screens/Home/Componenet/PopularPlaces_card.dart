import 'package:flutter/material.dart';
import 'package:travel_app/scr/models/place.dart';
import 'package:travel_app/scr/shared/Widgets/avatars_list.dart';
import 'package:travel_app/scr/shared/Widgets/stars.dart';
import 'package:travel_app/scr/shared/constants.dart';

class PopularPlacesCard extends StatefulWidget {
  final Place place;
  PopularPlacesCard({this.place});
  @override
  _PopularPlacesCardState createState() => _PopularPlacesCardState();
}

class _PopularPlacesCardState extends State<PopularPlacesCard> {
  double rating;
  String place;
  String image;
  String country;
  @override
  void initState() {
    rating = widget.place.rating;
    place = widget.place.name;
    country = widget.place.country;
    image = widget.place.image;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                blurRadius: 3, offset: const Offset(0, 2), color: Colors.grey)
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 150,
            ),
          ),
          Container(
            height: 50,
            child: ListTile(
                title: Row(
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            Text(
                              place,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey[400]),
                            ),
                            SizedBox(width: 14),
                            StarRating(
                              rating: this.rating,
                              color: Colors.amber,
                              onRatingChanged: (rating) =>
                                  setState(() => this.rating = rating),
                            )
                          ]),
                          Text(country,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[600]))
                        ]),
                  ],
                ),
                trailing: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: AvatarsList(),
                )),
          )
        ],
      ),
    );
  }
}

class NewPopularPlacesCard extends StatefulWidget {
  final Place place;
  NewPopularPlacesCard({this.place});
  @override
  _NewPopularPlacesCardState createState() => _NewPopularPlacesCardState();
}

class _NewPopularPlacesCardState extends State<NewPopularPlacesCard> {
  double rating;
  String place;
  String image;
  String country;
  @override
  void initState() {
    rating = widget.place.rating;
    place = widget.place.name;
    country = widget.place.country;
    image = widget.place.image;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
        width: SizeConfig.screenWidth * 1 / 2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
            boxShadow: [
              BoxShadow(
                  blurRadius: 2, offset: const Offset(0, 3), color: Colors.grey)
            ]),
      ),
      Container(
        width: SizeConfig.screenWidth * 1 / 2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          gradient: LinearGradient(
              colors: [Colors.transparent, Colors.black54],
              begin: FractionalOffset(1.0, 0.0),
              end: FractionalOffset(1.0, 1.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  place,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[400]),
                ),
                Text(country,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.white60)),
                SizedBox(height: 8.0),
                StarRating(
                  rating: this.rating,
                  color: Colors.amber,
                  onRatingChanged: (rating) =>
                      setState(() => this.rating = rating),
                )
    ]))]);
  }
}
