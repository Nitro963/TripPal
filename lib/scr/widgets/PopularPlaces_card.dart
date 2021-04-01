import 'package:flutter/material.dart';
import 'package:travel_app/scr/models/places.dart';
import 'package:travel_app/scr/shared/constants.dart';


import 'Avatars_List.dart';
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
typedef void RatingChangeCallback(double rating);

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating;
  final RatingChangeCallback onRatingChanged;
  final double size;
  final Color color;

  StarRating({this.starCount = 5, this.size=15,this.rating = .0, this.onRatingChanged, this.color});

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = new Icon(
        Icons.star_border,size: size,
        color: Theme.of(context).buttonColor,
      );
    }
    else if (index > rating - 1 && index < rating) {
      icon = new Icon(
        Icons.star_half,size: size,
        color: color ?? Theme.of(context).primaryColor,
      );
    } else {
      icon = new Icon(
        Icons.star,size: size,
        color: color ?? Theme.of(context).primaryColor,
      );
    }
    return new InkResponse(
      onTap: onRatingChanged == null ? null : () => onRatingChanged(index + 1.0),
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Row(children: new List.generate(starCount, (index) => buildStar(context, index)));
  }
}
