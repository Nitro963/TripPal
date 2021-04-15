import 'package:flutter/material.dart';
import 'package:travel_app/scr/Models/DemoData.dart';
import 'Component/HotelCard.dart';
import 'Component/UpperNavBar.dart';
import 'package:travel_app/scr/shared/Constants/constants.dart';

class HotelResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {  
    SizeConfig.init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      
        body:  ListView(

             children: [
               UpperNavBar(onTapCallBack: (index){print(index.toString());},),
               ListView.builder(shrinkWrap: true,itemCount: myHotels.length, itemBuilder:(context,index)=> HotelCard(hotel:myHotels[index])),
              ],
            ),
            );
  }
}
