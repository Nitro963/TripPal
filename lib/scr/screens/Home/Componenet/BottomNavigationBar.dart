import 'package:flutter/material.dart';
class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width:double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 8),
      color: Colors.grey[100],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:[
        NavItem(icon:Icons.home,title:"Home",isActivated:true ),
        NavItem(icon:Icons.flight,title:"Flights",isActivated:false ),
        NavItem(icon:Icons.chat,title:"ChatBot",isActivated:false ),
        NavItem(icon:Icons.hotel,title:"Hotels",isActivated:false ),
        NavItem(icon:Icons.person,title:"Profile",isActivated:false ),
        ]
      ),
    );
  }
}
class NavItem extends StatelessWidget {
 final IconData icon;
 final String title;
 final bool isActivated;
 NavItem({this.icon,this.title,this.isActivated});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child:
        Column(
        children:[
        Icon(icon,color:isActivated ?Theme.of(context).primaryColorDark:Colors.grey[700],size:30),
        Spacer(),
        Text(
          title,
          style: TextStyle(color: isActivated ? Theme.of(context).primaryColorDark:Colors.grey,fontSize: 8.7),
        
        ),
        ]

      ),
    );
  }
}