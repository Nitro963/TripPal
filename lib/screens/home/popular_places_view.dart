import 'package:flutter/material.dart';
import 'package:trip_pal_null_safe/screens/home/popular_place_card.dart';

import '../../dummy_data.dart';

class PopularPlacesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(viewportFraction: 0.99);

    return SizedBox(
      width: double.infinity,
      height: 330.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              flex: 10,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemCount: demoPlaces.length,
                  controller: controller,
                  itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: PopularPlaceCard(place: demoPlaces[index]),
                      ))),
          Spacer(),
        ],
      ),
    );
  }
}
