import 'package:flutter/material.dart';
import 'package:travel_app/scr/models/place.dart';
import 'package:travel_app/scr/shared/Widgets/Avatars_List.dart';
import 'package:travel_app/scr/shared/Constants/constants.dart';
import 'package:travel_app/scr/shared/Widgets/stars.dart';

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
      margin: EdgeInsets.only(right: 30),
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
                            Text(place,
                            style: TextStyle(fontSize: 20,fontWeight:FontWeight.w600,color: Colors.grey[400]),),
                            SizedBox(width: 14),
                            StarRating(
                              rating: this.rating,
                              color: Colors.amber,
                              onRatingChanged: (rating) =>
                                  setState(() => this.rating = rating),
                            )
                          ]),
                          Text(country, style: TextStyle(fontSize: 15,fontWeight:FontWeight.w500,color: Colors.grey[600]))
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
