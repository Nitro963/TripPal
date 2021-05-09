import 'package:flutter/material.dart';
import 'package:travel_app/scr/models/place.dart';
import 'package:travel_app/scr/screens/Home/Componenet/place_card.dart';

class TopCities extends StatelessWidget {
  final List<Place> demoPlaces = [
    Place(
        name: "Damascus", country: "syria", image: "images/1.jpg", rating: 0.5),
    Place(name: "Paris", country: "France", image: "images/2.jpg", rating: 4.5),
    Place(name: "New York", country: "USA", image: "images/3.jpg", rating: 5),
    Place(
        name: "Australia",
        country: "Australia",
        image: "images/4.jpg",
        rating: 3.5),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 140,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  Text("Top Cities",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      )),
                  SizedBox(width: 8),
                  Container(
                    height: 20,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Theme.of(context).primaryColorDark,
                    ),
                    child: Center(
                        child: Text(
                      "Hot",
                      style: TextStyle(color: Colors.white,fontFamily:'Lato'),
                      textAlign: TextAlign.center,
                    )),
                  )
                ],
              ),
            ),
            Spacer(flex: 1),
            Expanded(
              flex: 12,
              child: SizedBox(
                  height: 100,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: demoPlaces.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: PlaceCard(demoPlaces[index].image,
                              demoPlaces[index].name, 120, 120),
                        );
                      },
                    ),
                  )),
            ),
            Spacer(flex: 2)
          ],
        ));
  }
}
