import 'package:flutter/material.dart';
import 'package:overflow_view/overflow_view.dart';
import 'dart:math' as math;
class AvatarsList extends StatelessWidget {
  final Axis direction;
  final double size;
  final List list;
  final double spacing;
  final double width;
  final double height;
  AvatarsList({this.direction=Axis.horizontal,this.size=14,this.spacing=-14.5,this.list,this.width=60,this.height=60});
  
  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: 60,
      height: 60,
      child: OverflowView(
  direction: direction,
  spacing: spacing,
  children: <Widget>[
      for (int i = 0; i < 10; i++)
        CircleAvatar(
          radius: size,
          backgroundColor:Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
        //Make The list of pepole
          //backgroundImage: Image.asset(list[i].image),
          child: Center(child:Text(i.toString())),
      
        )
  ],
 
  builder: (context, remaining) { 
      return CircleAvatar(
          radius: size,
          backgroundColor:Colors.red,
          child:Center(child:Text("+$remaining",style: TextStyle(fontSize:size*0.8),))
       
      );
  },
),
    );
  }
}
