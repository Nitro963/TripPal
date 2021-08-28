import 'package:trip_pal_null_safe/models/tasks.dart';
import 'package:trip_pal_null_safe/models/activities.dart';
import 'package:trip_pal_null_safe/models/place.dart';
import 'package:trip_pal_null_safe/models/trip.dart';
import 'package:trip_pal_null_safe/models/day.dart';

import 'models/user.dart';

List<Place> demoPlaces = [
  Place(
      name: "Damascus",
      country: "syria",
      image: "assets/images/1.jpg",
      rating: 0.5),
  Place(
      name: "Paris",
      country: "France",
      image: "assets/images/2.jpg",
      rating: 4.5),
  Place(
      name: "New york",
      country: "USA",
      image: "assets/images/3.jpg",
      rating: 5),
  Place(
      name: "Australia",
      country: "Australia",
      image: "assets/images/4.jpg",
      rating: 3.5),
];
List<Task> myTasks = [
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
User user = User(
    id: 1,
    firstName: "user",
    lastName: 'user',
    email: "test@gmail.com",
    password: "",
    profilePicture: "/assets/imagees/1.jpg",
    gender: "M");

List<String> dummyCities = [
  'Bangkok',
  'Paris',
  'London',
  'Dubai',
  'Milan',
  'Singapore',
  'Kuala Lumpur',
  'New York',
  'Istanbul',
  'Tokyo',
  'Antalya',
  'Seoul',
  'Osaka',
  'Makkah',
  'Phuket',
  'Pataya',
  'Barcelona',
  'Palma De Mallorca',
  'Bali',
  'Hong Kong',
];
