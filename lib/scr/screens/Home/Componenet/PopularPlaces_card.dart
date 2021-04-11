import 'package:flutter/material.dart';
import 'package:travel_app/scr/Models/places.dart';
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
  double rating ;
  String place;
  String image;
  String country;
  @override
  void initState(){
    rating=widget.place.raiting;
    place=widget.place.place.split(" ")[0];
    country=widget.place.place.split(" ")[1];
    image=widget.place.image;
    super.initState();
    }
  @override
  Widget build(BuildContext context) {
    return Container
    (
      margin: EdgeInsets.only(right: 30),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
      color: Colors.white,
      boxShadow:  [ 
        BoxShadow(blurRadius: 3, offset: const Offset(0, 2), color: Colors.grey )
      ]
      ),


     // padding:EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(image,fit:BoxFit.cover,width: double.infinity,height: 150,),
          ),
            Container(
              height: 50,
              child: ListTile(
                title:Row(
                  
                  children: [
                    Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                    Row(children:[ Text(place),
                     SizedBox(width:14),
                    StarRating(rating:this.rating,color: Colors.amber,onRatingChanged: (rating)=>setState(()=>this.rating=rating),)
                  ]),
                      Text(country,style:TextStyle(fontSize:10))
                      ]
                    ),
                   ],
                ),
                trailing:    Padding(
                  padding: const EdgeInsets.only(top:8.0),
                  child: AvatarsList(),
                )

                ),
            )
        ],
      ),
      
    );
  }
}

