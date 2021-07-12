import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travel_app/scr/models/DemoData.dart';
import 'PopularPlaces_card.dart';

class PopularPlacesPageView extends StatelessWidget {
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
                        child: NewPopularPlacesCard(place: demoPlaces[index]),
                      ))),
          Expanded(
            flex: 1,
            child: SmoothPageIndicator(
              controller: controller,
              count: demoPlaces.length,
              effect: WormEffect(dotWidth: 18, dotHeight: 4, spacing: 4),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
