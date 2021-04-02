import 'package:flutter/material.dart';
import 'package:travel_app/scr/models/places.dart';
import 'package:travel_app/scr/screens/Home/Componenet/place_card.dart';
class TopCities extends StatelessWidget {
  List<Place> demoPlaces= [
      Place(place:"Damascus syria",image: "images/1.jpg",days:3,raiting: 0.5),
      Place(place:"Paris France",image: "images/2.jpg",days:3,raiting: 4.5),
      Place(place:"NewYork USA",image: "images/3.jpg",days:3,raiting: 5),
      Place(place:"Australia Australia",image: "images/4.jpg",days:3,raiting: 3.5),

      
    ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 3,
              child: Row(
              children: [
                Text("Top Cities",style: TextStyle(fontSize: 20 ,fontWeight:FontWeight.w700,)),
                SizedBox(width:8),
                Container(
                  height:20,width: 40,
                  decoration: BoxDecoration(borderRadius:BorderRadius.circular(3),
                                  color:Theme.of(context).primaryColorDark,
 ),
                  child: Center(child: Text("Hot",style: TextStyle(color: Colors.white),textAlign: TextAlign.center,)),
                )
              ],
            ),
          ),
         Spacer(flex:1),
         
        Expanded(
              flex:12,
              child: SizedBox(
              height: 100,
               child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount:demoPlaces.length ,
                itemBuilder: (context,index)
                {
                  return Padding(
                    padding: const EdgeInsets.only(right:8.0),
                    child: PlaceCard(place:demoPlaces[index]),
                  );
                },
            ),
              )),
          ),
          Spacer(flex:2)
        ],
      ) 

    );
  }
}
