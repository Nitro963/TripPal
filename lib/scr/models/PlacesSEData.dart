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

List dummyJson = [
  {
    "id": "W331188177",
    "name": "Bıçakçı Alaaddin Cami",
    "guestrating": 1,
    "kinds": "religion,other_temples,interesting_places",
    "distance": 6.1449093,
    "coordinate": {"lat": 41.013805, "lon": 28.949715}
  },
  {
    "id": "W523880524",
    "name": "Sofular Molla Hüsrev Camii",
    "guestrating": 1,
    "kinds": "religion,other_temples,interesting_places",
    "distance": 90.52688443,
    "coordinate": {"lat": 41.013432, "lon": 28.94873}
  },
  {
    "id": "N4362083790",
    "name": "",
    "guestrating": 0,
    "kinds": "urban_environment,cultural,interesting_places,installation",
    "distance": 169.68040503,
    "coordinate": {"lat": 41.012814, "lon": 28.948166}
  },
  {
    "id": "W201141056",
    "name": "Kızılminare Cami",
    "guestrating": 1,
    "kinds": "religion,other_temples,interesting_places",
    "distance": 175.06931767,
    "coordinate": {"lat": 41.01244, "lon": 28.950613}
  },
  {
    "id": "N5076597921",
    "name": "مطعم المدينة اكسراي",
    "guestrating": 1,
    "kinds": "other,unclassified_objects,interesting_places,tourist_object",
    "distance": 176.54462796,
    "coordinate": {"lat": 41.013638, "lon": 28.947578}
  },
  {
    "id": "W523880163",
    "name": "Yayla Kambur Mustafa Efendi Cami",
    "guestrating": 1,
    "kinds": "religion,other_temples,interesting_places",
    "distance": 178.73737213,
    "coordinate": {"lat": 41.015354, "lon": 28.948938}
  },
  {
    "id": "N3236233297",
    "name": "Column of Marcian",
    "guestrating": 3,
    "kinds":
        "historic,monuments_and_memorials,burial_places,urban_environment,cultural,interesting_places,other_burial_places,sculptures,monuments",
    "distance": 185.40791931,
    "coordinate": {"lat": 41.015442, "lon": 28.950285}
  },
  {
    "id": "W329094469",
    "name": "Amcazade Külliyesi",
    "guestrating": 1,
    "kinds": "museums,cultural,interesting_places,other_museums",
    "distance": 245.72345626,
    "coordinate": {"lat": 41.015182, "lon": 28.951982}
  },
  {
    "id": "W523879940",
    "name": "Ahmediye Cami",
    "guestrating": 2,
    "kinds": "religion,mosques,interesting_places",
    "distance": 278.47875877,
    "coordinate": {"lat": 41.014961, "lon": 28.946699}
  },
  {
    "id": "N4977947521",
    "name": "Church of St. Polyeuktos",
    "guestrating": 3,
    "kinds":
        "religion,historic_architecture,architecture,fortifications,churches,historic,interesting_places,destroyed_objects,castles,other_churches",
    "distance": 280.90087066,
    "coordinate": {"lat": 41.014233, "lon": 28.952959}
  },
  {
    "id": "W523880279",
    "name": "Dülgerzade Camii",
    "guestrating": 1,
    "kinds": "religion,other_temples,interesting_places",
    "distance": 287.1454957,
    "coordinate": {"lat": 41.01601, "lon": 28.951515}
  },
  {
    "id": "N3660204307",
    "name": "",
    "guestrating": 0,
    "kinds": "fountains,urban_environment,cultural,interesting_places",
    "distance": 333.96619283,
    "coordinate": {"lat": 41.011078, "lon": 28.948095}
  },
  {
    "id": "W312748721",
    "name": "İskender Paşa Camii",
    "guestrating": 1,
    "kinds": "religion,other_temples,interesting_places",
    "distance": 338.51477194,
    "coordinate": {"lat": 41.016617, "lon": 28.948006}
  },
  {
    "id": "Q6045782",
    "name": "İskender Pasha Mosque, Fatih",
    "guestrating": 2,
    "kinds": "religion,mosques,interesting_places",
    "distance": 348.12634936,
    "coordinate": {"lat": 41.01667, "lon": 28.94788}
  },
  {
    "id": "N6038913885",
    "name": "",
    "guestrating": 0,
    "kinds": "interesting_places,natural,natural_springs,geysers",
    "distance": 349.10139517,
    "coordinate": {"lat": 41.010696, "lon": 28.949638}
  },
  {
    "id": "N3254460381",
    "name": "Aviation Martyrs' Monument",
    "guestrating": 3,
    "kinds":
        "historic,monuments_and_memorials,burial_places,interesting_places,other_burial_places,monuments",
    "distance": 352.43560269,
    "coordinate": {"lat": 41.016075, "lon": 28.952635}
  },
  {
    "id": "W316903986",
    "name": "Muratpasa Camii",
    "guestrating": 1,
    "kinds": "religion,other_temples,interesting_places",
    "distance": 395.29796559,
    "coordinate": {"lat": 41.010326, "lon": 28.948921}
  },
  {
    "id": "Q60785191",
    "name": "Murat Pasha Mosque, Aksaray",
    "guestrating": 3,
    "kinds": "religion,mosques,interesting_places",
    "distance": 400.76002883,
    "coordinate": {"lat": 41.010265, "lon": 28.949001}
  },
  {
    "id": "W331192935",
    "name": "Hoşkadem Cami",
    "guestrating": 1,
    "kinds": "religion,other_temples,interesting_places",
    "distance": 421.26595004,
    "coordinate": {"lat": 41.012737, "lon": 28.954453}
  },
  {
    "id": "N3254460380",
    "name": "Mehmed II the Conqueror",
    "guestrating": 1,
    "kinds": "historic,monuments_and_memorials,interesting_places,monuments",
    "distance": 430.34763147,
    "coordinate": {"lat": 41.015594, "lon": 28.95422}
  }
];

IconData selectIcon(String type) {
  if (type == 'Attractions & Culture')
    return FontAwesomeIcons.guitar;
  else if (type == 'Food & Drink')
    return FontAwesomeIcons.hamburger;
  else if (type == 'Shopping')
    return FontAwesomeIcons.shoppingCart;
  else if (type == 'OutDoors')
    return FontAwesomeIcons.envira;
  else if (type == 'Sports')
    return FontAwesomeIcons.basketballBall;
  else if (type == 'Points of Interest')
    return FontAwesomeIcons.landmark;
  else if (type == 'Motoring')
    return FontAwesomeIcons.car;
  else if (type == 'Entertainment')
    return FontAwesomeIcons.icons;
  else if (type == 'Accomodations') return FontAwesomeIcons.bed;
  return FontAwesomeIcons.handPaper;
}

Color selectPrimaryColor(String place) {
  switch (place) {
    case 'religion':
      return Colors.purple[900];
    case 'historic':
      return Colors.yellow[900];
    case 'cultural':
      return Colors.blue[900];
    case 'other':
      return Colors.grey[900];
    case 'natural':
      return Colors.green[900];
    case 'interesting_places':
      return Colors.red[900];
  }
  return Colors.pink[900];
}

Color selectSecondartColor(String place) {
  switch (place) {
    case 'religion':
      return Colors.purple[100];
    case 'historic':
      return Colors.yellow[100];
    case 'cultural':
      return Colors.blue[100];
    case 'other':
      return Colors.grey[100];
    case 'natural':
      return Colors.green[100];
    case 'interesting_places':
      return Colors.red[100];
  }
  return Colors.pink[100];
}
