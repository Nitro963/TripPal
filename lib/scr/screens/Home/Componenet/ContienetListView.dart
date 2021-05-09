import 'package:flutter/material.dart';
import 'package:travel_app/scr/shared/Constants/constants.dart';
class ContinentListView extends StatefulWidget {
  @override
  _ContinentListViewState createState() => _ContinentListViewState();
}

class _ContinentListViewState extends State<ContinentListView> {
  int selected_index=-1;
  List<String> continent=["Europe","Asia","Africa", "North America",  "Australia",   "South America","Antarctica"];

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
        height: 45,
      child:ListView.builder(
        itemCount: continent.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context,index)
        {

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                child:Container(
                  height: 6,
                  padding: EdgeInsets.symmetric(horizontal: 18,vertical: 3),
                  decoration: BoxDecoration(borderRadius:BorderRadius.circular(15) ,color:selected_index==index ? Theme.of(context).primaryColorDark:Colors.grey[100]),
                  child: Center(
                    child:Text(continent[index],
                    textAlign:TextAlign.center,
                    style:TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color:selected_index==index ? Colors.white :Colors.black54 ))),
                ),
                onTap: ()=>setState(()=>selected_index=index),
            ),
          );
        }
           )    
    );
  }
}