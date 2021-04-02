import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travel_app/scr/models/places.dart';

import 'PopularPlaces_card.dart';
class PopularPlacesPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Place> demoPlaces= [
      Place(place:"Damascus syria",image: "images/1.jpg",days:3,raiting: 0.5),
      Place(place:"Paris France",image: "images/2.jpg",days:3,raiting: 4.5),
      Place(place:"NewYork USA",image: "images/3.jpg",days:3,raiting: 5),
      Place(place:"Australia Australia",image: "images/4.jpg",days:3,raiting: 3.5),

      
    ];
    PageController controller =PageController(viewportFraction: 0.95);

    return SizedBox
    (
      //margin:EdgeInsets.only(left:15),
      width:double.infinity,
     height:256,
      //color: Colors.red,
      child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex:11,
              child:PageView.builder(
            /*    onPageChanged: ()
                {

                },*/
                itemCount: demoPlaces.length,
                controller: controller,
                itemBuilder: (context,index)=>Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: PopularPlacesCard(place:demoPlaces[index]),
                )
                
                )

            ),
//Spacer(flex: 1,),
            
          Expanded(
            flex:1,
                child: SmoothPageIndicator(
                controller: controller,
                count:demoPlaces.length ,
                effect: WormEffect(dotWidth:18,dotHeight: 4,spacing:4 ),
                ),
            ),
              Spacer(),
            
          ],
        ),
      
      
    );
  }
}
