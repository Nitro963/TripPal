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
// List<Blog> blogs = [
//   Blog(
//       city: "Damascus syria",
//       image: "assets/images/1.jpg",
//       info: "Nice prices ,good people"),
//   Blog(
//       city: "Paris France",
//       image: "assets/images/2.jpg",
//       info: "It has amaizing weather and amizing buildings"),
//   Blog(
//       city: "NewYork USA",
//       image: "assets/images/4.jpg",
//       info: "Good place to start a buisness"),
// ];
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
User user= User(
  id: 1,
  firstName:"user",
  lastName: 'user',
  email: "test@gmail.com",
  password: "",
  profilePicture: "/assets/imagees/1.jpg",
  gender: "M"
);
List<Trip> dummyTrips = [
  Trip(
    user:user,
    days:[10],
    startDate: DateTime.now(),
  )
];
/*
List<Trip> dummyTrips = [
  Trip(
      city: 'Dubai',
      country: 'UAE',
      details: 'Foods, malls & shops included',
      type: 'Extended Trip',
      days: days
      ),
  Trip(
      city: 'Milan',
      country: 'Italy',
      details: 'Malls included',
      type: 'Focused Trip',
      days: days),
  Trip(
      city: 'Ankara',
      country: 'Turkey',
      details: 'Foods & Shops included',
      type: 'Focused Trip',
      days: days),
  Trip(
      city: 'Barcelona',
      country: 'Spain',
      details: 'Foods included',
      type: 'Extended Trip',
      days: days),
  Trip(
      city: 'Dubai',
      country: 'UAE',
      details: 'Foods, malls & shops included',
      type: 'Extended Trip',
      days: days),
  Trip(
      city: 'Milan',
      country: 'Italy',
      details: 'Malls included',
      type: 'Focused Trip',
      days: days),
  Trip(
      city: 'Ankara',
      country: 'Turkey',
      details: 'Foods & Shops included',
      type: 'Focused Trip',
      days: days),
  Trip(
      city: 'Barcelona',
      country: 'Spain',
      details: 'Foods included',
      type: 'Extended Trip',
      days: days),
  Trip(
      city: 'Dubai',
      country: 'UAE',
      details: 'Foods, malls & shops included',
      type: 'Extended Trip',
      days: days),
  Trip(
      city: 'Milan',
      country: 'Italy',
      details: 'Malls included',
      type: 'Focused Trip',
      days: days),
  Trip(
      city: 'Ankara',
      country: 'Turkey',
      details: 'Foods & Shops included',
      type: 'Focused Trip',
      days: days),
  Trip(
      city: 'Barcelona',
      country: 'Spain',
      details: 'Foods included',
      type: 'Extended Trip',
      days: days),
  Trip(
      city: 'Dubai',
      country: 'UAE',
      details: 'Foods, malls & shops included',
      type: 'Extended Trip',
      days: days),
  Trip(
      city: 'Milan',
      country: 'Italy',
      details: 'Malls included',
      type: 'Focused Trip',
      days: days),
  Trip(
      city: 'Dubai',
      country: 'UAE',
      details: 'Foods, malls & shops included',
      type: 'Extended Trip',
      days: days),
  Trip(
      city: 'Milan',
      country: 'Italy',
      details: 'Malls included',
      type: 'Focused Trip',
      days: days),
  Trip(
      city: 'Ankara',
      country: 'Turkey',
      details: 'Foods & Shops included',
      type: 'Focused Trip',
      days: days),
  Trip(
      city: 'Barcelona',
      country: 'Spain',
      details: 'Foods included',
      type: 'Extended Trip',
      days: days),
  Trip(
      city: 'Dubai',
      country: 'UAE',
      details: 'Foods, malls & shops included',
      type: 'Extended Trip',
      days: days),
  Trip(
      city: 'Milan',
      country: 'Italy',
      details: 'Malls included',
      type: 'Focused Trip',
      days: days),
];*/

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
Activity activity =Activity(
  trip: 10,
  day:20,
  place:30
);
List<Day> days =[
  Day(dayIndex: 1,
  tripIndex: 10,
  activities: [activity]
  ),
];
/*
List<Day> days = [
  Day(dayIndex: 1, date: DateTime.now(), activates: [
    Activity(
        time: DateTime.now().subtract(Duration(hours: 2)),
        activity: "Leave Home",
        details: "use uber"),
    Activity(
        time: DateTime.now().subtract(Duration(hours: 1)),
        activity: "Shopping",
        details: "Go to talis"),
    Activity(time: DateTime.now(), activity: "Eat Food", details: "Burger"),
    Activity(
        time: DateTime.now().add(Duration(hours: 1)),
        activity: "Fuck adnan",
        details: "use your dick"),
    Activity(
        time: DateTime.now().subtract(Duration(hours: 1)),
        activity: "Shopping",
        details: "Go to talis"),
    Activity(time: DateTime.now(), activity: "Eat Food", details: "Burger"),
    Activity(
        time: DateTime.now().add(Duration(hours: 1)),
        activity: "Fuck adnan",
        details: "use your dick"),
  ]),
  Day(dayIndex: 2, date: DateTime.now().add(Duration(hours: 24)), activates: [
    Activity(
        time: DateTime.now().subtract(Duration(hours: 2)),
        activity: "Leave Home",
        details: "use uber"),
    Activity(time: DateTime.now(), activity: "Day 2", details: "Go to talis"),
    Activity(
        time: DateTime.now().add(Duration(minutes: 1)),
        activity: "Eat Food",
        details: "Burger"),
    Activity(
        time: DateTime.now().add(Duration(minutes: 5)),
        activity: "Fuck adnan",
        details: "use your dick"),
  ]),
];
*/
final londonTrip = {
  "days": [
    {
      "idx": 0,
      "items": [
        {
          "coordinate": {"lat": 51.529412, "lon": -0.125847},
          "item_id": 360456,
          "item_type": "hotel",
          "name": "St. Pancras Renaissance Hotel London",
          "rate": "8.6"
        },
        {
          "coordinate": {"lat": 51.530228, "lon": -0.12801},
          "item_id": "N1980151259",
          "item_type": "food",
          "name": "British Library restaurant",
          "rate": 7
        },
        {
          "coordinate": {"lat": 51.53537, "lon": -0.130883},
          "item_id": "N544223148",
          "item_type": "historic",
          "name": "Burdett-Coutts Memorial Sundial",
          "rate": 7
        },
        {
          "coordinate": {"lat": 51.556442, "lon": -0.151267},
          "item_id": "W29231803",
          "item_type": "sport",
          "name": "Parliament Hill Lido",
          "rate": 7
        },
        {
          "coordinate": {"lat": 51.534748, "lon": -0.138165},
          "item_id": "W225465155",
          "item_type": "food",
          "name": "Koko",
          "rate": 7
        },
        {
          "coordinate": {"lat": 51.540443, "lon": -0.140816},
          "item_id": "W143369836",
          "item_type": "shop",
          "name": "Sainsbury's",
          "rate": 7
        },
        {
          "coordinate": {"lat": 51.530228, "lon": -0.12801},
          "item_id": "N1980151259",
          "item_type": "architecture",
          "name": "British Library restaurant",
          "rate": 7
        },
        {
          "coordinate": {"lat": 51.528236, "lon": -0.128996},
          "item_id": "W132319674",
          "item_type": "food",
          "name": "The Rocket",
          "rate": 7
        }
      ]
    },
    {
      "idx": 1,
      "items": [
        {
          "coordinate": {"lat": 51.532394, "lon": -0.125386},
          "item_id": "W46821178",
          "item_type": "food",
          "name": "German Gymnasium",
          "rate": 7
        },
        {
          "coordinate": {"lat": 51.529598, "lon": -0.128129},
          "item_id": "N2617232245",
          "item_type": "cultural",
          "name": "British Library Exhibition Space",
          "rate": 7
        },
        {
          "coordinate": {"lat": 51.527451, "lon": -0.128528},
          "item_id": "W513152399",
          "item_type": "cultural",
          "name": "The Place",
          "rate": 7
        },
        {
          "coordinate": {"lat": 51.527199, "lon": -0.1326},
          "item_id": "Q23988281",
          "item_type": "cultural",
          "name": "London and North Western Railway War Memorial",
          "rate": 7
        },
        {
          "coordinate": {"lat": 51.526886, "lon": -0.137008},
          "item_id": "W337127150",
          "item_type": "food",
          "name": "Crown & Anchor",
          "rate": 7
        },
        {
          "coordinate": {"lat": 51.527199, "lon": -0.1326},
          "item_id": "Q23988281",
          "item_type": "historic",
          "name": "London and North Western Railway War Memorial",
          "rate": 7
        },
        {
          "coordinate": {"lat": 51.525036, "lon": -0.129},
          "item_id": "W306452420",
          "item_type": "cultural",
          "name": "Mahatma Gandhi",
          "rate": 7
        },
        {
          "coordinate": {"lat": 51.523045, "lon": -0.119031},
          "item_id": "W112564610",
          "item_type": "food",
          "name": "The Lamb",
          "rate": 7
        }
      ]
    },
    {
      "idx": 2,
      "items": [
        {
          "coordinate": {"lat": 51.522205, "lon": -0.11887},
          "item_id": "W158564484",
          "item_type": "food",
          "name": "The Perseverance",
          "rate": 7
        },
        {
          "coordinate": {"lat": 51.523998, "lon": -0.124},
          "item_id": "Q4979489",
          "item_type": "historic",
          "name": "Brunswick Centre",
          "rate": 7
        },
        {
          "coordinate": {"lat": 51.523998, "lon": -0.124},
          "item_id": "Q4979489",
          "item_type": "shop",
          "name": "Brunswick Centre",
          "rate": 7
        },
        {
          "coordinate": {"lat": 51.525196, "lon": -0.121694},
          "item_id": "W28269975",
          "item_type": "cultural",
          "name": "Foundling Museum",
          "rate": 7
        },
        {
          "coordinate": {"lat": 51.531086, "lon": -0.120813},
          "item_id": "Q17361846",
          "item_type": "food",
          "name": "Flying Scotsman",
          "rate": 7
        },
        {
          "coordinate": {"lat": 51.528999, "lon": -0.1255},
          "item_id": "Q5025822",
          "item_type": "architecture",
          "name": "Camden Town Hall",
          "rate": 7
        },
        {
          "coordinate": {"lat": 51.528236, "lon": -0.128996},
          "item_id": "W132319674",
          "item_type": "architecture",
          "name": "The Rocket",
          "rate": 7
        },
        {
          "coordinate": {"lat": 51.528084, "lon": -0.138928},
          "item_id": "Q18344592",
          "item_type": "food",
          "name": "Prince of Wales, Euston",
          "rate": 7
        }
      ]
    },
    {
      "idx": 3,
      "items": [
        {
          "coordinate": {"lat": 51.528801, "lon": -0.129},
          "item_id": "Q7107545",
          "item_type": "architecture",
          "name": "Ossulston Estate",
          "rate": 7
        },
        {
          "coordinate": {"lat": 51.529877, "lon": -0.12772},
          "item_id": "W4680891",
          "item_type": "architecture",
          "name": "British Library",
          "rate": 7
        },
        {
          "coordinate": {"lat": 51.532394, "lon": -0.125386},
          "item_id": "W46821178",
          "item_type": "architecture",
          "name": "German Gymnasium",
          "rate": 7
        },
        {
          "coordinate": {"lat": 51.5186, "lon": -0.1034},
          "item_id": "Q18161799",
          "item_type": "shop",
          "name": "Smithfield Poultry Market",
          "rate": 7
        },
        {
          "coordinate": {"lat": 51.526623, "lon": -0.131859},
          "item_id": "W4253511",
          "item_type": "cultural",
          "name": "Friends House Garden",
          "rate": 7
        }
      ]
    },
    {
      "idx": 4,
      "items": [
        {
          "coordinate": {"lat": 51.523998, "lon": -0.124},
          "item_id": "Q4979489",
          "item_type": "shop",
          "name": "Brunswick Centre",
          "rate": 7
        },
        {
          "coordinate": {"lat": 51.540443, "lon": -0.140816},
          "item_id": "W143369836",
          "item_type": "shop",
          "name": "Sainsbury's",
          "rate": 7
        },
        {
          "coordinate": {"lat": 51.5186, "lon": -0.1034},
          "item_id": "Q18161799",
          "item_type": "shop",
          "name": "Smithfield Poultry Market",
          "rate": 7
        }
      ]
    }
  ]
};
