import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";
import "package:travel_app/scr/models/tasks.dart";
import 'package:travel_app/scr/shared/constants.dart';
import "package:get/get.dart";
import "package:travel_app/scr/Controlers/toDoListControler.dart";

import '../models/tasks.dart';
import '../models/tasks.dart';

  class CategoryBottomSheet  extends StatelessWidget {
    final GlobalKey<FormState> _key=GlobalKey<FormState>();
    final controler =Get.put(ToDoListControler());
    
  Widget _build (TaskCategory cat ,onTapCallBack)
    {
      return InkWell(
            child: Card
        (
          shape:shapeborder ,
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              categoryIcon(cat),
              SizedBox(height: 15,),
              Text(getCategoryName(cat),style:TextStyle(fontSize: 24,fontWeight: FontWeight.w500,color:Colors.grey[400] ) ),
              ],
              ),
          ),

        ),
        onTap:onTapCallBack,
      );

    }

    @override
    Widget build(BuildContext context) {
      List<Widget> _cards =[];
      TaskCategory.values.forEach((element) {
        if(element != TaskCategory.All)
          _cards.add(_build(element,()=>Navigator.pop(context,getCategoryName(element))));
       });
      return Form(
        key: _key,
      child:  GridView.count(children: _cards,crossAxisCount: 3,));
    }
  }