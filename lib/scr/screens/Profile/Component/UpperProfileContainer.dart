import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:travel_app/scr/shared/constants.dart';

class UpperProfileContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init();
    return Container(
        width: double.infinity,
        height: SizeConfig.blockSizeVertical * 15,
        decoration: BoxDecoration(
            color: Get.theme.primaryColor,//const Color(0xffC7DDFF),
            borderRadius: BorderRadius.only(bottomLeft:Radius.circular(19)),
            boxShadow: [BoxShadow(color: Get.theme.shadowColor.withOpacity(.1),offset:Offset(.5,6),blurRadius: 3 )],
           ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
         
          Padding(
            padding: const EdgeInsets.only(left:16.0),
            child: CircleAvatar(
              radius: 40,
              backgroundImage: Image.asset("images/10.jpg").image,
            ),
          ),
          Text("Adam hadad",style: TextStyle(color:Colors.grey[800],fontSize:26,fontWeight: FontWeight.w600),),

        
          Padding(
            padding: const EdgeInsets.only(right:16.0),
            child: GestureDetector(
              //TODO: implement on Tap function
              onTap: (){},
              child: Icon(Icons.settings,color:Color(0xffFF6347),size:36),
            ),
          )
          
        ]));
  }
}
