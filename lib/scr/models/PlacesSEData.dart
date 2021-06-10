import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final Map<String, List<String>> placesDict = {
    'Attractions & Culture' : [
    'All Attractions & Culture',
    'Museums',
    'Theaters',
    'Urban Environment',
    'Towers',
    'Skyscrapers',
    'Bridges',
    'Lightouses',
  ],
  'Food & Drink' : [
    'All Foods & drinks',
    'Cafes',
    'Restaurants',
    'Fast Foods',
    'Food Courts',
    'Picnic Sites',
    'Biergartens',
    'Bars',
    'Pubs',
  ],
  'Shopping' :[
    'All Shoppings',
    'Bakeries',
    'Conveniences',
    'Fish Stores',
    'Malls',
    'marketplaces',
    'Outdoor',
    'Supermarkets',
  ],
  'Sports' : [
    'All Sports',
    'Climbing',
    'Diving',
    'Kitesurfing',
    'Pools',
    'Stadiums',
    'Surfing',
    'Winter Sports',
  ],
  'OutDoors' : [
    'All Outdoors',
    'Beaches',
    'Glaciers',
    'Islands',
    'Natural Springs',
    'Natural Reserves',
    'Water',
    'Geological Formations'
  ],
  'Points of Interest' :[
    'All Points of Interest',
    'Archaeology',
    'Burial Places',
    'Fortifications',
    'Historical Places',
    'Monuments and Memorials',
    'Industrial facilities',
  ],
  'Motoring' : [
    'All Motoring',
    'Bicycle Rental',
    'boat Sharing',
    'Car Rental',
    'Car Sharing',
    'Car Wash',
    'Sharging Station',
    'Fuel',
  ],
  'Entertainment' : [
    'All Entertainment',
    'Water Parks',
    'Roller Coasters',
    'Miniature Parks',
    'Amusement Parks',
    'BathHouses',
    'Sauns',
    'Thermal bath',
  ],
  'Accomodations':[
    'Apartments',
    'Villas and Chalet',
    'Resorts',
    'Motels',
    "Guest Houses",
    'Campsites',
    'Alpine Huts'
  ],
  };



  Icon selectIcon(String type) {
    if (type == 'Attractions & Culture') {
      return Icon(
        FontAwesomeIcons.guitar,
        color: Colors.blue[500],
        size: 14,
      );
    } else if (type == 'Food & Drink') {
      return Icon(
        FontAwesomeIcons.hamburger,
        // FontAwesomeIcons.gulp,
        color: Colors.blue[500],
        size: 14,
      );
    } else if (type == 'Shopping') {
      return Icon(
        FontAwesomeIcons.shoppingCart,
        color: Colors.blue[500],
        size: 14,
      );
    } else if (type == 'OutDoors') {
      return Icon(
        // FontAwesomeIcons.campground,
        FontAwesomeIcons.envira,
        color: Colors.blue[500],
        size: 14,
      );
    } else if (type == 'Sports') {
      return Icon(
        FontAwesomeIcons.basketballBall,
        color: Colors.blue[500],
        size: 14,
      );
    } else if (type == 'Points of Interest') {
      return Icon(
        FontAwesomeIcons.landmark,
        color: Colors.blue[500],
        size: 14,
      );
    } else if (type == 'Motoring') {
      return Icon(
        FontAwesomeIcons.car,
        color: Colors.blue[500],
        size: 14,
      );
    } else if (type == 'Entertainment') {
      return Icon(
        FontAwesomeIcons.icons,
        color: Colors.blue[500],
        size: 14,
      );
    }
    return Icon(
      FontAwesomeIcons.handPaper,
      color: Colors.blue[500],
      size: 14,
    );
  }