import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travel_app/scr/Models/DemoData.dart';
import 'package:travel_app/scr/models/places.dart';

import 'PopularPlaces_card.dart';
class PopularPlacesPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    PageController controller =PageController(viewportFraction: 0.99);

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
                  padding: const EdgeInsets.all(4.0),
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
