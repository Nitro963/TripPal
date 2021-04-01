import 'package:flutter/material.dart';
import 'package:travel_app/scr/shared/constants.dart';
class ContinentListView extends StatefulWidget {
  @override
  _ContinentListViewState createState() => _ContinentListViewState();
}

class _ContinentListViewState extends State<ContinentListView> {
  int selected_index=-1;
  @override
  Widget build(BuildContext context) {
    return /*Padding(
      padding: const EdgeInsets.all(8.0),
      child:*/ SizedBox(
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
                  //width: 80,
                  height: 6,
                  padding: EdgeInsets.symmetric(horizontal: 18,vertical: 3),
                  decoration: BoxDecoration(borderRadius:BorderRadius.circular(15) ,color:selected_index==index ? Theme.of(context).primaryColorDark:Colors.grey[100]),
                  child: Center(child:Text(continent[index],textAlign:TextAlign.center,style:TextStyle(color:selected_index==index ? Colors.white :Colors.black54 ))),
                ),
                onTap: ()=>setState(()=>selected_index=index),
            ),
          );
        }
           )    // ),
    );
  }
}