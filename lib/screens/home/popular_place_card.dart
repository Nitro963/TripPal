import 'package:flutter/material.dart';

import 'package:trip_pal_null_safe/models/place.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';
import 'package:trip_pal_null_safe/widgets/animated/stars.dart';
import 'package:trip_pal_null_safe/widgets/simple/image_dominant_color_cover.dart';

class PopularPlaceCard extends StatelessWidget {
  final Place place;
  PopularPlaceCard({required this.place});

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
        width: MySize.screenWidth * 1 / 2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            image: DecorationImage(
                image: AssetImage(place.image!), fit: BoxFit.cover),
            boxShadow: [
              BoxShadow(
                  blurRadius: 2, offset: const Offset(0, 3), color: Colors.grey)
            ]),
      ),
      ImageDominantColorCover(
        provider: AssetImage(place.image!),
        borderRadius: BorderRadius.circular(14),
      ),
      Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              place.name,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
            Text(place.country,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.white60)),
            SizedBox(height: 8.0),
            StarRating(
              rating: place.rating!,
              color: Colors.amber,
              isStatic: true,
            ),
          ],
        ),
      )
    ]);
  }
}
