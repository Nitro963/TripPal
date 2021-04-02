
import 'package:travel_app/scr/Models/places.dart';
import 'package:travel_app/scr/Models/tasks.dart';

import 'blog.dart';

List<Place> demoPlaces= [
      Place(place:"Damascus syria",image: "images/1.jpg",days:3,raiting: 0.5),
      Place(place:"Paris France",image: "images/2.jpg",days:3,raiting: 4.5),
      Place(place:"NewYork USA",image: "images/3.jpg",days:3,raiting: 5),
      Place(place:"Australia Australia",image: "images/4.jpg",days:3,raiting: 3.5),

      
    ];
List<Blog> blogs =[
    Blog(city: "Damascus syria",image:"images/1.jpg",info: "afdglgunw rwrg jgw;g jwgl rjwgw" ),
    Blog(city: "Paris France",image:"images/2.jpg",info: "afdglgunw rwrg jgw;g jwgl rjwgw" ),
    Blog(city: "NewYork syria",image:"images/4.jpg",info: "afdglgunw rwrg jgw;g jwgl rjwgw" ),

  ];
  List myTasks=[Task(title:"a",category: TaskCategory.Home),
      Task(title:"b",category: TaskCategory.Airport),
      Task(title:"c",category: TaskCategory.Airport),
      Task(title:"d",category: TaskCategory.Airport),
      Task(title:"e",category: TaskCategory.Airport),
      Task(title:"f",category: TaskCategory.Shopping),
      Task(title:"g",category: TaskCategory.Shopping),
      Task(title:"h",category: TaskCategory.Others),];