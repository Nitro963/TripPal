import "package:flutter/material.dart";
enum TaskCategory { All,Home, Work, Airport, Shopping,Others }
String getCategoryName(TaskCategory cat)=> cat.toString().split(".")[1];

Icon categoryIcon(TaskCategory cat){
  IconData ico;
  Color colors;
  switch(cat)
  {
    case TaskCategory.All:
    {
      ico=Icons.bookmark;
      colors=Colors.lightBlueAccent[400];
      break;
    }
    case TaskCategory.Home:
    {
      ico=Icons.home;
      colors=Colors.lightGreenAccent[200];
      break;

    }
    case TaskCategory.Work:
    {
      ico=Icons.bookmark;
      colors=Colors.amberAccent[200];
      break;

    }
    case TaskCategory.Airport:
    {
      ico=Icons.airplanemode_active;
      colors=Colors.pinkAccent[200];
      break;

    }
    case TaskCategory.Shopping:
    {
      ico=Icons.shopping_cart;
      colors=Colors.cyanAccent[300];
      break;

    }
    case TaskCategory.Others:
    {
      ico=Icons.category;
      colors=Colors.brown[200];
      break;
    }
    defualt:{
      ico=Icons.error;
      colors=Colors.red[700];
      break;
      }


  }
  return Icon(ico,color: colors,size: 30);
}

class Task {
  bool done;
  //DateTime date;
  String title;
  String note;
  TaskCategory category;
  Task({this.title,this.done=false,this.category=TaskCategory.Others,this.note=""});
  
}
class CategoryData
{
   TaskCategory title;
  Icon icon;
  int taskCnt;
  CategoryData({this.title,this.icon,this.taskCnt});
}