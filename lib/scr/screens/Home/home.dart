import 'package:flutter/material.dart';

import 'Componenet/BlogListWidget.dart';
import 'Componenet/BottomNavigationBar.dart';
import 'Componenet/ContienetListView.dart';
import 'Componenet/PopularPlacesPageView.dart';
import 'Componenet/TopCitiesWidget.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title:Padding(
          padding: EdgeInsets.only(left: 10.0),
          child:Text("Enjoy Your Life With us !!",style: TextStyle(color: Colors.black54),) ,
        ),
        actions: [
          IconButton(
            icon:Padding(padding: EdgeInsets.only(right:17),child:Icon(Icons.search,size:33,color: Colors.black54,),),
            onPressed: (){},
          )
        ],
        ) ,
      bottomNavigationBar: BottomNavBar(),
      body:SingleChildScrollView(
        child:Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.start ,
            children: [
              ContinentListView(),
              PopularPlacesPageView(),
              TopCities(),
              BlogList(),
            ],
          ),
        )
      )
    );
  }
}