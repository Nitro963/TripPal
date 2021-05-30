import 'package:flutter/material.dart';
import 'package:get/get.dart';
class HomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:ListView(
        children: [
          DrawerHeader(
            child: Text("TripPal",
              style: TextStyle(
                shadows:[Shadow(color: Colors.white30,offset: Offset(1,1),blurRadius: 8)],
                color: Colors.white,fontSize: 24,fontWeight: FontWeight.w700)),
            decoration: BoxDecoration(
              color:Theme.of(context).primaryColor,
              borderRadius: BorderRadius.only(bottomRight:Radius.circular(20))
              ),
          ),
       /*   ListTile(
            leading: Icon(Icons.list,size: 24,color:Colors.grey),
            title:Text("My To Do List"),
            onTap: (){Get.to(CategorizedList());},
          )*/
          DrawerItem(icon: Icon(Icons.list,size: 24,color:Colors.grey),title:"To Do List"),

        ],
      )
      
    );
  }
}
class DrawerItem extends StatelessWidget {
  final Icon icon;
  final String title;
  DrawerItem({this.icon,this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color:Colors.white),
      child: ListTile(
        leading: icon,
        title:Text(title),

      ),
      
    );
  }
}