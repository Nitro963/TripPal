import 'package:flutter/material.dart';
import 'package:travel_app/scr/models/place.dart';
import 'package:travel_app/scr/shared/Widgets/stars.dart';
import 'package:travel_app/scr/shared/constants.dart';

import 'package:palette_generator/palette_generator.dart';

class PopularPlacesCard extends StatefulWidget {
  final Place place;
  PopularPlacesCard({required this.place});
  @override
  _PopularPlacesCardState createState() => _PopularPlacesCardState();
}

class _PopularPlacesCardState extends State<PopularPlacesCard> {
  late double rating;
  late String place;
  late String image;
  late String country;
  late PaletteColor paletteColor;

  _updatePallettes() async {
    final PaletteGenerator generator = await PaletteGenerator.fromImageProvider(
      AssetImage(image),
      size: Size(300, 100),
    );
    setState(() => this.paletteColor = (generator.darkMutedColor != null
        ? generator.darkMutedColor
        : PaletteColor(Colors.black54, 2))!);
  }

  @override
  void initState() {
    rating = widget.place.rating!;
    place = widget.place.name;
    country = widget.place.country;
    image = widget.place.image!;
    _updatePallettes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
        width: MySize.screenWidth * 1 / 2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
            boxShadow: [
              BoxShadow(
                  blurRadius: 2, offset: const Offset(0, 3), color: Colors.grey)
            ]),
      ),
      Container(
        width: MySize.screenWidth * 1 / 2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          gradient: LinearGradient(
              colors: [Colors.transparent, paletteColor.color],
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
                      color: Colors.white),
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
              ]))
    ]);
  }
}
