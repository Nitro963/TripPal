import 'package:travel_app/scr/Models/tasks.dart';
import 'package:travel_app/scr/models/place.dart';

import 'Hotel.dart';
import 'blog.dart';

List<Place> demoPlaces = [
  Place(name: "Damascus", country: "syria", image: "images/1.jpg", rating: 0.5),
  Place(name: "Paris", country: "France", image: "images/2.jpg", rating: 4.5),
  Place(name: "New york", country: "USA", image: "images/3.jpg", rating: 5),
  Place(
      name: "Australia",
      country: "Australia",
      image: "images/4.jpg",
      rating: 3.5),
];
List<Blog> blogs = [
  Blog(
      city: "Damascus syria",
      image: "images/1.jpg",
      info: "Nice prices ,good people"),
  Blog(
      city: "Paris France",
      image: "images/2.jpg",
      info: "It has amaizing weather and amizing buildings"),
  Blog(
      city: "NewYork USA",
      image: "images/4.jpg",
      info: "Good place to start a buisness"),
];
List myTasks = [
  Task(title: "a", category: TaskCategory.Home),
  Task(title: "b", category: TaskCategory.Airport),
  Task(title: "c", category: TaskCategory.Airport),
  Task(title: "d", category: TaskCategory.Airport),
  Task(title: "e", category: TaskCategory.Airport),
  Task(title: "f", category: TaskCategory.Shopping),
  Task(title: "g", category: TaskCategory.Shopping),
  Task(title: "h", category: TaskCategory.Others),
];

List<String> rooms = [
  "1 Room - 1 adult . 0 Childrens",
  "1 Room - 2 adult . 0 Childrens",
  "1 Room - 2 adult . 1 or 2 Childrens"
];

List<Hotel> myHotels = [
  Hotel(
      name: "Hotel",
      image: "images/hotel1.jpg",
      raiting: 8.4,
      stars: 5,
      numReviews: 130,
      location: "London UK",
      avalibaleRooms: [Room(price: 200, type: "Royal Room")]),
  Hotel(
      name: "Kattan Hotel",
      image: "images/hotel3.jpg",
      raiting: 2.4,
      stars: 2,
      numReviews: 70,
      location: "Damas",
      avalibaleRooms: [Room(price: 10, type: "Single Room")]),
  Hotel(
      name: "Four Seasons",
      image: "images/hotel3.jpg",
      raiting: 9.1,
      stars: 5,
      numReviews: 200,
      location: "Paris",
      avalibaleRooms: [Room(price: 1000, type: "Double Room")])
];
