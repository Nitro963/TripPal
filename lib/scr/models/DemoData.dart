import 'package:flutter/material.dart';
import 'package:travel_app/scr/Models/tasks.dart';
import 'package:travel_app/scr/models/activites.dart';
import 'package:travel_app/scr/models/place.dart';
import 'package:travel_app/scr/models/trip.dart';

import 'Hotel.dart';
import 'blog.dart';
import 'days.dart';

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
      avalibaleRooms: [Room(price: 1000, type: "Double Room")]),
  Hotel(
      name: "Four Seasons",
      image: "images/hotel3.jpg",
      raiting: 9.1,
      stars: 5,
      numReviews: 200,
      location: "Paris",
      avalibaleRooms: [Room(price: 1000, type: "Double Room")]),
  Hotel(
      name: "Four Seasons",
      image: "images/hotel3.jpg",
      raiting: 9.1,
      stars: 5,
      numReviews: 200,
      location: "Paris",
      avalibaleRooms: [Room(price: 1000, type: "Double Room")])
];

List<Trip> dummyTrips = [
  Trip(
      city: 'Dubai',
      country: 'UAE',
      details: 'Foods, malls & shops included',
      type: 'Extended Trip',
      days: 7),
  Trip(
      city: 'Milan',
      country: 'Italy',
      details: 'Malls included',
      type: 'Focused Trip',
      days: 3),
  Trip(
      city: 'Ankara',
      country: 'Turkey',
      details: 'Foods & Shops included',
      type: 'Focused Trip',
      days: 6),
  Trip(
      city: 'Barcelona',
      country: 'Spain',
      details: 'Foods included',
      type: 'Extended Trip',
      days: 9),
  Trip(
      city: 'Dubai',
      country: 'UAE',
      details: 'Foods, malls & shops included',
      type: 'Extended Trip',
      days: 7),
  Trip(
      city: 'Milan',
      country: 'Italy',
      details: 'Malls included',
      type: 'Focused Trip',
      days: 3),
  Trip(
      city: 'Ankara',
      country: 'Turkey',
      details: 'Foods & Shops included',
      type: 'Focused Trip',
      days: 6),
  Trip(
      city: 'Barcelona',
      country: 'Spain',
      details: 'Foods included',
      type: 'Extended Trip',
      days: 9),
];

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

List<Days> days = [
  Days(day: 1, activates: [
    Acitvites(
        time: TimeOfDay(hour: 12, minute: 0),
        activity: "Leave Home",
        details: "use uber"),
    Acitvites(
        time: TimeOfDay(hour: 2, minute: 0),
        activity: "Shopping",
        details: "Go to talis"),
    Acitvites(
        time: TimeOfDay(hour: 4, minute: 0),
        activity: "Eat Food",
        details: "Burger"),
    Acitvites(
        time: TimeOfDay(hour:7, minute: 0),
        activity: "Fuck adnan",
        details: "use your dick"),
  ]),
  Days(day: 2, activates: [
    Acitvites(
        time: TimeOfDay(hour: 10, minute: 0),
        activity: "Leave Home",
        details: "use uber"),
    Acitvites(
        time: TimeOfDay(hour: 12, minute: 0),
        activity: "Day 2",
        details: "Go to talis"),
    Acitvites(
        time: TimeOfDay(hour: 1, minute: 0),
        activity: "Eat Food",
        details: "Burger"),
    Acitvites(
        time: TimeOfDay(hour: 2, minute: 0),
        activity: "Fuck adnan",
        details: "use your dick"),
  ]),
];
