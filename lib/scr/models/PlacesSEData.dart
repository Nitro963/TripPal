import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final Map<String, List<String>> placesDict = {
  'Attractions & Culture': [
    'All Attractions & Culture',
    'Museums',
    'Theaters',
    'Urban Environment',
    'Towers',
    'Skyscrapers',
    'Bridges',
    'Lightouses',
  ],
  'Food & Drink': [
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
  'Shopping': [
    'All Shoppings',
    'Bakeries',
    'Conveniences',
    'Fish Stores',
    'Malls',
    'marketplaces',
    'Outdoor',
    'Supermarkets',
  ],
  'Sports': [
    'All Sports',
    'Climbing',
    'Diving',
    'Kitesurfing',
    'Pools',
    'Stadiums',
    'Surfing',
    'Winter Sports',
  ],
  'OutDoors': [
    'All Outdoors',
    'Beaches',
    'Glaciers',
    'Islands',
    'Natural Springs',
    'Natural Reserves',
    'Water',
    'Geological Formations'
  ],
  'Points of Interest': [
    'All Points of Interest',
    'Archaeology',
    'Burial Places',
    'Fortifications',
    'Historical Places',
    'Monuments and Memorials',
    'Industrial facilities',
  ],
  'Motoring': [
    'All Motoring',
    'Bicycle Rental',
    'boat Sharing',
    'Car Rental',
    'Car Sharing',
    'Car Wash',
    'Sharging Station',
    'Fuel',
  ],
  'Entertainment': [
    'All Entertainment',
    'Water Parks',
    'Roller Coasters',
    'Miniature Parks',
    'Amusement Parks',
    'BathHouses',
    'Sauns',
    'Thermal bath',
  ],
  'Accomodations': [
    'Apartments',
    'Villas and Chalet',
    'Resorts',
    'Motels',
    "Guest Houses",
    'Campsites',
    'Alpine Huts'
  ],
};

IconData selectIcon(String type) {
  if (type == 'Attractions & Culture') return FontAwesomeIcons.guitar;
  else if (type == 'Food & Drink') return FontAwesomeIcons.hamburger;
  else if (type == 'Shopping') return FontAwesomeIcons.shoppingCart;
  else if (type == 'OutDoors') return FontAwesomeIcons.envira;
  else if (type == 'Sports') return FontAwesomeIcons.basketballBall;
  else if (type == 'Points of Interest') return FontAwesomeIcons.landmark;
  else if (type == 'Motoring') return FontAwesomeIcons.car;
  else if (type == 'Entertainment') return FontAwesomeIcons.icons;
  else if (type == 'Accomodations') return FontAwesomeIcons.bed;
  return FontAwesomeIcons.handPaper;
}
