import 'package:flutter/material.dart';
import "package:travel_app/scr/models/tasks.dart";
import 'package:travel_app/scr/shared/Constants/constants.dart';
class GridCard extends StatefulWidget {
  final CategoryData item;
  final Function onTapCallBack;
  GridCard({this.item,this.onTapCallBack});

  @override
  _GridCardState createState() => _GridCardState();
}

class _GridCardState extends State<GridCard> {
  @override
  Widget build(BuildContext context) {
      String tasks= widget.item.taskCnt < 2 ? "${widget.item.taskCnt} Task" :"${widget.item.taskCnt} Tasks" ;
    return Card(
       shape: shapeborder,
      child: InkWell(
              child: Container(
          
          margin: EdgeInsets.all(15),
          child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          widget.item.icon,
          SizedBox(height: 15,),
          Text(getCategoryName(widget.item.title),style:TextStyle(fontSize: 22,fontWeight: FontWeight.w600)),
          SizedBox(height: 7,),
          Text(tasks,style:TextStyle(fontSize: 12,fontWeight: FontWeight.w300)),


        ],),
    ),
      onTap:widget.onTapCallBack ,
      )
      
      );
  }
}