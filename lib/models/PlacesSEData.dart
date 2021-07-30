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

Map<String, dynamic> dummyFilters = {
  "applied": false,
  "name": {
    "item": {"value": ""},
    "autosuggest": {
      "additionalUrlParams": {
        "resolved-location": "CITY:504261:UNKNOWN:UNKNOWN",
        "q-destination": "Paris, France",
        "destination-id": "504261"
      }
    }
  },
  "starRating": {
    "applied": false,
    "items": [
      {"value": 5},
      {"value": 4},
      {"value": 3},
      {"value": 2},
      {"value": 1}
    ]
  },
  "guestRating": {
    "range": {
      "min": {"defaultValue": 0.0},
      "max": {"defaultValue": 10.0}
    }
  },
  "landmarks": {
    "selectedOrder": [],
    "items": [
      {"label": "City center", "value": "504261"},
      {"label": "Eiffel Tower", "value": "520053"},
      {"label": "Roissy - Charles de Gaulle Airport (CDG)", "value": "485293"},
      {"label": "Louvre Museum", "value": "520052"},
      {"label": "Palais Garnier", "value": "1632921"},
      {"label": "Paris Gare du Nord", "value": "1632915"},
      {"label": "Champs-Elysees", "value": "1701809"},
      {"label": "Arc de Triomphe", "value": "1431"},
      {"label": "Orly Airport (ORY)", "value": "485292"},
      {"label": "Paris Montparnasse Station", "value": "1636723"},
      {"label": "Paris Expo Porte de Versailles", "value": "1636081"},
      {"label": "Paris Gare de Lyon", "value": "1717246"},
      {"label": "Galeries Lafayette", "value": "1696522"},
      {"label": "Paris Nord Villepinte Exhibition Centre", "value": "1714405"},
      {"label": "Notre-Dame", "value": "528023"},
      {"label": "Paris Gare de l'Est", "value": "1701542"},
      {"label": "Gare de Lyon Station", "value": "1700959"},
      {"label": "AccorHotels Arena", "value": "1696523"},
      {"label": "Palais des Congres de Paris", "value": "1635495"},
      {"label": "CDG Airport Terminal 1 Station", "value": "11131015"}
    ],
    "distance": []
  },
  "neighbourhood": {
    "applied": false,
    "items": [
      {"label": "15th Arrondissement", "value": "1731383"},
      {"label": "8th Arrondissement", "value": "1731373"},
      {"label": "6th Arrondissement", "value": "1731372"},
      {"label": "7th Arrondissement", "value": "1731391"},
      {"label": "9th Arrondissement", "value": "1731375"},
      {"label": "Champs-\u00c9lys\u00e9es", "value": "11117463"},
      {"label": "1st Arrondissement", "value": "1731364"},
      {"label": "5th Arrondissement", "value": "1731370"},
      {"label": "14th Arrondissement", "value": "1731382"},
      {"label": "Bercy", "value": "1691967"},
      {"label": "17th Arrondissement", "value": "1731385"},
      {"label": "13th Arrondissement", "value": "1731380"},
      {"label": "Saint-Germain-des-Pres", "value": "1691784"},
      {"label": "10th Arrondissement", "value": "1731376"},
      {"label": "11th Arrondissement", "value": "1731377"},
      {"label": "16th Arrondissement", "value": "1731384"},
      {"label": "12th Arrondissement", "value": "1731379"},
      {"label": "Latin", "value": "1639764"},
      {"label": "18th Arrondissement", "value": "1731387"},
      {"label": "2nd Arrondissement", "value": "1731365"},
      {"label": "4th Arrondissement", "value": "1731369"},
      {"label": "19th Arrondissement", "value": "1731389"},
      {"label": "3rd Arrondissement", "value": "1731367"},
      {"label": "Quartier du Faubourg-Montmartre", "value": "11117504"},
      {"label": "20th Arrondissement", "value": "1731390"},
      {"label": "Pigalle", "value": "1722994"},
      {"label": "La Villette", "value": "1691964"},
      {"label": "Les Halles", "value": "11117465"},
      {"label": "Madeleine", "value": "10990271"},
      {"label": "Porte de Clichy", "value": "10990272"},
      {"label": "La Plaine-Saint-Denis", "value": "11071260"},
      {"label": "Quartier de la Place-Vend\u00f4me", "value": "11117493"},
      {"label": "Meudon-la-For\u00eat", "value": "10990967"},
      {"label": "Notre-Dame-des-Champs", "value": "11117415"},
      {"label": "Belleville", "value": "10798929"},
      {"label": "Grenelle", "value": "11037980"},
      {"label": "Od\u00e9on", "value": "11117401"},
      {"label": "Ternes", "value": "10990286"},
      {"label": "Sorbonne", "value": "11117478"},
      {"label": "Batignolles", "value": "10565089"},
      {"label": "Quartier des Invalides", "value": "11117476"},
      {"label": "Passy", "value": "10990951"},
      {"label": "Porte de la Chapelle", "value": "10990283"},
      {"label": "Paris City Center", "value": "1730997"},
      {"label": "Marais", "value": "1707199"},
      {"label": "Montmartre", "value": "1707200"},
      {"label": "Montparnasse", "value": "1707272"},
      {"label": "Jardin des plantes", "value": "11117398"},
      {"label": "Palais-Royal", "value": "11117898"},
      {"label": "Pere Lachaise", "value": "1691973"},
      {"label": "Vivienne", "value": "11117670"},
      {"label": "Auteuil", "value": "11117731"},
      {"label": "Les \u00celes", "value": "11117903"},
      {"label": "Gare", "value": "11023508"},
      {"label": "Chaillot", "value": "11117484"},
      {"label": "Clignancourt", "value": "10990917"},
      {"label": "Arts-et-M\u00e9tiers", "value": "11117727"},
      {"label": "L'Europe", "value": "10990273"},
      {"label": "Parc-de-Montsouris", "value": "11117422"},
      {"label": "Porte-Dauphine", "value": "11117728"},
      {"label": "Quartier du Petit-Montrouge", "value": "11117456"},
      {"label": "Quartier de l'\u00c9cole-Militaire", "value": "11117442"},
      {"label": "Chauss\u00e9e-d'Antin", "value": "11117383"},
      {"label": "Butte-aux-Cailles", "value": "10990262"},
      {"label": "La Varenne Saint-Hilaire", "value": "1712788"},
      {"label": "Necker", "value": "11117444"},
      {"label": "Porte-Saint-Martin", "value": "11117389"},
      {"label": "Universit\u00e9", "value": "11117433"},
      {"label": "Quinze-Vingts", "value": "11117492"},
      {"label": "H\u00f4pital Saint-Louis", "value": "11117449"},
      {"label": "Quartier de la Porte-Saint-Denis", "value": "11117488"},
      {"label": "Ivry-port", "value": "11117454"},
      {"label": "Picpus", "value": "11117736"},
      {"label": "Quartier de Rochechouart", "value": "11117718"},
      {"label": "Quartier de Javel", "value": "11117503"},
      {"label": "Faubourg de l'Arche", "value": "11117423"},
      {"label": "Bonne-Nouvelle", "value": "11117912"},
      {"label": "Quartier de la Salp\u00eatri\u00e8re", "value": "11117416"},
      {"label": "Quartier de la Folie-M\u00e9ricourt", "value": "11117400"},
      {"label": "Charonne", "value": "11117475"},
      {"label": "Quartier Saint-Georges", "value": "11117669"},
      {"label": "Quartier Saint-Ambroise", "value": "11117477"},
      {"label": "Quartier de la Monnaie", "value": "11117441"},
      {"label": "Quartier de la Maison-Blanche", "value": "11117450"},
      {"label": "Quartier du Gros-Caillou", "value": "11117419"},
      {"label": "Saint-Lambert", "value": "11117899"},
      {"label": "Quartier de la Muette", "value": "11117740"},
      {"label": "Val-de-Gr\u00e2ce", "value": "11117916"},
      {"label": "Petit Nanterre", "value": "11117659"},
      {"label": "Domaine du Bois", "value": "11117733"},
      {"label": "Quartier de la Roquette", "value": "11117425"},
      {"label": "Arsenal", "value": "11117434"},
      {"label": "Gaillon", "value": "11117902"},
      {"label": "Plaisance", "value": "11117913"},
      {"label": "Saint-Gervais", "value": "11117430"},
      {"label": "Bel-Air", "value": "10996974"},
      {"label": "Quartier des Grandes-Carri\u00e8res", "value": "11117439"},
      {"label": "Quartier de la Chapelle", "value": "11117406"},
      {"label": "Saint-Thomas-d'Aquin", "value": "11117453"},
      {"label": "Asiatique", "value": "10565702"},
      {"label": "Quartier du Mail", "value": "11117482"},
      {"label": "Faubourg-du-Roule", "value": "11117734"},
      {"label": "Quartier de la Goutte-d'Or", "value": "11117914"},
      {"label": "Saint-Vincent-de-Paul", "value": "11117428"},
      {"label": "Saint-Germain-l'Auxerrois", "value": "11117717"},
      {"label": "Saint-Louis", "value": "11117882"},
      {"label": "Saint-Victor", "value": "11117518"},
      {"label": "\u00c9pinettes", "value": "11117412"},
      {"label": "Notre-Dame", "value": "11117864"},
      {"label": "Porchefontaine", "value": "11117459"},
      {"label": "Gambetta", "value": "11117667"},
      {"label": "Quartier de la Boule - Champs-Pierreux", "value": "11117485"},
      {"label": "Saint-Louis", "value": "11118052"},
      {"label": "Triangle de Choisy", "value": "11117468"},
      {"label": "Quartier de la Plaine-de-Monceaux", "value": "11117617"},
      {"label": "Plateau - Mont-Val\u00e9rien", "value": "11117409"},
      {"label": "Quartier Sainte-Marguerite", "value": "11117397"},
      {"label": "Quartier Sainte-Avoye", "value": "11117867"},
      {"label": "Croulebarbe", "value": "11118087"},
      {"label": "Saint-Merri", "value": "11117517"},
      {"label": "La Source", "value": "11117385"},
      {"label": "Archives", "value": "11117487"},
      {"label": "Chantiers", "value": "11117917"},
      {"label": "Louis Bertrand-Mirabeau-S\u00e9mard", "value": "11117418"},
      {"label": "C\u0153ur de Ville", "value": "11117735"},
      {"label": "Am\u00e9rique", "value": "11117384"},
      {"label": "Parc-Nord", "value": "11117655"},
      {"label": "Quartier du Pont-de-Flandre", "value": "11117483"},
      {"label": "Combat", "value": "11117405"},
      {"label": "Diderot", "value": "11117897"},
      {"label": "Enfants-Rouges", "value": "11117420"},
      {"label": "Saint-Fargeau", "value": "11117466"},
      {"label": "Le Tremblay", "value": "11117726"},
      {"label": "Monmousseau-V\u00e9rollot", "value": "11117452"},
      {"label": "Clagny Glatigny", "value": "11117426"},
      {"label": "Quartier du Plateau", "value": "11117885"},
      {
        "label": "Quartier du Vieux-Pont - Sainte-Genevi\u00e8ve",
        "value": "11117730"
      },
      {"label": "Petit-Colombes", "value": "12527148"},
      {"label": "Notre Dame", "value": "12518520"},
      {"label": "Cit\u00e9 des P\u00e9richaux", "value": "12522346"},
      {"label": "C\u00f4te d'Or-Les Sarrazins", "value": "11117471"},
      {"label": "Flandres", "value": "12518599"},
      {"label": "Bel-Air Nord", "value": "12508362"},
      {"label": "Curial Cambrai", "value": "12530437"},
      {"label": "Bleuets - Bordi\u00e8res - Pinsons", "value": "11117474"},
      {"label": "R\u00e9publique\u2013Point-du-Jour", "value": "12512928"},
      {"label": "Les Puces de Saint-Ouen", "value": "12501858"},
      {"label": "Jean Zay", "value": "11118075"},
      {"label": "Villa Montmorency", "value": "12537070"},
      {"label": "Vignerons", "value": "11118058"},
      {"label": "Faubourg Saint-Germain", "value": "12525050"},
      {"label": "Chenevier-D\u00e9m\u00e9nitroux", "value": "11117410"},
      {"label": "Buttes-Halage", "value": "11117429"},
      {"label": "Silly-Gallieni", "value": "12503777"},
      {"label": "Parchamp\u2013Albert Kahn", "value": "12508449"},
      {"label": "Les Mousseaux", "value": "12530595"},
      {"label": "Prince\u2013Marmottan", "value": "12513040"},
      {"label": "Chemin de l'\u00cele", "value": "11117424"},
      {"label": "Centre Ville", "value": "12527506"},
      {"label": "Python Duvernois", "value": "12518621"},
      {"label": "Saint Blaise", "value": "12523597"},
      {"label": "Petit-Ivry", "value": "11117436"},
      {"label": "Quartier des peupliers", "value": "12527407"},
      {"label": "Falgui\u00e8re", "value": "12537096"},
      {"label": "Avenir Parisien", "value": "12508479"},
      {"label": "Adamville", "value": "11117748"},
      {"label": "Billancourt\u2013Rives de Seine", "value": "12522253"},
      {"label": "Les Amandiers", "value": "12518802"},
      {"label": "Le Plateau", "value": "11117479"},
      {"label": "Grange aux Belles", "value": "12518404"},
      {"label": "Le Port sous la Lune", "value": "11117505"},
      {"label": "Riquet Stalingrad", "value": "12513170"},
      {"label": "Quartier Massy-Op\u00e9ra I", "value": "12536873"},
      {"label": "Quartier de l'Horloge", "value": "12527363"},
      {"label": "Strasbourg -Saint-Denis", "value": "12516649"},
      {"label": "Porte d'Asni\u00e8res", "value": "12530434"}
    ]
  },
  "accommodationType": {
    "applied": false,
    "items": [
      {"label": "Apart-hotels", "value": "20"},
      {"label": "Apartments", "value": "15"},
      {"label": "B&Bs", "value": "5"},
      {"label": "Cabins and lodges", "value": "9"},
      {"label": "Caravan parks", "value": "21"},
      {"label": "Castles", "value": "27"},
      {"label": "Cottages", "value": "11"},
      {"label": "Country houses", "value": "24"},
      {"label": "Guest houses", "value": "30"},
      {"label": "Hostels", "value": "12"},
      {"label": "Hotels", "value": "1"},
      {"label": "Houseboats", "value": "16"},
      {"label": "Inns", "value": "8"},
      {"label": "Palaces", "value": "29"},
      {"label": "Resorts", "value": "3"},
      {"label": "Vacation homes", "value": "4"},
      {"label": "Villas", "value": "14"}
    ]
  },
  "facilities": {
    "applied": false,
    "items": [
      {"label": "24-hour front desk", "value": "2063"},
      {"label": "Airport transfers", "value": "513"},
      {"label": "Bar", "value": "515"},
      {"label": "Bathtub in room", "value": "517"},
      {"label": "Breakfast included", "value": "2048"},
      {"label": "Business facilities", "value": "519"},
      {"label": "Casino", "value": "2112"},
      {"label": "Childcare", "value": "521"},
      {"label": "Connecting rooms available", "value": "523"},
      {"label": "Cribs available", "value": "525"},
      {"label": "Electric vehicle charging point", "value": "1073743315"},
      {"label": "Gym", "value": "2"},
      {"label": "Internet Access", "value": "8"},
      {"label": "Kitchen", "value": "32"},
      {"label": "Meeting Facilities", "value": "1"},
      {"label": "Non-smoking", "value": "529"},
      {"label": "Parking available", "value": "16384"},
      {"label": "Parking included", "value": "134234112"},
      {"label": "Pet Friendly", "value": "64"},
      {"label": "Pool", "value": "128"},
      {"label": "Restaurant", "value": "256"},
      {"label": "Smoking areas", "value": "537"},
      {"label": "Spa", "value": "539"},
      {"label": "WiFi included", "value": "527"}
    ]
  },
  "accessibility": {
    "applied": false,
    "items": [
      {"label": "Accessibility equipment for the deaf", "value": "2097152"},
      {"label": "Accessible bathroom", "value": "131072"},
      {"label": "Accessible parking", "value": "524288"},
      {"label": "Accessible path of travel", "value": "65536"},
      {"label": "Braille or raised signage", "value": "4194304"},
      {"label": "In-room accessibility", "value": "1048576"},
      {"label": "Roll-in shower", "value": "262144"},
      {"label": "Wheelchair accessible rooms", "value": "541"}
    ]
  },
  "themesAndTypes": {
    "applied": false,
    "items": [
      {"label": "Adventure", "value": "18"},
      {"label": "Boutique", "value": "4"},
      {"label": "Business", "value": "14"},
      {"label": "Casino", "value": "8"},
      {"label": "Family-friendly", "value": "25"},
      {"label": "Golf", "value": "26"},
      {"label": "Historic", "value": "2"},
      {"label": "Hot Springs", "value": "22"},
      {"label": "LGBTQ Welcoming", "value": "21"},
      {"label": "Luxury", "value": "15"},
      {"label": "Romantic", "value": "1"},
      {"label": "Shopping", "value": "17"},
      {"label": "Ski", "value": "28"},
      {"label": "Spa Hotel", "value": "27"}
    ]
  },
  "price": {
    "label": "Nightly Price",
    "range": {
      "min": {"defaultValue": 0},
      "max": {"defaultValue": 500},
      "increments": 5
    },
    "multiplier": 1
  },
  "paymentPreference": {
    "items": [
      {"label": "Pay with Hotels.com gift card", "value": "gc"}
    ]
  },
  "welcomeRewards": {
    "label": "Hotels.com\u00ae Rewards",
    "items": [
      {"label": "Collect stamps", "value": "collect"},
      {"label": "Redeem reward* nights", "value": "redeem"}
    ]
  }
};
List dummyJson = [
  {
    'id': 'Q18159614',
    'name': 'A Conversation with Oscar Wilde',
    'guestrating': 3,
    'kinds': 'historic cultural ',
    'distance': 21.72669261,
    'coordinate': {'lat': 51.508701, 'lon': -0.125894}
  },
  {
    'id': 'Q27083683',
    'name':
        'Drinking Fountain Attached To Church Walls And Railing To Church Of St Martin In The Fields',
    'guestrating': 6,
    'kinds': 'historic monuments ',
    'distance': 25.75565004,
    'coordinate': {'lat': 51.508694, 'lon': -0.126005}
  },
  {
    'id': 'Q17550120',
    'name': 'Queen Eleanor Memorial Cross',
    'guestrating': 7,
    'kinds': 'historic monuments ',
    'distance': 32.11495704,
    'coordinate': {'lat': 51.5084, 'lon': -0.125327}
  },
  {
    'id': 'Q27087660',
    'name': 'K6 Telephone Kiosk',
    'guestrating': 6,
    'kinds': 'other red ',
    'distance': 36.0326032,
    'coordinate': {'lat': 51.508671, 'lon': -0.126208}
  },
  {
    'id': 'Q27082216',
    'name': 'John Law Baker Memorial Drinking Fountain',
    'guestrating': 6,
    'kinds': 'historic monuments ',
    'distance': 42.48822861,
    'coordinate': {'lat': 51.508701, 'lon': -0.126288}
  },
  {
    'id': 'N246519847',
    'name': 'Halfway II Heaven',
    'guestrating': 3,
    'kinds': 'nightclubs cultural ',
    'distance': 66.36822271,
    'coordinate': {'lat': 51.508503, 'lon': -0.126695}
  },
  {
    'id': 'Q17550125',
    'name': '434-437, Strand Wc2 (see Details For Further Address Information)',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 66.85892427,
    'coordinate': {'lat': 51.509102, 'lon': -0.125435}
  },
  {
    'id': 'W30734422',
    'name': 'St Martin-in-the-Fields',
    'guestrating': 7,
    'kinds': 'religion churches ',
    'distance': 70.55733705,
    'coordinate': {'lat': 51.50882, 'lon': -0.126644}
  },
  {
    'id': 'Q17550006',
    'name': 'St Martin In The Fields Secondary School',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 72.80206916,
    'coordinate': {'lat': 51.509102, 'lon': -0.126255}
  },
  {
    'id': 'N5323721988',
    'name': 'British Optical Association Museum',
    'guestrating': 2,
    'kinds': 'museums cultural ',
    'distance': 74.99308712,
    'coordinate': {'lat': 51.507893, 'lon': -0.125392}
  },
  {
    'id': 'Q5146790',
    'name': 'College of Optometrists',
    'guestrating': 7,
    'kinds': 'historic architecture ',
    'distance': 76.77210619,
    'coordinate': {'lat': 51.50787, 'lon': -0.125428}
  },
  {
    'id': 'Q17526981',
    'name':
        'Churchyard Walls And Railings Surrounding Church Of St Martin In The Fields On North, South, East And West Sides',
    'guestrating': 6,
    'kinds': 'defensive historic ',
    'distance': 79.98187603,
    'coordinate': {'lat': 51.509102, 'lon': -0.126442}
  },
  {
    'id': 'Q27083003',
    'name':
        'Churchyard Wall And Railings Adjoining Entrance To Crypt, On North Side Of Church Of St Martin In The Fields',
    'guestrating': 5,
    'kinds': 'defensive historic ',
    'distance': 85.50571386,
    'coordinate': {'lat': 51.508968, 'lon': -0.126752}
  },
  {
    'id': 'Q27084626',
    'name': '40, Craven Street Wc2',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 87.11926876,
    'coordinate': {'lat': 51.507813, 'lon': -0.125243}
  },
  {
    'id': 'Q12060051',
    'name': 'High Commission of South Africa, London',
    'guestrating': 7,
    'kinds': 'other unclassified ',
    'distance': 88.51039084,
    'coordinate': {'lat': 51.508202, 'lon': -0.1269}
  },
  {
    'id': 'Q17550314',
    'name': "St Martin's Vestry Hall",
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 92.46436815,
    'coordinate': {'lat': 51.509201, 'lon': -0.126528}
  },
  {
    'id': 'Q27080723',
    'name': '39, Craven Street Wc2',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 95.0931152,
    'coordinate': {'lat': 51.507755, 'lon': -0.125159}
  },
  {
    'id': 'Q26319814',
    'name': '38, Craven Street Wc2',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 101.90945313,
    'coordinate': {'lat': 51.507717, 'lon': -0.12506}
  },
  {
    'id': 'Q17550321',
    'name': "St Martin's Vicarage",
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 102.05582151,
    'coordinate': {'lat': 51.509201, 'lon': -0.126744}
  },
  {
    'id': 'Q27084625',
    'name': '37, Craven Street Wc2',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 107.39387013,
    'coordinate': {'lat': 51.507683, 'lon': -0.125004}
  },
  {
    'id': 'N345887283',
    'name': 'Heaven',
    'guestrating': 3,
    'kinds': 'nightclubs cultural ',
    'distance': 110.40327223,
    'coordinate': {'lat': 51.507866, 'lon': -0.12456}
  },
  {
    'id': 'Q27080722',
    'name': '11 And 12, Craven Street Wc2',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 113.52674035,
    'coordinate': {'lat': 51.507549, 'lon': -0.125279}
  },
  {
    'id': 'W104081033',
    'name': 'Benjamin Franklin House',
    'guestrating': 7,
    'kinds': 'biographical historic ',
    'distance': 113.62374784,
    'coordinate': {'lat': 51.507637, 'lon': -0.124942}
  },
  {
    'id': 'R7183889',
    'name': 'The Ship and Shovell',
    'guestrating': 7,
    'kinds': 'historic architecture ',
    'distance': 114.47145852,
    'coordinate': {'lat': 51.50769, 'lon': -0.12479}
  },
  {
    'id': 'N5323722141',
    'name': 'Benjamin Franklin',
    'guestrating': 1,
    'kinds': 'historic monuments ',
    'distance': 115.48958054,
    'coordinate': {'lat': 51.507607, 'lon': -0.124984}
  },
  {
    'id': 'N4837916792',
    'name': 'Strand Gallery',
    'guestrating': 1,
    'kinds': 'museums cultural ',
    'distance': 117.41323046,
    'coordinate': {'lat': 51.508694, 'lon': -0.124069}
  },
  {
    'id': 'Q27080603',
    'name': '27 And 29, John Adam Street Wc2',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 119.534808,
    'coordinate': {'lat': 51.508484, 'lon': -0.12402}
  },
  {
    'id': 'Q27084624',
    'name': '35, Craven Street Wc2',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 120.42478175,
    'coordinate': {'lat': 51.507607, 'lon': -0.124834}
  },
  {
    'id': 'Q17549300',
    'name':
        'Fountains and terrace walls with lampstandards, steps and stone bollards enclosing the Square',
    'guestrating': 6,
    'kinds': 'fountains historic ',
    'distance': 121.01229205,
    'coordinate': {'lat': 51.508099, 'lon': -0.127341}
  },
  {
    'id': 'Q27080947',
    'name': 'Western Corner Block Of Former Charing Cross Hospital',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 122.13131212,
    'coordinate': {'lat': 51.509624, 'lon': -0.125616}
  },
  {
    'id': 'Q42029943',
    'name': 'Global Village',
    'guestrating': 1,
    'kinds': 'cinemas cultural ',
    'distance': 122.66112922,
    'coordinate': {'lat': 51.508087, 'lon': -0.124122}
  },
  {
    'id': 'Q26319839',
    'name': '13 And 14, Craven Street Wc2',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 122.79110006,
    'coordinate': {'lat': 51.507488, 'lon': -0.125154}
  },
  {
    'id': 'Q27080607',
    'name': '44, Chandos Place Wc2',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 125.27865129,
    'coordinate': {'lat': 51.509632, 'lon': -0.126103}
  },
  {
    'id': 'Q26319278',
    'name': '45 And 46, Chandos Place Wc2',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 127.80801021,
    'coordinate': {'lat': 51.509663, 'lon': -0.126038}
  },
  {
    'id': 'R3962878',
    'name': 'George IV',
    'guestrating': 3,
    'kinds': 'historic architecture ',
    'distance': 128.74438912,
    'coordinate': {'lat': 51.508347, 'lon': -0.127571}
  },
  {
    'id': 'Q7604481',
    'name': 'Equestrian statue of King George IV',
    'guestrating': 7,
    'kinds': 'cultural urban ',
    'distance': 129.5208493,
    'coordinate': {'lat': 51.508381, 'lon': -0.12759}
  },
  {
    'id': 'N5582186352',
    'name': 'George Washington',
    'guestrating': 6,
    'kinds': 'historic monuments ',
    'distance': 129.59405717,
    'coordinate': {'lat': 51.508701, 'lon': -0.127587}
  },
  {
    'id': 'Q26319810',
    'name': '15, Craven Street Wc2',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 130.26898948,
    'coordinate': {'lat': 51.507439, 'lon': -0.125057}
  },
  {
    'id': 'Q27084614',
    'name': '1, Craven Passage Wc2',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 131.23209198,
    'coordinate': {'lat': 51.507568, 'lon': -0.124644}
  },
  {
    'id': 'W153342473',
    'name': 'Henry Havelock',
    'guestrating': 3,
    'kinds': 'urban cultural ',
    'distance': 133.49907275,
    'coordinate': {'lat': 51.507931, 'lon': -0.127408}
  },
  {
    'id': 'N1571931922',
    'name': 'Edith Cavell Memorial',
    'guestrating': 7,
    'kinds': 'historic monuments ',
    'distance': 133.55703491,
    'coordinate': {'lat': 51.509323, 'lon': -0.127183}
  },
  {
    'id': 'Q18162525',
    'name': 'Statue of Henry Havelock',
    'guestrating': 7,
    'kinds': 'cultural urban ',
    'distance': 134.89124729,
    'coordinate': {'lat': 51.5079, 'lon': -0.1274}
  },
  {
    'id': 'N345886715',
    'name': 'Charing Cross Theatre',
    'guestrating': 2,
    'kinds': 'cultural cinemas ',
    'distance': 135.63961312,
    'coordinate': {'lat': 51.507664, 'lon': -0.124366}
  },
  {
    'id': 'Q26319813',
    'name': '33 And 34, Craven Street Wc2',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 135.70737167,
    'coordinate': {'lat': 51.507507, 'lon': -0.124679}
  },
  {
    'id': 'Q17549682',
    'name': '8, Buckingham Street Wc2',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 136.39660361,
    'coordinate': {'lat': 51.508499, 'lon': -0.123776}
  },
  {
    'id': 'Q29295271',
    'name': 'Bust of David Beatty, 1st Earl Beatty',
    'guestrating': 2,
    'kinds': 'cultural urban ',
    'distance': 136.84469226,
    'coordinate': {'lat': 51.5084, 'lon': -0.1277}
  },
  {
    'id': 'Q26319279',
    'name': 'Marquis of Granby Public House',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 138.74446005,
    'coordinate': {'lat': 51.509777, 'lon': -0.125737}
  },
  {
    'id': 'Q17549339',
    'name': '9, Buckingham Street Wc2',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 141.33301738,
    'coordinate': {'lat': 51.5084, 'lon': -0.123715}
  },
  {
    'id': 'Q27084780',
    'name': '22, Buckingham Street Wc2',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 141.95243998,
    'coordinate': {'lat': 51.508678, 'lon': -0.123709}
  },
  {
    'id': 'Q5527003',
    'name': 'Gate Theatre Studio',
    'guestrating': 2,
    'kinds': 'architecture historic ',
    'distance': 142.93416206,
    'coordinate': {'lat': 51.508099, 'lon': -0.1238}
  },
  {
    'id': 'W554716416',
    'name': '',
    'guestrating': 0,
    'kinds': 'fountains urban ',
    'distance': 143.92560517,
    'coordinate': {'lat': 51.508099, 'lon': -0.127694}
  },
  {
    'id': 'Q29295257',
    'name': 'Beatty Memorial Fountain',
    'guestrating': 2,
    'kinds': 'fountains historic ',
    'distance': 144.24337996,
    'coordinate': {'lat': 51.508099, 'lon': -0.1277}
  },
  {
    'id': 'Q17549688',
    'name': '10, Buckingham Street Wc2',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 144.92477184,
    'coordinate': {'lat': 51.5084, 'lon': -0.123663}
  },
  {
    'id': 'Q29295280',
    'name': 'Bust of John Jellicoe, 1st Earl Jellicoe',
    'guestrating': 2,
    'kinds': 'cultural urban ',
    'distance': 145.29230809,
    'coordinate': {'lat': 51.508301, 'lon': -0.1278}
  },
  {
    'id': 'Q17550013',
    'name': "31, St Martin's Lane Wc2",
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 146.36932549,
    'coordinate': {'lat': 51.509701, 'lon': -0.126704}
  },
  {
    'id': 'Q17550542',
    'name': '21, Buckingham Street Wc2',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 147.04554868,
    'coordinate': {'lat': 51.508598, 'lon': -0.123625}
  },
  {
    'id': 'Q26319812',
    'name': '32, Craven Street Wc2',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 147.19255377,
    'coordinate': {'lat': 51.507439, 'lon': -0.124538}
  },
  {
    'id': 'Q27080598',
    'name': '21, John Adam Street Wc2',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 149.65853724,
    'coordinate': {'lat': 51.50872, 'lon': -0.123606}
  },
  {
    'id': 'Q17549355',
    'name': '20, Buckingham Street Wc2',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 152.31488919,
    'coordinate': {'lat': 51.508598, 'lon': -0.123549}
  },
  {
    'id': 'Q17550742',
    'name': '11, Buckingham Street Wc2',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 153.70578729,
    'coordinate': {'lat': 51.508301, 'lon': -0.123557}
  },
  {
    'id': 'Q27084023',
    'name': 'K2 Telephone Kiosk',
    'guestrating': 6,
    'kinds': 'other red ',
    'distance': 153.85921413,
    'coordinate': {'lat': 51.509617, 'lon': -0.12437}
  },
  {
    'id': 'Q27084623',
    'name': '31, Craven Street Wc2',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 154.78501594,
    'coordinate': {'lat': 51.507393, 'lon': -0.124453}
  },
  {
    'id': 'Q42027358',
    'name': 'Embankment Garden Cinema',
    'guestrating': 1,
    'kinds': 'architecture historic ',
    'distance': 155.11863141,
    'coordinate': {'lat': 51.507954, 'lon': -0.123706}
  },
  {
    'id': 'Q26319255',
    'name':
        'Lampstandard Numbered 11 On Island At Head Of Northumberland Avenue',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 155.16631545,
    'coordinate': {'lat': 51.507446, 'lon': -0.127146}
  },
  {
    'id': 'Q29295292',
    'name': 'Bust of Andrew Cunningham, 1st Viscount Cunningham of Hyndhope',
    'guestrating': 2,
    'kinds': 'cultural urban ',
    'distance': 158.9796078,
    'coordinate': {'lat': 51.508301, 'lon': -0.128}
  },
  {
    'id': 'Q26319445',
    'name': 'Former Charing Cross Hospital (East Side)',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 159.42159406,
    'coordinate': {'lat': 51.5098, 'lon': -0.124672}
  },
  {
    'id': 'Q18162604',
    'name': 'Watergate Theatre',
    'guestrating': 2,
    'kinds': 'theatres cultural ',
    'distance': 162.49998032,
    'coordinate': {'lat': 51.508404, 'lon': -0.123408}
  },
  {
    'id': 'Q17527406',
    'name': '12, Buckingham Street Wc2',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 163.43518164,
    'coordinate': {'lat': 51.508301, 'lon': -0.123415}
  },
  {
    'id': 'Q42029727',
    'name': 'Classic Strand',
    'guestrating': 1,
    'kinds': 'architecture historic ',
    'distance': 163.66096488,
    'coordinate': {'lat': 51.509739, 'lon': -0.124393}
  },
  {
    'id': 'Q17550747',
    'name': '19, Buckingham Street Wc2',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 163.95248475,
    'coordinate': {'lat': 51.508499, 'lon': -0.123379}
  },
  {
    'id': 'N346364819',
    'name': 'Lion',
    'guestrating': 1,
    'kinds': 'urban cultural ',
    'distance': 164.34018039,
    'coordinate': {'lat': 51.507851, 'lon': -0.127842}
  },
  {
    'id': 'W107035569',
    'name': 'London Coliseum',
    'guestrating': 7,
    'kinds': 'cultural theatres ',
    'distance': 166.41846297,
    'coordinate': {'lat': 51.509995, 'lon': -0.126217}
  },
  {
    'id': 'N346364767',
    'name': 'Lion',
    'guestrating': 1,
    'kinds': 'urban cultural ',
    'distance': 169.33252555,
    'coordinate': {'lat': 51.507687, 'lon': -0.127771}
  },
  {
    'id': 'R3962877',
    'name': 'Trafalgar Square',
    'guestrating': 3,
    'kinds': 'urban cultural ',
    'distance': 169.46375118,
    'coordinate': {'lat': 51.508038, 'lon': -0.128049}
  },
  {
    'id': 'Q5369920',
    'name': 'Embassy of Zimbabwe, London',
    'guestrating': 7,
    'kinds': 'other unclassified ',
    'distance': 169.60311521,
    'coordinate': {'lat': 51.509602, 'lon': -0.124}
  },
  {
    'id': 'N5325427432',
    'name': 'Samuel Pepys',
    'guestrating': 1,
    'kinds': 'historic monuments ',
    'distance': 170.9814567,
    'coordinate': {'lat': 51.508266, 'lon': -0.123313}
  },
  {
    'id': 'N5333858823',
    'name': 'Thomas Rowlandson',
    'guestrating': 1,
    'kinds': 'historic monuments ',
    'distance': 171.05914256,
    'coordinate': {'lat': 51.509022, 'lon': -0.123405}
  },
  {
    'id': 'Q17549343',
    'name': '13, Buckingham Street Wc2',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 172.59054605,
    'coordinate': {'lat': 51.508202, 'lon': -0.123311}
  },
  {
    'id': 'Q26319811',
    'name': '25–30 Craven Street',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 173.30312972,
    'coordinate': {'lat': 51.507275, 'lon': -0.12426}
  },
  {
    'id': 'Q8055471',
    'name': 'York House, Strand',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 173.8260014,
    'coordinate': {'lat': 51.508099, 'lon': -0.123333}
  },
  {
    'id': 'Q17549691',
    'name': '18, Buckingham Street Wc2',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 174.93178912,
    'coordinate': {'lat': 51.5084, 'lon': -0.123229}
  },
  {
    'id': 'Q27083332',
    'name': 'Trafalgar Buildings',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 175.2078245,
    'coordinate': {'lat': 51.507137, 'lon': -0.126914}
  },
  {
    'id': 'W583919299',
    'name': 'Horatio Nelson, 1st Viscount Nelson, 1st Duke of Bronté, KB',
    'guestrating': 1,
    'kinds': 'historic monuments ',
    'distance': 175.57503355,
    'coordinate': {'lat': 51.507748, 'lon': -0.127936}
  },
  {
    'id': 'W95782139',
    'name': "Nelson's Column",
    'guestrating': 7,
    'kinds': 'historic monuments ',
    'distance': 175.673304,
    'coordinate': {'lat': 51.507748, 'lon': -0.127937}
  },
  {
    'id': 'Q26319078',
    'name': '6 And 7, York Buildings Wc2',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 177.99757596,
    'coordinate': {'lat': 51.508663, 'lon': -0.123185}
  },
  {
    'id': 'Q17549349',
    'name': '17, Buckingham Street Wc2',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 180.81359201,
    'coordinate': {'lat': 51.5084, 'lon': -0.123144}
  },
  {
    'id': 'Q2447876',
    'name': 'Statue of Admiral Lord Nelson',
    'guestrating': 6,
    'kinds': 'cultural urban ',
    'distance': 181.24425139,
    'coordinate': {'lat': 51.507778, 'lon': -0.128056}
  },
  {
    'id': 'Q17550548',
    'name': '14, Buckingham Street Wc2',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 181.98401853,
    'coordinate': {'lat': 51.508099, 'lon': -0.123211}
  },
  {
    'id': 'N346364721',
    'name': 'Lion',
    'guestrating': 1,
    'kinds': 'urban cultural ',
    'distance': 182.87764264,
    'coordinate': {'lat': 51.507805, 'lon': -0.128105}
  },
  {
    'id': 'Q26319256',
    'name': 'Cavell House  National Westminster Bank',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 183.50246045,
    'coordinate': {'lat': 51.509747, 'lon': -0.127527}
  },
  {
    'id': 'W558503738',
    'name': '60, Chandos Place Wc2',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 184.70675567,
    'coordinate': {'lat': 51.510132, 'lon': -0.125037}
  },
  {
    'id': 'Q216185',
    'name': 'Charing Cross',
    'guestrating': 3,
    'kinds': 'historic monuments ',
    'distance': 185.7929572,
    'coordinate': {'lat': 51.507301, 'lon': -0.12755}
  },
  {
    'id': 'Q27081029',
    'name': 'Northumberland House (Victoria Buildings)',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 186.585197,
    'coordinate': {'lat': 51.506863, 'lon': -0.126003}
  },
  {
    'id': 'N346364635',
    'name': 'Lion',
    'guestrating': 1,
    'kinds': 'urban cultural ',
    'distance': 187.37367521,
    'coordinate': {'lat': 51.507645, 'lon': -0.128035}
  },
  {
    'id': 'Q27080887',
    'name': '3, Whitehall Sw1',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 188.096859,
    'coordinate': {'lat': 51.507095, 'lon': -0.127175}
  },
  {
    'id': 'W4372002',
    'name': 'National Gallery',
    'guestrating': 7,
    'kinds': 'museums cultural ',
    'distance': 188.52904464,
    'coordinate': {'lat': 51.508831, 'lon': -0.128413}
  },
  {
    'id': 'N5325427431',
    'name': '',
    'guestrating': 0,
    'kinds': 'historic monuments ',
    'distance': 189.14228421,
    'coordinate': {'lat': 51.508141, 'lon': -0.123088}
  },
  {
    'id': 'W59161723',
    'name': 'National Portrait Gallery',
    'guestrating': 7,
    'kinds': 'museums cultural ',
    'distance': 189.29088853,
    'coordinate': {'lat': 51.509228, 'lon': -0.128228}
  },
  {
    'id': 'W267214563',
    'name': 'Charles I',
    'guestrating': 7,
    'kinds': 'urban cultural ',
    'distance': 189.46150881,
    'coordinate': {'lat': 51.507317, 'lon': -0.127655}
  },
  {
    'id': 'Q27080712',
    'name':
        'Gateway And Railings Across South End Of Street With Retaining Wall Steps Down To Victoria Embankment Gardens',
    'guestrating': 6,
    'kinds': 'fortifications historic ',
    'distance': 191.02793804,
    'coordinate': {'lat': 51.508186, 'lon': -0.123044}
  },
  {
    'id': 'N5325427427',
    'name': 'William Smith',
    'guestrating': 1,
    'kinds': 'historic monuments ',
    'distance': 193.37569318,
    'coordinate': {'lat': 51.508228, 'lon': -0.122997}
  },
  {
    'id': 'Q29295247',
    'name': 'Jellicoe Memorial Fountain',
    'guestrating': 2,
    'kinds': 'fountains historic ',
    'distance': 193.8638011,
    'coordinate': {'lat': 51.507999, 'lon': -0.1284}
  },
  {
    'id': 'W554716415',
    'name': '',
    'guestrating': 0,
    'kinds': 'fountains urban ',
    'distance': 194.31101837,
    'coordinate': {'lat': 51.507984, 'lon': -0.128399}
  },
  {
    'id': 'Q17550593',
    'name': 'Harrington House',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 198.70562431,
    'coordinate': {'lat': 51.506802, 'lon': -0.126451}
  },
  {
    'id': 'Q26319254',
    'name': 'Lampstandard Numbered 7 On Island Adjacent To Charles I Statue',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 199.1511349,
    'coordinate': {'lat': 51.507416, 'lon': -0.127983}
  },
  {
    'id': 'Q6652212',
    'name': 'Little Theatre in the Adelphi',
    'guestrating': 2,
    'kinds': 'theatres cultural ',
    'distance': 200.69889984,
    'coordinate': {'lat': 51.509201, 'lon': -0.123056}
  },
  {
    'id': 'N3007481990',
    'name': 'York Water Gate',
    'guestrating': 1,
    'kinds': 'fortifications defensive ',
    'distance': 201.93477647,
    'coordinate': {'lat': 51.508125, 'lon': -0.122905}
  },
  {
    'id': 'Q17549910',
    'name': '1 And 2, Robert Street Wc2',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 203.6001248,
    'coordinate': {'lat': 51.5089, 'lon': -0.122868}
  },
  {
    'id': 'Q26319422',
    'name': '1-5, Chandos Place Wc2',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 205.28154074,
    'coordinate': {'lat': 51.510075, 'lon': -0.124123}
  },
  {
    'id': 'Q16843027',
    'name': 'High Commission of Nigeria, London',
    'guestrating': 7,
    'kinds': 'historic architecture ',
    'distance': 208.35843941,
    'coordinate': {'lat': 51.506672, 'lon': -0.125377}
  },
  {
    'id': 'N348826086',
    'name': 'Sir Henry Irving',
    'guestrating': 3,
    'kinds': 'historic monuments ',
    'distance': 209.45362855,
    'coordinate': {'lat': 51.509605, 'lon': -0.128215}
  },
  {
    'id': 'R3962876',
    'name': 'Fourth Plinth',
    'guestrating': 2,
    'kinds': 'historic architecture ',
    'distance': 210.03412249,
    'coordinate': {'lat': 51.508163, 'lon': -0.128708}
  },
  {
    'id': 'Q7092401',
    'name': 'One & Other',
    'guestrating': 3,
    'kinds': 'cultural urban ',
    'distance': 211.00756834,
    'coordinate': {'lat': 51.50819, 'lon': -0.12873}
  },
  {
    'id': 'W153342466',
    'name': 'Charles James Napier',
    'guestrating': 3,
    'kinds': 'historic architecture ',
    'distance': 212.32400716,
    'coordinate': {'lat': 51.507744, 'lon': -0.128526}
  },
  {
    'id': 'Q18162002',
    'name': 'Statue of Charles James Napier',
    'guestrating': 7,
    'kinds': 'cultural urban ',
    'distance': 212.71188895,
    'coordinate': {'lat': 51.507702, 'lon': -0.1285}
  },
  {
    'id': 'Q17549918',
    'name': '3, Robert Street Wc2',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 213.39237015,
    'coordinate': {'lat': 51.508801, 'lon': -0.122697}
  },
  {
    'id': 'N4395971090',
    'name': '',
    'guestrating': 0,
    'kinds': 'other unclassified ',
    'distance': 213.0303881,
    'coordinate': {'lat': 51.506649, 'lon': -0.125166}
  },
  {
    'id': 'Q18162015',
    'name': 'Statue of Henry Irving',
    'guestrating': 7,
    'kinds': 'cultural urban ',
    'distance': 213.9558067,
    'coordinate': {'lat': 51.509682, 'lon': -0.12821}
  },
  {
    'id': 'W149173463',
    'name': "Duke of York's",
    'guestrating': 7,
    'kinds': 'cultural theatres ',
    'distance': 215.57313402,
    'coordinate': {'lat': 51.510204, 'lon': -0.1273}
  },
  {
    'id': 'W149173464',
    'name': 'Garrick',
    'guestrating': 7,
    'kinds': 'cultural theatres ',
    'distance': 216.2929505,
    'coordinate': {'lat': 51.509991, 'lon': -0.127795}
  },
  {
    'id': 'Q27080609',
    'name': '67 And 68, Chandos Place Wc2',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 220.9249204,
    'coordinate': {'lat': 51.510361, 'lon': -0.124501}
  },
  {
    'id': 'Q5464823',
    'name': 'Folly Theatre',
    'guestrating': 3,
    'kinds': 'theatres cultural ',
    'distance': 223.21435279,
    'coordinate': {'lat': 51.5075, 'lon': -0.122981}
  },
  {
    'id': 'W104081019',
    'name': 'Playhouse Theatre',
    'guestrating': 7,
    'kinds': 'cultural theatres ',
    'distance': 225.12312203,
    'coordinate': {'lat': 51.506966, 'lon': -0.123683}
  },
  {
    'id': 'Q26319280',
    'name': '2 Lamp Posts Numbered 7 And 8',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 225.19292541,
    'coordinate': {'lat': 51.510303, 'lon': -0.124175}
  },
  {
    'id': 'N3211564198',
    'name': 'Statue of James II',
    'guestrating': 7,
    'kinds': 'historic monuments ',
    'distance': 228.22878176,
    'coordinate': {'lat': 51.508461, 'lon': -0.129026}
  },
  {
    'id': 'Q26319394',
    'name': '44, Bedford Street Wc2',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 229.11385629,
    'coordinate': {'lat': 51.510197, 'lon': -0.123805}
  },
  {
    'id': 'Q27083300',
    'name': 'Uganda House',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 231.37211513,
    'coordinate': {'lat': 51.507217, 'lon': -0.128323}
  },
  {
    'id': 'Q27084000',
    'name': 'Aldine House',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 231.27365583,
    'coordinate': {'lat': 51.510479, 'lon': -0.124586}
  },
  {
    'id': 'W149173486',
    'name': 'Victoria Embankment Open Air Theatre',
    'guestrating': 3,
    'kinds': 'gardens urban ',
    'distance': 232.57196698,
    'coordinate': {'lat': 51.507877, 'lon': -0.122557}
  },
  {
    'id': 'W547522392',
    'name': 'Silver Cross',
    'guestrating': 7,
    'kinds': 'historic architecture ',
    'distance': 232.26433582,
    'coordinate': {'lat': 51.506596, 'lon': -0.127003}
  },
  {
    'id': 'Q27080617',
    'name': '1, Charing Cross Road Wc2',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 235.7204047,
    'coordinate': {'lat': 51.509609, 'lon': -0.128661}
  },
  {
    'id': 'W547522399',
    'name': 'The Old Shades',
    'guestrating': 7,
    'kinds': 'historic architecture ',
    'distance': 240.4792728,
    'coordinate': {'lat': 51.506477, 'lon': -0.126818}
  },
  {
    'id': 'Q6904072',
    'name': 'Montagu House, Whitehall',
    'guestrating': 3,
    'kinds': 'palaces architecture ',
    'distance': 241.22528819,
    'coordinate': {'lat': 51.506401, 'lon': -0.126389}
  },
  {
    'id': 'Q16901753',
    'name': 'Tivoli Music Hall, London',
    'guestrating': 3,
    'kinds': 'theatres cultural ',
    'distance': 242.08965351,
    'coordinate': {'lat': 51.509701, 'lon': -0.1228}
  },
  {
    'id': 'Q17549618',
    'name': '4 And 6, John Adam Street Wc2',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 243.62402569,
    'coordinate': {'lat': 51.509499, 'lon': -0.122594}
  },
  {
    'id': 'Q26319423',
    'name': '14-16, Bedford Street Wc2',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 247.50782665,
    'coordinate': {'lat': 51.510647, 'lon': -0.124635}
  },
  {
    'id': 'Q27084695',
    'name': '1, Great Scotland Yard Sw1',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 248.09735558,
    'coordinate': {'lat': 51.506386, 'lon': -0.126728}
  },
  {
    'id': 'Q20714174',
    'name': 'Whitehall House',
    'guestrating': 7,
    'kinds': 'historic architecture ',
    'distance': 250.291074,
    'coordinate': {'lat': 51.506401, 'lon': -0.1269}
  },
  {
    'id': 'W160683916',
    'name': 'Westminster Quaker Meeting House',
    'guestrating': 7,
    'kinds': 'religion churches ',
    'distance': 250.69012588,
    'coordinate': {'lat': 51.510746, 'lon': -0.126385}
  },
  {
    'id': 'Q58333663',
    'name': 'The Adelphi',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 253.82198812,
    'coordinate': {'lat': 51.509102, 'lon': -0.1222}
  },
  {
    'id': 'Q27084005',
    'name':
        'Ventilation Lamp Standard Numbered 35 On Island North Of Irving Street',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 253.67711575,
    'coordinate': {'lat': 51.510117, 'lon': -0.128362}
  },
  {
    'id': 'N5387300634',
    'name': 'Joseph Mallord William Turner R.A.',
    'guestrating': 1,
    'kinds': 'historic monuments ',
    'distance': 254.47320943,
    'coordinate': {'lat': 51.510384, 'lon': -0.123594}
  },
  {
    'id': 'Q27080631',
    'name': '17-19, Bedford Street Wc2',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 256.36372868,
    'coordinate': {'lat': 51.510757, 'lon': -0.124786}
  },
  {
    'id': 'W168980864',
    'name': 'Garrick Arms',
    'guestrating': 7,
    'kinds': 'historic architecture ',
    'distance': 257.02832561,
    'coordinate': {'lat': 51.510338, 'lon': -0.128044}
  },
  {
    'id': 'Q17550491',
    'name': '2, John Adam Street Wc2',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 258.25253085,
    'coordinate': {'lat': 51.509602, 'lon': -0.122439}
  },
  {
    'id': 'N581058547',
    'name': 'The Admiralty',
    'guestrating': 7,
    'kinds': 'historic architecture ',
    'distance': 259.25171126,
    'coordinate': {'lat': 51.507275, 'lon': -0.128886}
  },
  {
    'id': 'Q58350464',
    'name': 'Theatre Royal Adelphi',
    'guestrating': 2,
    'kinds': 'architecture historic ',
    'distance': 259.34244497,
    'coordinate': {'lat': 51.510078, 'lon': -0.12295}
  },
  {
    'id': 'Q58350582',
    'name': 'Adelphi Theatre',
    'guestrating': 1,
    'kinds': 'architecture historic ',
    'distance': 259.34244497,
    'coordinate': {'lat': 51.510078, 'lon': -0.12295}
  },
  {
    'id': 'Q58350527',
    'name': 'Adelphi Theatre',
    'guestrating': 1,
    'kinds': 'architecture historic ',
    'distance': 259.34244497,
    'coordinate': {'lat': 51.510078, 'lon': -0.12295}
  },
  {
    'id': 'Q42030069',
    'name': 'Lumière Cinema',
    'guestrating': 1,
    'kinds': 'cinemas cultural ',
    'distance': 260.35562444,
    'coordinate': {'lat': 51.510738, 'lon': -0.126972}
  },
  {
    'id': 'Q17549395',
    'name': '18, Adam Street Wc2',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 264.99103322,
    'coordinate': {'lat': 51.509602, 'lon': -0.12233}
  },
  {
    'id': 'W313005904',
    'name': 'Adelphi Theatre',
    'guestrating': 7,
    'kinds': 'cultural theatres ',
    'distance': 264.94876738,
    'coordinate': {'lat': 51.510235, 'lon': -0.123078}
  },
  {
    'id': 'Q17549462',
    'name': "1–8 Goodwin's Court",
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 267.57393126,
    'coordinate': {'lat': 51.510899, 'lon': -0.126395}
  },
  {
    'id': 'Q27087659',
    'name': 'K6 Telephone Kiosk',
    'guestrating': 6,
    'kinds': 'other red ',
    'distance': 268.47541581,
    'coordinate': {'lat': 51.508278, 'lon': -0.129586}
  },
  {
    'id': 'Q27081648',
    'name': 'Rear Premises Of The Adelphi Theatre',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 268.29532927,
    'coordinate': {'lat': 51.510426, 'lon': -0.123348}
  },
  {
    'id': 'W140469329',
    'name': 'Trafalgar Studios',
    'guestrating': 7,
    'kinds': 'cultural theatres ',
    'distance': 269.43715342,
    'coordinate': {'lat': 51.506451, 'lon': -0.127733}
  },
  {
    'id': 'Q27081588',
    'name': '409 And 410, Strand Wc2',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 271.34363315,
    'coordinate': {'lat': 51.510155, 'lon': -0.122827}
  },
  {
    'id': 'Q27084751',
    'name': '23 And 24, Bedfordbury Wc2',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 272.06442596,
    'coordinate': {'lat': 51.510971, 'lon': -0.125999}
  },
  {
    'id': 'Q21292961',
    'name': 'Statue of Wilfrid Lawson',
    'guestrating': 7,
    'kinds': 'historic cultural ',
    'distance': 273.56501103,
    'coordinate': {'lat': 51.508499, 'lon': -0.1218}
  },
  {
    'id': 'W487479499',
    'name': 'Nell Gwynne Tavern',
    'guestrating': 7,
    'kinds': 'historic architecture ',
    'distance': 276.88228968,
    'coordinate': {'lat': 51.510242, 'lon': -0.122846}
  },
  {
    'id': 'Q26319568',
    'name': 'Alginate House',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 280.11901328,
    'coordinate': {'lat': 51.510918, 'lon': -0.124467}
  },
  {
    'id': 'Q27083353',
    'name': '6, New Row Wc2',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 281.00552704,
    'coordinate': {'lat': 51.511024, 'lon': -0.126359}
  },
  {
    'id': 'Q27083346',
    'name': '7, New Row Wc2',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 281.20294628,
    'coordinate': {'lat': 51.511036, 'lon': -0.126267}
  },
  {
    'id': 'Q27080989',
    'name': '9, New Row Wc2',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 281.29142355,
    'coordinate': {'lat': 51.511047, 'lon': -0.126105}
  },
  {
    'id': 'Q27083344',
    'name': '10, New Row Wc2',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 281.35722782,
    'coordinate': {'lat': 51.511051, 'lon': -0.126016}
  },
  {
    'id': 'Q27080982',
    'name': '4 And 5, New Row Wc2',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 281.44039567,
    'coordinate': {'lat': 51.511017, 'lon': -0.126481}
  },
  {
    'id': 'Q27080975',
    'name': '8, New Row Wc2',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 281.67087611,
    'coordinate': {'lat': 51.511047, 'lon': -0.126191}
  },
  {
    'id': 'Q27084766',
    'name': '5 Lamp Posts Numbered 1 To 5',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 281.72319476,
    'coordinate': {'lat': 51.510967, 'lon': -0.124638}
  },
  {
    'id': 'N3109822562',
    'name': 'Imperial Camel Corps Memorial',
    'guestrating': 7,
    'kinds': 'historic monuments ',
    'distance': 282.5159267,
    'coordinate': {'lat': 51.508499, 'lon': -0.121671}
  },
  {
    'id': 'Q27083605',
    'name': '16 And 17, Maiden Lane Wc2',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 282.09631706,
    'coordinate': {'lat': 51.510571, 'lon': -0.123327}
  },
  {
    'id': 'Q27083352',
    'name': '3, New Row Wc2',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 281.87257836,
    'coordinate': {'lat': 51.511002, 'lon': -0.126622}
  },
  {
    'id': 'N25507018',
    'name': 'Royal Tank Regiment Memorial',
    'guestrating': 3,
    'kinds': 'historic monuments ',
    'distance': 281.96319072,
    'coordinate': {'lat': 51.506126, 'lon': -0.124453}
  },
  {
    'id': 'W382310651',
    'name': 'Admiralty Arch',
    'guestrating': 7,
    'kinds': 'historic architecture ',
    'distance': 282.76395573,
    'coordinate': {'lat': 51.506737, 'lon': -0.128626}
  },
  {
    'id': 'Q42030405',
    'name': 'Theatre de Luxe',
    'guestrating': 1,
    'kinds': 'architecture historic ',
    'distance': 283.16372946,
    'coordinate': {'lat': 51.510014, 'lon': -0.122427}
  },
  {
    'id': 'Q41966029',
    'name': 'Charing Cross Cinema',
    'guestrating': 1,
    'kinds': 'architecture historic ',
    'distance': 283.16372946,
    'coordinate': {'lat': 51.510014, 'lon': -0.122427}
  },
  {
    'id': 'Q27080994',
    'name': '13, New Row Wc2',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 282.71482237,
    'coordinate': {'lat': 51.51107, 'lon': -0.125709}
  },
  {
    'id': 'Q52984670',
    'name': 'Sainsbury Wing',
    'guestrating': 6,
    'kinds': 'museums cultural ',
    'distance': 283.51004384,
    'coordinate': {'lat': 51.508598, 'lon': -0.129822}
  },
  {
    'id': 'Q17549263',
    'name': '55 Whitehall',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 283.039576,
    'coordinate': {'lat': 51.506001, 'lon': -0.126167}
  },
  {
    'id': 'Q27083351',
    'name': '2 And 2A, New Row Wc2',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 283.38723577,
    'coordinate': {'lat': 51.511002, 'lon': -0.126724}
  },
  {
    'id': 'Q27087711',
    'name': 'Pair Of K6 Telephone Kiosks',
    'guestrating': 5,
    'kinds': 'other red ',
    'distance': 284.17221201,
    'coordinate': {'lat': 51.506157, 'lon': -0.12725}
  },
  {
    'id': 'Q18207334',
    'name': 'Angel and Crown',
    'guestrating': 7,
    'kinds': 'historic architecture ',
    'distance': 284.91109397,
    'coordinate': {'lat': 51.51099, 'lon': -0.126869}
  },
  {
    'id': 'Q27080974',
    'name': '1, New Row Wc2',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 284.93985925,
    'coordinate': {'lat': 51.511002, 'lon': -0.126813}
  },
  {
    'id': 'Q27084753',
    'name': '33, Bedford Street Wc2',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 285.38026557,
    'coordinate': {'lat': 51.510983, 'lon': -0.124528}
  },
  {
    'id': 'Q1807425',
    'name': 'National Liberal Club',
    'guestrating': 7,
    'kinds': 'historic architecture ',
    'distance': 285.68670569,
    'coordinate': {'lat': 51.506302, 'lon': -0.1237}
  },
  {
    'id': 'W151297126',
    'name': 'The Salisbury',
    'guestrating': 7,
    'kinds': 'historic architecture ',
    'distance': 285.80291384,
    'coordinate': {'lat': 51.510929, 'lon': -0.127207}
  },
  {
    'id': 'N305760823',
    'name': 'The White Swan',
    'guestrating': 7,
    'kinds': 'historic architecture ',
    'distance': 286.99841203,
    'coordinate': {'lat': 51.511105, 'lon': -0.125528}
  },
  {
    'id': 'W4254099',
    'name': 'Victoria Embankment Gardens',
    'guestrating': 3,
    'kinds': 'gardens urban ',
    'distance': 287.82336733,
    'coordinate': {'lat': 51.508541, 'lon': -0.121594}
  },
  {
    'id': 'N969138215',
    'name': 'Frenchie Covent Garden',
    'guestrating': 1,
    'kinds': 'cultural cinemas ',
    'distance': 287.43702003,
    'coordinate': {'lat': 51.510841, 'lon': -0.123886}
  },
  {
    'id': 'Q27081630',
    'name': 'Hungerford House',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 288.0048045,
    'coordinate': {'lat': 51.507366, 'lon': -0.122034}
  },
  {
    'id': 'Q17549549',
    'name': '6-10, Adam Street Wc2',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 288.16385653,
    'coordinate': {'lat': 51.509701, 'lon': -0.122037}
  },
  {
    'id': 'W150920322',
    'name': 'Orange St Congregational Church',
    'guestrating': 1,
    'kinds': 'religion other ',
    'distance': 291.92887482,
    'coordinate': {'lat': 51.509617, 'lon': -0.129567}
  },
  {
    'id': 'Q26319569',
    'name': '23 And 24, Henrietta Street Wc2',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 291.72495775,
    'coordinate': {'lat': 51.510998, 'lon': -0.12432}
  },
  {
    'id': 'Q27080633',
    'name': 'Gateway To Inigo Place And St Pauls Churchyard',
    'guestrating': 5,
    'kinds': 'fortifications historic ',
    'distance': 293.19268418,
    'coordinate': {'lat': 51.511089, 'lon': -0.124738}
  },
  {
    'id': 'Q27086018',
    'name': '3 Lampstandards Numbered 1, 2 And 3',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 294.09286337,
    'coordinate': {'lat': 51.511082, 'lon': -0.126838}
  },
  {
    'id': 'Q27086016',
    'name': '23 And 23A, New Row Wc2',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 295.48063516,
    'coordinate': {'lat': 51.51115, 'lon': -0.126417}
  },
  {
    'id': 'Q27080997',
    'name': '24, New Row Wc2',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 296.116238,
    'coordinate': {'lat': 51.511143, 'lon': -0.126559}
  },
  {
    'id': 'Q27086017',
    'name': '25, New Row Wc2',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 296.28260898,
    'coordinate': {'lat': 51.511135, 'lon': -0.126626}
  },
  {
    'id': 'N26573161',
    'name': 'Odeon Mezzanine',
    'guestrating': 1,
    'kinds': 'cultural cinemas ',
    'distance': 298.34649786,
    'coordinate': {'lat': 51.510216, 'lon': -0.129084}
  },
  {
    'id': 'Q27080996',
    'name': '17 And 18, New Row Wc2',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 298.82048877,
    'coordinate': {'lat': 51.511215, 'lon': -0.125899}
  },
  {
    'id': 'N821344049',
    'name': 'Paul',
    'guestrating': 7,
    'kinds': 'religion historic ',
    'distance': 298.96419488,
    'coordinate': {'lat': 51.51115, 'lon': -0.124778}
  },
  {
    'id': 'Q27083345',
    'name': '16, New Row Wc2',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 299.19718774,
    'coordinate': {'lat': 51.511219, 'lon': -0.125795}
  },
  {
    'id': 'N973036660',
    'name': '',
    'guestrating': 0,
    'kinds': 'historic monuments ',
    'distance': 301.53358468,
    'coordinate': {'lat': 51.511024, 'lon': -0.124045}
  },
  {
    'id': 'N4815338502',
    'name': 'Scotland Yard',
    'guestrating': 1,
    'kinds': 'historic monuments ',
    'distance': 302.54294782,
    'coordinate': {'lat': 51.505833, 'lon': -0.126282}
  },
  {
    'id': 'Q27080690',
    'name': 'Oceanic House',
    'guestrating': 7,
    'kinds': 'historic architecture ',
    'distance': 304.2596338,
    'coordinate': {'lat': 51.507877, 'lon': -0.129996}
  },
  {
    'id': 'W4361223',
    'name': 'Cecil Court',
    'guestrating': 3,
    'kinds': 'urban cultural ',
    'distance': 305.22135013,
    'coordinate': {'lat': 51.510712, 'lon': -0.128403}
  },
  {
    'id': 'Q24883304',
    'name': 'Westminster Reference Library',
    'guestrating': 7,
    'kinds': 'historic architecture ',
    'distance': 307.73922468,
    'coordinate': {'lat': 51.50964, 'lon': -0.1298}
  },
  {
    'id': 'Q20054478',
    'name': 'Statue of James Outram',
    'guestrating': 7,
    'kinds': 'cultural urban ',
    'distance': 308.88126293,
    'coordinate': {'lat': 51.506302, 'lon': -0.12309}
  },
  {
    'id': 'Q18392694',
    'name': "St Peter's Hospital",
    'guestrating': 7,
    'kinds': 'historic architecture ',
    'distance': 310.15627565,
    'coordinate': {'lat': 51.511101, 'lon': -0.124013}
  },
  {
    'id': 'Q27084661',
    'name': '5, Garrick Street Wc2',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 310.19112834,
    'coordinate': {'lat': 51.511318, 'lon': -0.125762}
  },
  {
    'id': 'W558928361',
    'name': 'Rules',
    'guestrating': 7,
    'kinds': 'historic architecture ',
    'distance': 310.99874781,
    'coordinate': {'lat': 51.51083, 'lon': -0.123191}
  },
  {
    'id': 'W146481556',
    'name': 'Noël Coward Theatre',
    'guestrating': 7,
    'kinds': 'cultural theatres ',
    'distance': 310.87388783,
    'coordinate': {'lat': 51.51112, 'lon': -0.127428}
  },
  {
    'id': 'W99952331',
    'name': 'The Vaudeville Theatre',
    'guestrating': 7,
    'kinds': 'cultural theatres ',
    'distance': 312.24216226,
    'coordinate': {'lat': 51.510532, 'lon': -0.122586}
  },
  {
    'id': 'N3012177152',
    'name': 'Sir James Outram',
    'guestrating': 3,
    'kinds': 'historic monuments ',
    'distance': 313.5352709,
    'coordinate': {'lat': 51.506252, 'lon': -0.123083}
  },
  {
    'id': 'Q27081647',
    'name': 'Rear Premises Of The Vaudeville Theatre',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 314.64833764,
    'coordinate': {'lat': 51.510708, 'lon': -0.122849}
  },
  {
    'id': 'Q27084752',
    'name': '27 And 28, Bedford Street Wc2',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 316.78630322,
    'coordinate': {'lat': 51.511322, 'lon': -0.124837}
  },
  {
    'id': 'N968689951',
    'name': '',
    'guestrating': 0,
    'kinds': 'historic monuments ',
    'distance': 317.92396781,
    'coordinate': {'lat': 51.51009, 'lon': -0.121905}
  },
  {
    'id': 'Q27081502',
    'name': "62, St Martin's Lane Wc2",
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 317.51254358,
    'coordinate': {'lat': 51.511284, 'lon': -0.126945}
  },
  {
    'id': 'Q27084861',
    'name': '3-13, Whitcomb Street Wc2',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 318.60494832,
    'coordinate': {'lat': 51.508541, 'lon': -0.130329}
  },
  {
    'id': 'Q27081387',
    'name': '9 And 10, Henrietta Street Wc2',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 320.46724478,
    'coordinate': {'lat': 51.511051, 'lon': -0.123513}
  },
  {
    'id': 'W180571964',
    'name': 'Odeon Leicester Square',
    'guestrating': 3,
    'kinds': 'cultural cinemas ',
    'distance': 320.79166922,
    'coordinate': {'lat': 51.510521, 'lon': -0.129085}
  },
  {
    'id': 'Q27080504',
    'name': '9-13, Garrick Street Wc2',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 320.94325228,
    'coordinate': {'lat': 51.511406, 'lon': -0.126077}
  },
  {
    'id': 'N1968744146',
    'name': '',
    'guestrating': 0,
    'kinds': 'historic monuments ',
    'distance': 322.09080662,
    'coordinate': {'lat': 51.507263, 'lon': -0.12157}
  },
  {
    'id': 'Q27081628',
    'name': 'W. S. Gilbert Memorial',
    'guestrating': 6,
    'kinds': 'historic cultural ',
    'distance': 322.95847649,
    'coordinate': {'lat': 51.50716, 'lon': -0.121639}
  },
  {
    'id': 'Q26319158',
    'name': 'K6 Telephone Kiosk By Hungerford Bridge',
    'guestrating': 5,
    'kinds': 'other red ',
    'distance': 324.51543759,
    'coordinate': {'lat': 51.507, 'lon': -0.12176}
  },
  {
    'id': 'Q27083288',
    'name': 'Former United University Club',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 326.43229937,
    'coordinate': {'lat': 51.508289, 'lon': -0.130426}
  },
  {
    'id': 'W146481554',
    'name': 'Browns',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 325.71785143,
    'coordinate': {'lat': 51.511295, 'lon': -0.12728}
  },
  {
    'id': 'N639179083',
    'name': 'Leicester Square Kitchen',
    'guestrating': 1,
    'kinds': 'cultural cinemas ',
    'distance': 326.87618981,
    'coordinate': {'lat': 51.509899, 'lon': -0.129906}
  },
  {
    'id': 'Q27080740',
    'name': '15, King Street Wc2',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 326.28820816,
    'coordinate': {'lat': 51.511391, 'lon': -0.124707}
  },
  {
    'id': 'Q27081388',
    'name': '5 Lampstandards Numbered 1 To 5',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 326.57516707,
    'coordinate': {'lat': 51.511177, 'lon': -0.123707}
  },
  {
    'id': 'Q27083668',
    'name': '26, King Street Wc2',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 329.44210402,
    'coordinate': {'lat': 51.511482, 'lon': -0.125369}
  },
  {
    'id': 'R78595',
    'name': 'Shell Mex House',
    'guestrating': 7,
    'kinds': 'historic architecture ',
    'distance': 331.23597877,
    'coordinate': {'lat': 51.509693, 'lon': -0.121348}
  },
  {
    'id': 'Q24088427',
    'name': 'Statue of Robert Burns',
    'guestrating': 6,
    'kinds': 'cultural urban ',
    'distance': 331.64997953,
    'coordinate': {'lat': 51.5089, 'lon': -0.121}
  },
  {
    'id': 'Q58454576',
    'name': 'Old War Office Building',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 330.99408386,
    'coordinate': {'lat': 51.505554, 'lon': -0.125833}
  },
  {
    'id': 'Q27080741',
    'name': '14, King Street Wc2',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 331.11794498,
    'coordinate': {'lat': 51.511425, 'lon': -0.124634}
  },
  {
    'id': 'Q26319570',
    'name': '30, Henrietta Street Wc2',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 331.69881154,
    'coordinate': {'lat': 51.511234, 'lon': -0.123734}
  },
  {
    'id': 'W139940240',
    'name': "Wyndham's",
    'guestrating': 7,
    'kinds': 'cultural theatres ',
    'distance': 332.03136791,
    'coordinate': {'lat': 51.511147, 'lon': -0.128041}
  },
  {
    'id': 'Q26319567',
    'name': '7 And 8, Henrietta Street Wc2',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 332.49940946,
    'coordinate': {'lat': 51.511124, 'lon': -0.123357}
  },
  {
    'id': 'Q17526964',
    'name': 'The Admiralty And The Admiralty Screen',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 333.74008776,
    'coordinate': {'lat': 51.505798, 'lon': -0.127732}
  },
  {
    'id': 'Q17550131',
    'name': '5, Suffolk Street Sw1',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 334.7269844,
    'coordinate': {'lat': 51.508499, 'lon': -0.130561}
  },
  {
    'id': 'Q27081399',
    'name': 'Admiralty Extension',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 334.45316626,
    'coordinate': {'lat': 51.506023, 'lon': -0.128403}
  },
  {
    'id': 'Q27080742',
    'name': '27 And 28, King Street Wc2',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 334.86957068,
    'coordinate': {'lat': 51.51152, 'lon': -0.125187}
  },
  {
    'id': 'Q17550271',
    'name': '6, Suffolk Street Sw1',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 336.60519995,
    'coordinate': {'lat': 51.508598, 'lon': -0.130587}
  },
  {
    'id': 'N2345097821',
    'name': 'Sir Mortimer Wheeler',
    'guestrating': 1,
    'kinds': 'historic monuments ',
    'distance': 336.7306923,
    'coordinate': {'lat': 51.509113, 'lon': -0.130499}
  },
  {
    'id': 'Q26319850',
    'name': '20 Cockspur Street',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 336.6728369,
    'coordinate': {'lat': 51.507523, 'lon': -0.130313}
  },
  {
    'id': 'N3191837139',
    'name': 'Cheylesmore Memorial',
    'guestrating': 7,
    'kinds': 'historic monuments ',
    'distance': 337.36655529,
    'coordinate': {'lat': 51.508801, 'lon': -0.1209}
  },
  {
    'id': 'Q20054029',
    'name': 'Two Chairmen',
    'guestrating': 7,
    'kinds': 'historic architecture ',
    'distance': 337.56358938,
    'coordinate': {'lat': 51.507374, 'lon': -0.130235}
  },
  {
    'id': 'Q27083997',
    'name': "8 Lampstandards On Dwarf Stone Walls In St Paul's Churchyard",
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 337.14866919,
    'coordinate': {'lat': 51.51136, 'lon': -0.124012}
  },
  {
    'id': 'Q195905',
    'name': 'Canada House',
    'guestrating': 7,
    'kinds': 'historic architecture ',
    'distance': 337.96500086,
    'coordinate': {'lat': 51.509998, 'lon': -0.13}
  },
  {
    'id': 'Q19902765',
    'name': 'Equestrian statue of George III',
    'guestrating': 6,
    'kinds': 'cultural urban ',
    'distance': 340.31160573,
    'coordinate': {'lat': 51.507801, 'lon': -0.1305}
  },
  {
    'id': 'W99952319',
    'name': 'Corpus Christi Catholic Church',
    'guestrating': 7,
    'kinds': 'religion other ',
    'distance': 340.2602172,
    'coordinate': {'lat': 51.510807, 'lon': -0.122466}
  },
  {
    'id': 'Q26456315',
    'name': 'Bazalgette Memorial',
    'guestrating': 7,
    'kinds': 'historic cultural ',
    'distance': 341.41869679,
    'coordinate': {'lat': 51.506401, 'lon': -0.1222}
  },
  {
    'id': 'Q27080743',
    'name': '29 And 30, King Street Wc2',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 341.81741339,
    'coordinate': {'lat': 51.51157, 'lon': -0.125028}
  },
  {
    'id': 'Q27080505',
    'name': '17-21, Garrick Street Wc2',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 341.88714221,
    'coordinate': {'lat': 51.511551, 'lon': -0.12665}
  },
  {
    'id': 'N345863425',
    'name': 'Royal Marines',
    'guestrating': 7,
    'kinds': 'historic monuments ',
    'distance': 344.14346999,
    'coordinate': {'lat': 51.506538, 'lon': -0.129532}
  },
  {
    'id': 'N345876970',
    'name': 'George III',
    'guestrating': 3,
    'kinds': 'historic monuments ',
    'distance': 344.94920158,
    'coordinate': {'lat': 51.507782, 'lon': -0.130562}
  },
  {
    'id': 'W466992723',
    'name': '',
    'guestrating': 0,
    'kinds': 'interesting natural ',
    'distance': 345.29931295,
    'coordinate': {'lat': 51.507908, 'lon': -0.120867}
  },
  {
    'id': 'Q17550133',
    'name': '6 1/2 And 7, Suffolk Street Sw1',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 345.55901201,
    'coordinate': {'lat': 51.508598, 'lon': -0.130716}
  },
  {
    'id': 'N2841921180',
    'name': 'Thames Rib Experience',
    'guestrating': 1,
    'kinds': 'other unclassified ',
    'distance': 345.48759368,
    'coordinate': {'lat': 51.506927, 'lon': -0.121477}
  },
  {
    'id': 'Q27083697',
    'name': '5 And 6, Henrietta Street Wc2',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 346.21441491,
    'coordinate': {'lat': 51.5112, 'lon': -0.123176}
  },
  {
    'id': 'N25507022',
    'name': 'Anglo-Belgian War Memorial',
    'guestrating': 7,
    'kinds': 'historic monuments ',
    'distance': 347.29588879,
    'coordinate': {'lat': 51.508656, 'lon': -0.120742}
  },
  {
    'id': 'N603129378',
    'name': 'Le Garrick',
    'guestrating': 7,
    'kinds': 'historic architecture ',
    'distance': 346.72776187,
    'coordinate': {'lat': 51.511639, 'lon': -0.126049}
  },
  {
    'id': 'N345863424',
    'name': 'Captain James Cook',
    'guestrating': 7,
    'kinds': 'historic monuments ',
    'distance': 347.88646295,
    'coordinate': {'lat': 51.506313, 'lon': -0.129275}
  },
  {
    'id': 'W4256950',
    'name': 'Whitehall Garden',
    'guestrating': 7,
    'kinds': 'historical historic ',
    'distance': 348.3576035,
    'coordinate': {'lat': 51.505795, 'lon': -0.123297}
  },
  {
    'id': 'N3012192161',
    'name': 'Joseph Bazalgette',
    'guestrating': 3,
    'kinds': 'historic monuments ',
    'distance': 348.90729394,
    'coordinate': {'lat': 51.506191, 'lon': -0.122393}
  },
  {
    'id': 'Q27084616',
    'name': '2 Lampstandards Numbered 2 And 3 By George Iii Statue',
    'guestrating': 5,
    'kinds': 'cultural urban ',
    'distance': 350.32444371,
    'coordinate': {'lat': 51.507797, 'lon': -0.130648}
  },
  {
    'id': 'Q27083663',
    'name': '31 And 32, King Street Wc2',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 350.26422914,
    'coordinate': {'lat': 51.511635, 'lon': -0.124888}
  },
  {
    'id': 'Q27080694',
    'name': '17-19, Cockspur Street Sw1',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 351.42704766,
    'coordinate': {'lat': 51.507507, 'lon': -0.13053}
  },
  {
    'id': 'Q3349143',
    'name': 'Odeon West End',
    'guestrating': 3,
    'kinds': 'accomodations cinemas ',
    'distance': 351.36720144,
    'coordinate': {'lat': 51.509899, 'lon': -0.1303}
  },
  {
    'id': 'Q27081650',
    'name': '42, Maiden Lane Wc2',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 351.90298371,
    'coordinate': {'lat': 51.511032, 'lon': -0.122637}
  },
  {
    'id': 'Q17550154',
    'name': '8, 9 And 11, Suffolk Street Sw1',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 354.31378106,
    'coordinate': {'lat': 51.508801, 'lon': -0.130825}
  },
  {
    'id': 'Q21286428',
    'name': 'Statue of Henry Bartle Frere',
    'guestrating': 7,
    'kinds': 'cultural urban ',
    'distance': 354.30480368,
    'coordinate': {'lat': 51.505699, 'lon': -0.1234}
  },
  {
    'id': 'Q27083062',
    'name': "70, St Martin's Lane Wc2",
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 355.08927841,
    'coordinate': {'lat': 51.511627, 'lon': -0.126963}
  },
  {
    'id': 'Q27080750',
    'name': '6 Lampstandards, Numbered 2 To 7',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 355.72040896,
    'coordinate': {'lat': 51.51162, 'lon': -0.124424}
  },
  {
    'id': 'Q779754',
    'name': 'Admiralty House',
    'guestrating': 7,
    'kinds': 'historic architecture ',
    'distance': 356.26905832,
    'coordinate': {'lat': 51.505501, 'lon': -0.1274}
  },
  {
    'id': 'Q27080744',
    'name': '33, King Street Wc2',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 356.53327614,
    'coordinate': {'lat': 51.511677, 'lon': -0.124771}
  },
  {
    'id': 'W565171598',
    'name': 'The Lamb and Flag',
    'guestrating': 7,
    'kinds': 'historic architecture ',
    'distance': 356.56849539,
    'coordinate': {'lat': 51.511734, 'lon': -0.125619}
  },
  {
    'id': 'Q26319566',
    'name': '4, Henrietta Street Wc2',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 356.94974737,
    'coordinate': {'lat': 51.511257, 'lon': -0.123033}
  },
  {
    'id': 'Q17550279',
    'name': '12-14, Suffolk Street Sw1',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 358.04950026,
    'coordinate': {'lat': 51.508801, 'lon': -0.130879}
  },
  {
    'id': 'Q27083666',
    'name': '8, King Street Wc2',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 359.51911829,
    'coordinate': {'lat': 51.511623, 'lon': -0.124246}
  },
  {
    'id': 'Q17550128',
    'name': '1–4 and 23 Suffolk Place and 3 Haymarket',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 361.24402427,
    'coordinate': {'lat': 51.5084, 'lon': -0.130939}
  },
  {
    'id': 'N3012177137',
    'name': 'Henry Bartle Frere',
    'guestrating': 3,
    'kinds': 'historic monuments ',
    'distance': 361.17977581,
    'coordinate': {'lat': 51.505642, 'lon': -0.123363}
  },
  {
    'id': 'W583930364',
    'name': '',
    'guestrating': 0,
    'kinds': 'fountains urban ',
    'distance': 361.29485205,
    'coordinate': {'lat': 51.511463, 'lon': -0.123503}
  },
  {
    'id': 'W173544229',
    'name': "St Paul's Church",
    'guestrating': 7,
    'kinds': 'religion churches ',
    'distance': 361.75685154,
    'coordinate': {'lat': 51.511528, 'lon': -0.123719}
  },
  {
    'id': 'Q17550761',
    'name':
        'Former Paymaster Generals Office Former Paymaster Generals Office (the Parliamentary Counsel)',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 361.90566872,
    'coordinate': {'lat': 51.505402, 'lon': -0.127159}
  },
  {
    'id': 'Q17550061',
    'name': '27 Southampton Street',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 362.65065209,
    'coordinate': {'lat': 51.511101, 'lon': -0.122527}
  },
  {
    'id': 'Q17550155',
    'name': '20-22, Suffolk Street Sw1',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 363.815808,
    'coordinate': {'lat': 51.508499, 'lon': -0.13098}
  },
  {
    'id': 'Q27081386',
    'name': '3, Henrietta Street Wc2',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 363.88969431,
    'coordinate': {'lat': 51.511299, 'lon': -0.122953}
  },
  {
    'id': 'W183361415',
    'name': 'Lima',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 363.96241933,
    'coordinate': {'lat': 51.511791, 'lon': -0.126162}
  },
  {
    'id': 'N571836758',
    'name': 'Shakespeare',
    'guestrating': 7,
    'kinds': 'fountains historic ',
    'distance': 365.15844457,
    'coordinate': {'lat': 51.510384, 'lon': -0.130082}
  },
  {
    'id': 'W570094181',
    'name': 'Shakespeare Fountain',
    'guestrating': 7,
    'kinds': 'fountains historic ',
    'distance': 365.37581738,
    'coordinate': {'lat': 51.51038, 'lon': -0.130088}
  },
  {
    'id': 'Q42029956',
    'name': 'Grand Casino Cinema',
    'guestrating': 1,
    'kinds': 'architecture historic ',
    'distance': 366.40841865,
    'coordinate': {'lat': 51.510418, 'lon': -0.121418}
  },
  {
    'id': 'Q42030426',
    'name': 'Victoria Picture Hall',
    'guestrating': 1,
    'kinds': 'architecture historic ',
    'distance': 366.40841865,
    'coordinate': {'lat': 51.510418, 'lon': -0.121418}
  },
  {
    'id': 'N6571984977',
    'name': 'Sewer lamp',
    'guestrating': 1,
    'kinds': 'other unclassified ',
    'distance': 367.88103493,
    'coordinate': {'lat': 51.509842, 'lon': -0.120876}
  },
  {
    'id': 'Q27081602',
    'name': '5 Lampstandards Numbered 1 To 5 (Consecutive)',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 368.73611203,
    'coordinate': {'lat': 51.508713, 'lon': -0.131043}
  },
  {
    'id': 'Q10272256',
    'name': 'Embassy of Brazil in London',
    'guestrating': 7,
    'kinds': 'other unclassified ',
    'distance': 369.2776829,
    'coordinate': {'lat': 51.507511, 'lon': -0.130803}
  },
  {
    'id': 'Q27081550',
    'name': '26, Southampton Street Wc2',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 368.76743183,
    'coordinate': {'lat': 51.511204, 'lon': -0.122597}
  },
  {
    'id': 'N5904386786',
    'name': 'Charlie Chaplin',
    'guestrating': 3,
    'kinds': 'urban cultural ',
    'distance': 369.22568063,
    'coordinate': {'lat': 51.510307, 'lon': -0.130231}
  },
  {
    'id': 'N5394650434',
    'name': 'Ambrose Godfrey',
    'guestrating': 1,
    'kinds': 'historic monuments ',
    'distance': 369.20929317,
    'coordinate': {'lat': 51.510979, 'lon': -0.122154}
  },
  {
    'id': 'N5015865538',
    'name': 'Mall Galleries',
    'guestrating': 1,
    'kinds': 'museums cultural ',
    'distance': 369.41589195,
    'coordinate': {'lat': 51.506527, 'lon': -0.129985}
  },
  {
    'id': 'Q14993546',
    'name': 'Leverian collection',
    'guestrating': 3,
    'kinds': 'museums cultural ',
    'distance': 370.24653648,
    'coordinate': {'lat': 51.510277, 'lon': -0.130278}
  },
  {
    'id': 'N4806684754',
    'name': 'Covent Garden Piazza',
    'guestrating': 1,
    'kinds': 'urban cultural ',
    'distance': 369.79791543,
    'coordinate': {'lat': 51.511623, 'lon': -0.123797}
  },
  {
    'id': 'Q27081600',
    'name': '2 Lampstandards Numbered 1 And 2',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 371.72781395,
    'coordinate': {'lat': 51.508255, 'lon': -0.131076}
  },
  {
    'id': 'Q49262',
    'name': 'Alhambra Theatre',
    'guestrating': 3,
    'kinds': 'theatres cultural ',
    'distance': 371.53799879,
    'coordinate': {'lat': 51.5103, 'lon': -0.130278}
  },
  {
    'id': 'W4082589',
    'name': 'Leicester Square',
    'guestrating': 3,
    'kinds': 'gardens urban ',
    'distance': 372.3107332,
    'coordinate': {'lat': 51.510433, 'lon': -0.13015}
  },
  {
    'id': 'Q27084021',
    'name': 'Sewer Gas Lampstandard Numbered 4',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 373.02931148,
    'coordinate': {'lat': 51.509735, 'lon': -0.120726}
  },
  {
    'id': 'N4172949987',
    'name': 'Henry Fawcett Memorial',
    'guestrating': 7,
    'kinds': 'fountains historic ',
    'distance': 373.55177923,
    'coordinate': {'lat': 51.509079, 'lon': -0.120432}
  },
  {
    'id': 'N587985997',
    'name': 'Prince George, Duke of Cambridge',
    'guestrating': 3,
    'kinds': 'historic monuments ',
    'distance': 372.81990654,
    'coordinate': {'lat': 51.505222, 'lon': -0.126586}
  },
  {
    'id': 'W297331784',
    'name': "Cleopatra's Needle",
    'guestrating': 7,
    'kinds': 'historic monuments ',
    'distance': 374.69573706,
    'coordinate': {'lat': 51.508507, 'lon': -0.120343}
  },
  {
    'id': 'Q27081601',
    'name': '16, Suffolk Street Sw1',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 375.20457223,
    'coordinate': {'lat': 51.508942, 'lon': -0.131104}
  },
  {
    'id': 'Q27083664',
    'name': '36, King Street Wc2',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 374.79027078,
    'coordinate': {'lat': 51.511806, 'lon': -0.124496}
  },
  {
    'id': 'Q17550482',
    'name': '37, King Street Wc2',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 375.05959475,
    'coordinate': {'lat': 51.511799, 'lon': -0.124427}
  },
  {
    'id': 'Q19516037',
    'name': 'Equestrian statue of the Duke of Cambridge',
    'guestrating': 7,
    'kinds': 'historic cultural ',
    'distance': 375.41441925,
    'coordinate': {'lat': 51.505199, 'lon': -0.126613}
  },
  {
    'id': 'Q27083020',
    'name': '89 To 95 (Consec) Strand, Including Nos 2 And 3 Savoy Court',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 376.81480105,
    'coordinate': {'lat': 51.510361, 'lon': -0.121175}
  },
  {
    'id': 'W490638255',
    'name': 'Savoy Theatre',
    'guestrating': 7,
    'kinds': 'cultural theatres ',
    'distance': 377.31036653,
    'coordinate': {'lat': 51.510189, 'lon': -0.120999}
  },
  {
    'id': 'W153661824',
    'name': 'Theatre Royal Haymarket',
    'guestrating': 7,
    'kinds': 'cultural theatres ',
    'distance': 377.63304714,
    'coordinate': {'lat': 51.508671, 'lon': -0.131175}
  },
  {
    'id': 'N2321090117',
    'name': 'Agatha Christie Memorial',
    'guestrating': 3,
    'kinds': 'historic monuments ',
    'distance': 378.6728361,
    'coordinate': {'lat': 51.51178, 'lon': -0.127366}
  },
  {
    'id': 'N2790497168',
    'name': 'Hippodrome Casino',
    'guestrating': 7,
    'kinds': 'architecture tourist ',
    'distance': 380.87895247,
    'coordinate': {'lat': 51.511463, 'lon': -0.128565}
  },
  {
    'id': 'Q7356061',
    'name': 'Rococo',
    'guestrating': 1,
    'kinds': 'cultural theatres ',
    'distance': 382.36333046,
    'coordinate': {'lat': 51.511299, 'lon': -0.129}
  },
  {
    'id': 'N5072801654',
    'name': 'Turkish cannon',
    'guestrating': 1,
    'kinds': 'other unclassified ',
    'distance': 382.14411822,
    'coordinate': {'lat': 51.505302, 'lon': -0.127621}
  },
  {
    'id': 'Q42029986',
    'name': 'Jacey in the Strand',
    'guestrating': 1,
    'kinds': 'cinemas cultural ',
    'distance': 384.36108802,
    'coordinate': {'lat': 51.510506, 'lon': -0.1212}
  },
  {
    'id': 'Q5211772',
    'name': "Daly's Theatre",
    'guestrating': 3,
    'kinds': 'architecture historic ',
    'distance': 384.55833583,
    'coordinate': {'lat': 51.511101, 'lon': -0.129444}
  },
  {
    'id': 'Q17549399',
    'name': '4, Haymarket Sw1',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 385.13352671,
    'coordinate': {'lat': 51.508301, 'lon': -0.131275}
  },
  {
    'id': 'Q27083662',
    'name': '38, King Street Wc2',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 384.26798462,
    'coordinate': {'lat': 51.511871, 'lon': -0.124349}
  },
  {
    'id': 'Q16867391',
    'name': 'Embassy of Kazakhstan, London',
    'guestrating': 7,
    'kinds': 'other unclassified ',
    'distance': 385.37428561,
    'coordinate': {'lat': 51.507519, 'lon': -0.131048}
  },
  {
    'id': 'Q17527308',
    'name': '18, Suffolk Street Sw1',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 386.49095134,
    'coordinate': {'lat': 51.508801, 'lon': -0.13129}
  },
  {
    'id': 'Q27084710',
    'name': '7, Haymarket Sw1',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 388.82817527,
    'coordinate': {'lat': 51.508484, 'lon': -0.13134}
  },
  {
    'id': 'N1253814492',
    'name': 'Robert Raikes',
    'guestrating': 3,
    'kinds': 'historic monuments ',
    'distance': 388.9170656,
    'coordinate': {'lat': 51.509274, 'lon': -0.120266}
  },
  {
    'id': 'Q19967451',
    'name': 'Statue of Robert Raikes',
    'guestrating': 7,
    'kinds': 'cultural urban ',
    'distance': 388.96071871,
    'coordinate': {'lat': 51.509338, 'lon': -0.12029}
  },
  {
    'id': 'Q42030239',
    'name': 'Palm Court Cinema',
    'guestrating': 1,
    'kinds': 'cinemas cultural ',
    'distance': 388.59033161,
    'coordinate': {'lat': 51.510971, 'lon': -0.129744}
  },
  {
    'id': 'N25507019',
    'name': 'The Gurkha Soldier',
    'guestrating': 3,
    'kinds': 'historic monuments ',
    'distance': 389.70420076,
    'coordinate': {'lat': 51.505062, 'lon': -0.124961}
  },
  {
    'id': 'N26573173',
    'name': 'Vue Leicester Square',
    'guestrating': 3,
    'kinds': 'cultural cinemas ',
    'distance': 393.27472882,
    'coordinate': {'lat': 51.511246, 'lon': -0.129368}
  },
  {
    'id': 'W172645316',
    'name': 'London Hippodrome',
    'guestrating': 7,
    'kinds': 'architecture tourist ',
    'distance': 396.72173799,
    'coordinate': {'lat': 51.511486, 'lon': -0.128933}
  },
  {
    'id': 'Q27084612',
    'name': '40, King Street Wc2',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 396.48320854,
    'coordinate': {'lat': 51.511955, 'lon': -0.124157}
  },
  {
    'id': 'Q27081100',
    'name': '121-123, Pall Mall Sw1',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 397.69217317,
    'coordinate': {'lat': 51.507423, 'lon': -0.131187}
  },
  {
    'id': 'N26671967',
    'name': 'Odeon Panton Street',
    'guestrating': 2,
    'kinds': 'cultural cinemas ',
    'distance': 397.87222819,
    'coordinate': {'lat': 51.509567, 'lon': -0.131225}
  },
  {
    'id': 'Q27083617',
    'name': 'Plimsoll Memorial',
    'guestrating': 6,
    'kinds': 'historic cultural ',
    'distance': 399.1059723,
    'coordinate': {'lat': 51.505306, 'lon': -0.123213}
  },
  {
    'id': 'N5397034580',
    'name': 'Covent Garden Market',
    'guestrating': 6,
    'kinds': 'urban cultural ',
    'distance': 400.30515127,
    'coordinate': {'lat': 51.511505, 'lon': -0.122502}
  },
  {
    'id': 'W175158234',
    'name': 'The Long Acre',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 400.24286083,
    'coordinate': {'lat': 51.511997, 'lon': -0.127284}
  },
  {
    'id': 'Q27080557',
    'name': 'The Frigate Public House',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 400.54340122,
    'coordinate': {'lat': 51.51199, 'lon': -0.127334}
  },
  {
    'id': 'N3012192162',
    'name': 'Samuel Plimsoll',
    'guestrating': 3,
    'kinds': 'historic monuments ',
    'distance': 402.19139851,
    'coordinate': {'lat': 51.505306, 'lon': -0.123113}
  },
  {
    'id': 'Q26898080',
    'name': 'Leicester House',
    'guestrating': 2,
    'kinds': 'architecture historic ',
    'distance': 404.69284063,
    'coordinate': {'lat': 51.510815, 'lon': -0.130278}
  },
  {
    'id': 'Q27084692',
    'name': '5, Great Newport Street Wc2',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 405.08783376,
    'coordinate': {'lat': 51.512009, 'lon': -0.127461}
  },
  {
    'id': 'Q19927909',
    'name': 'Statue of Queen Victoria',
    'guestrating': 2,
    'kinds': 'cultural urban ',
    'distance': 405.82920813,
    'coordinate': {'lat': 51.506599, 'lon': -0.1307}
  },
  {
    'id': 'Q42030182',
    'name': 'Odeon Studios Leicester Square',
    'guestrating': 1,
    'kinds': 'cinemas cultural ',
    'distance': 406.42603436,
    'coordinate': {'lat': 51.510445, 'lon': -0.130726}
  },
  {
    'id': 'Q27083287',
    'name': '120, Pall Mall Sw1',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 407.32127679,
    'coordinate': {'lat': 51.507385, 'lon': -0.131313}
  },
  {
    'id': 'Q27084611',
    'name': '41 And 42, King Street Wc2',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 406.81854941,
    'coordinate': {'lat': 51.51202, 'lon': -0.124002}
  },
  {
    'id': 'Q26319560',
    'name': 'The Citadel',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 407.24362131,
    'coordinate': {'lat': 51.505741, 'lon': -0.129536}
  },
  {
    'id': 'Q16902818',
    'name': 'Vue West End',
    'guestrating': 3,
    'kinds': 'cinemas cultural ',
    'distance': 409.98310602,
    'coordinate': {'lat': 51.511398, 'lon': -0.129444}
  },
  {
    'id': 'N5071252726',
    'name': 'Household Cavalry Museum',
    'guestrating': 1,
    'kinds': 'museums cultural ',
    'distance': 410.40767525,
    'coordinate': {'lat': 51.504948, 'lon': -0.127156}
  },
  {
    'id': 'Q17527384',
    'name': 'Forecourt Railings, Gates And Guardhouses To Horseguards',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 410.38107654,
    'coordinate': {'lat': 51.504902, 'lon': -0.126789}
  },
  {
    'id': 'Q7704016',
    'name': "Terry's Theatre",
    'guestrating': 3,
    'kinds': 'theatres cultural ',
    'distance': 411.21558988,
    'coordinate': {'lat': 51.510601, 'lon': -0.120833}
  },
  {
    'id': 'N25507023',
    'name': 'Spencer Compton',
    'guestrating': 7,
    'kinds': 'historic monuments ',
    'distance': 410.54069995,
    'coordinate': {'lat': 51.504848, 'lon': -0.126149}
  },
  {
    'id': 'Q17549889',
    'name': '2–10 Tavistock Street',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 412.06784843,
    'coordinate': {'lat': 51.511299, 'lon': -0.1218}
  },
  {
    'id': 'Q62600505',
    'name': 'Our Lady of Mercy',
    'guestrating': 2,
    'kinds': 'cultural urban ',
    'distance': 412.233021,
    'coordinate': {'lat': 51.511112, 'lon': -0.13}
  },
  {
    'id': 'Q27084838',
    'name': 'Statue of William Tyndale',
    'guestrating': 6,
    'kinds': 'cultural urban ',
    'distance': 412.71836626,
    'coordinate': {'lat': 51.505066, 'lon': -0.123609}
  },
  {
    'id': 'N601701465',
    'name': 'Cafe de Hong Kong',
    'guestrating': 1,
    'kinds': 'cultural cinemas ',
    'distance': 413.86738804,
    'coordinate': {'lat': 51.511818, 'lon': -0.128528}
  },
  {
    'id': 'W219802225',
    'name': 'Harold Pinter Theatre',
    'guestrating': 7,
    'kinds': 'cultural theatres ',
    'distance': 415.45987696,
    'coordinate': {'lat': 51.509331, 'lon': -0.131585}
  },
  {
    'id': 'N5072857859',
    'name': 'Equestrian statue of the Viscount Wolseley',
    'guestrating': 7,
    'kinds': 'historic monuments ',
    'distance': 415.84799725,
    'coordinate': {'lat': 51.504955, 'lon': -0.127498}
  },
  {
    'id': 'W175158246',
    'name': 'Arts Theatre',
    'guestrating': 3,
    'kinds': 'cultural theatres ',
    'distance': 415.89618273,
    'coordinate': {'lat': 51.512096, 'lon': -0.127536}
  },
  {
    'id': 'N554138077',
    'name': "Simpson's-in-the-Strand",
    'guestrating': 7,
    'kinds': 'historic architecture ',
    'distance': 416.94324594,
    'coordinate': {'lat': 51.510506, 'lon': -0.120636}
  },
  {
    'id': 'Q27083629',
    'name': 'Yard Premises To Rear Of Numbers 22 And 23',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 416.47904154,
    'coordinate': {'lat': 51.512264, 'lon': -0.125316}
  },
  {
    'id': 'Q27080793',
    'name': '15, Little Newport Street Wc2',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 417.15168339,
    'coordinate': {'lat': 51.51178, 'lon': -0.128739}
  },
  {
    'id': 'N3012176225',
    'name': 'William Tyndale',
    'guestrating': 3,
    'kinds': 'historic monuments ',
    'distance': 418.09202987,
    'coordinate': {'lat': 51.50502, 'lon': -0.123594}
  },
  {
    'id': 'Q5415939',
    'name': '43 King Street',
    'guestrating': 7,
    'kinds': 'historic architecture ',
    'distance': 418.10774032,
    'coordinate': {'lat': 51.5121, 'lon': -0.123859}
  },
  {
    'id': 'Q27154699',
    'name': 'Savoy Hotel Centenary Memorial',
    'guestrating': 2,
    'kinds': 'historic monuments ',
    'distance': 419.56953909,
    'coordinate': {'lat': 51.509499, 'lon': -0.1199}
  },
  {
    'id': 'N26573168',
    'name': 'Cineworld Leicester Square',
    'guestrating': 3,
    'kinds': 'cultural cinemas ',
    'distance': 420.21659898,
    'coordinate': {'lat': 51.510933, 'lon': -0.130409}
  },
  {
    'id': 'N5072791242',
    'name': 'Royal Naval Division Memorial',
    'guestrating': 7,
    'kinds': 'historic monuments ',
    'distance': 422.12891963,
    'coordinate': {'lat': 51.505337, 'lon': -0.129024}
  },
  {
    'id': 'Q27083634',
    'name': '14, Little Newport Street Wc2',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 422.61955706,
    'coordinate': {'lat': 51.511806, 'lon': -0.128824}
  },
  {
    'id': 'Q27083357',
    'name': '18, Newport Court Wc2',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 424.59153508,
    'coordinate': {'lat': 51.511856, 'lon': -0.128736}
  },
  {
    'id': 'Q7418945',
    'name': 'Sans Souci Theatre',
    'guestrating': 2,
    'kinds': 'architecture historic ',
    'distance': 425.46018958,
    'coordinate': {'lat': 51.511101, 'lon': -0.130278}
  },
  {
    'id': 'Q27082352',
    'name': 'Clareville House',
    'guestrating': 7,
    'kinds': 'historic architecture ',
    'distance': 425.92984922,
    'coordinate': {'lat': 51.50983, 'lon': -0.131511}
  },
  {
    'id': 'Q41966006',
    'name': 'Cannon Royal Cinema',
    'guestrating': 1,
    'kinds': 'architecture historic ',
    'distance': 425.98309395,
    'coordinate': {'lat': 51.511971, 'lon': -0.128431}
  },
  {
    'id': 'W151297118',
    'name': 'National Police Memorial',
    'guestrating': 3,
    'kinds': 'historic monuments ',
    'distance': 426.81901792,
    'coordinate': {'lat': 51.505733, 'lon': -0.129951}
  },
  {
    'id': 'Q26319562',
    'name': "Burberry's",
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 428.09388494,
    'coordinate': {'lat': 51.509121, 'lon': -0.131833}
  },
  {
    'id': 'Q27080964',
    'name': '19, Newport Court Wc2',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 427.6411846,
    'coordinate': {'lat': 51.511864, 'lon': -0.128808}
  },
  {
    'id': 'W172645319',
    'name': 'Notre-Dame de France',
    'guestrating': 7,
    'kinds': 'religion churches ',
    'distance': 429.01356897,
    'coordinate': {'lat': 51.511391, 'lon': -0.129886}
  },
  {
    'id': 'Q5755096',
    'name': 'High Commission of New Zealand, London',
    'guestrating': 7,
    'kinds': 'historic architecture ',
    'distance': 430.74958465,
    'coordinate': {'lat': 51.507702, 'lon': -0.1318}
  },
  {
    'id': 'Q27080787',
    'name': '11, Little Newport Street Wc2',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 430.56192882,
    'coordinate': {'lat': 51.511822, 'lon': -0.129003}
  },
  {
    'id': 'Q5888137',
    'name': 'Home',
    'guestrating': 2,
    'kinds': 'cultural theatres ',
    'distance': 431.99840176,
    'coordinate': {'lat': 51.5107, 'lon': -0.1309}
  },
  {
    'id': 'Q27081101',
    'name': '6, Panton Street Sw1',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 432.43839831,
    'coordinate': {'lat': 51.509319, 'lon': -0.131839}
  },
  {
    'id': 'N3758690563',
    'name': 'Leicester Square Theatre',
    'guestrating': 2,
    'kinds': 'cultural theatres ',
    'distance': 432.35428414,
    'coordinate': {'lat': 51.511311, 'lon': -0.130093}
  },
  {
    'id': 'W133153176',
    'name': 'Horse Guards',
    'guestrating': 7,
    'kinds': 'historic architecture ',
    'distance': 431.92860505,
    'coordinate': {'lat': 51.504757, 'lon': -0.127215}
  },
  {
    'id': 'Q27080965',
    'name': '20 And 20A, Newport Court Wc2',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 432.25994019,
    'coordinate': {'lat': 51.511879, 'lon': -0.128899}
  },
  {
    'id': 'Q42030219',
    'name': 'Odeon Wardour Street',
    'guestrating': 1,
    'kinds': 'architecture historic ',
    'distance': 435.52688874,
    'coordinate': {'lat': 51.510513, 'lon': -0.131147}
  },
  {
    'id': 'N2158543566',
    'name': 'Swiss Centre mechanical clock',
    'guestrating': 1,
    'kinds': 'urban cultural ',
    'distance': 435.64537324,
    'coordinate': {'lat': 51.510479, 'lon': -0.131181}
  },
  {
    'id': 'Q27081118',
    'name': '5, Panton Street Sw1',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 437.02667864,
    'coordinate': {'lat': 51.5093, 'lon': -0.131912}
  },
  {
    'id': 'Q27080792',
    'name': '8-10, Little Newport Street Wc2',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 436.40973236,
    'coordinate': {'lat': 51.511826, 'lon': -0.129148}
  },
  {
    'id': 'W143641503',
    'name': "Her Majesty's Theatre",
    'guestrating': 7,
    'kinds': 'cultural theatres ',
    'distance': 437.82069495,
    'coordinate': {'lat': 51.508087, 'lon': -0.132006}
  },
  {
    'id': 'Q26319695',
    'name': '12, Floral Street Wc2',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 437.40502128,
    'coordinate': {'lat': 51.512367, 'lon': -0.124365}
  },
  {
    'id': 'N6307073869',
    'name': 'Arthur Sullivan',
    'guestrating': 6,
    'kinds': 'historic monuments ',
    'distance': 438.50024739,
    'coordinate': {'lat': 51.509464, 'lon': -0.119604}
  },
  {
    'id': 'Q21027173',
    'name': 'Jubilee Market',
    'guestrating': 7,
    'kinds': 'historic architecture ',
    'distance': 438.0233205,
    'coordinate': {'lat': 51.511662, 'lon': -0.121915}
  },
  {
    'id': 'W633369346',
    'name': 'Covent Garden Market',
    'guestrating': 7,
    'kinds': 'historic architecture ',
    'distance': 438.11507249,
    'coordinate': {'lat': 51.511986, 'lon': -0.122713}
  },
  {
    'id': 'Q27083358',
    'name': '21-24, Newport Court Wc2',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 440.13827263,
    'coordinate': {'lat': 51.51189, 'lon': -0.129089}
  },
  {
    'id': 'Q1886295',
    'name': 'Savoy Palace',
    'guestrating': 3,
    'kinds': 'palaces architecture ',
    'distance': 441.12907115,
    'coordinate': {'lat': 51.510555, 'lon': -0.120278}
  },
  {
    'id': 'Q26319829',
    'name': 'Apple Store',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 441.65248562,
    'coordinate': {'lat': 51.512272, 'lon': -0.123619}
  },
  {
    'id': 'N5012281309',
    'name': '',
    'guestrating': 0,
    'kinds': 'other unclassified ',
    'distance': 442.45833195,
    'coordinate': {'lat': 51.511963, 'lon': -0.122519}
  },
  {
    'id': 'W140470549',
    'name': 'Banqueting House',
    'guestrating': 7,
    'kinds': 'museums cultural ',
    'distance': 442.50149163,
    'coordinate': {'lat': 51.504555, 'lon': -0.125914}
  },
  {
    'id': 'Q20876363',
    'name': 'Swiss Centre, London',
    'guestrating': 3,
    'kinds': 'architecture historic ',
    'distance': 443.54356512,
    'coordinate': {'lat': 51.510601, 'lon': -0.1312}
  },
  {
    'id': 'Q27081651',
    'name': '44 Lamp Standards Lining Road And Circus In Front Of Palace',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 444.05583938,
    'coordinate': {'lat': 51.505882, 'lon': -0.130524}
  },
  {
    'id': 'Q26319046',
    'name': '8, Oxendon Street Sw1',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 446.31518145,
    'coordinate': {'lat': 51.509682, 'lon': -0.131899}
  },
  {
    'id': 'Q27080777',
    'name': '34 And 35, Lisle Street Wc2',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 446.13751747,
    'coordinate': {'lat': 51.511612, 'lon': -0.129853}
  },
  {
    'id': 'Q41965974',
    'name': 'Cannon Charing Cross Road',
    'guestrating': 2,
    'kinds': 'cinemas cultural ',
    'distance': 446.00394715,
    'coordinate': {'lat': 51.512154, 'lon': -0.128484}
  },
  {
    'id': 'N5015865539',
    'name': 'Institute of Contemporary Arts',
    'guestrating': 3,
    'kinds': 'museums cultural ',
    'distance': 447.88857161,
    'coordinate': {'lat': 51.506157, 'lon': -0.130952}
  },
  {
    'id': 'N70750056',
    'name': 'Prince Charles Cinema',
    'guestrating': 3,
    'kinds': 'cultural cinemas ',
    'distance': 449.0238086,
    'coordinate': {'lat': 51.511452, 'lon': -0.130204}
  },
  {
    'id': 'Q27080966',
    'name': '25, Newport Court Wc2',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 449.07750226,
    'coordinate': {'lat': 51.511906, 'lon': -0.129288}
  },
  {
    'id': 'N246518191',
    'name': 'Piccadilly Comedy Club',
    'guestrating': 1,
    'kinds': 'cultural theatres ',
    'distance': 449.94256177,
    'coordinate': {'lat': 51.509735, 'lon': -0.131926}
  },
  {
    'id': 'W149173476',
    'name': 'Prince of Wales Theatre',
    'guestrating': 7,
    'kinds': 'cultural theatres ',
    'distance': 450.4532395,
    'coordinate': {'lat': 51.510078, 'lon': -0.131734}
  },
  {
    'id': 'Q17527220',
    'name': 'Royal Opera Arcade',
    'guestrating': 6,
    'kinds': 'cultural urban ',
    'distance': 453.05736906,
    'coordinate': {'lat': 51.5079, 'lon': -0.132187}
  },
  {
    'id': 'W225754347',
    'name': 'The Comedy Pub',
    'guestrating': 3,
    'kinds': 'cultural theatres ',
    'distance': 453.0837596,
    'coordinate': {'lat': 51.509739, 'lon': -0.131973}
  },
  {
    'id': 'Q27080971',
    'name': '26, Newport Court Wc2',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 452.57099224,
    'coordinate': {'lat': 51.511913, 'lon': -0.129355}
  },
  {
    'id': 'Q5043063',
    'name': 'Empire Haymarket',
    'guestrating': 3,
    'kinds': 'theatres cultural ',
    'distance': 455.83646201,
    'coordinate': {'lat': 51.508701, 'lon': -0.1323}
  },
  {
    'id': 'Q27080967',
    'name': '4-8, Newport Place Wc2',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 455.94615768,
    'coordinate': {'lat': 51.511909, 'lon': -0.129456}
  },
  {
    'id': 'W153661807',
    'name': 'Empire Cinemas',
    'guestrating': 1,
    'kinds': 'cultural cinemas ',
    'distance': 457.98894681,
    'coordinate': {'lat': 51.508762, 'lon': -0.132326}
  },
  {
    'id': 'Q27084837',
    'name': '21 Bench Seats Set On Embankment Pavement',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 457.99739666,
    'coordinate': {'lat': 51.509296, 'lon': -0.119259}
  },
  {
    'id': 'Q26319207',
    'name':
        '12 Lampstandards Numbered 1 To 12 (Consecutive) From Outside Tower House On Both Sides Of Road',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 459.18073144,
    'coordinate': {'lat': 51.511589, 'lon': -0.121298}
  },
  {
    'id': 'N5072880573',
    'name': 'Equestrian statue of the Earl Roberts',
    'guestrating': 7,
    'kinds': 'historic monuments ',
    'distance': 459.27300323,
    'coordinate': {'lat': 51.504528, 'lon': -0.12735}
  },
  {
    'id': 'Q27151444',
    'name': "Queen Mary's Steps",
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 460.52443863,
    'coordinate': {'lat': 51.504517, 'lon': -0.124108}
  },
  {
    'id': 'N5502336564',
    'name': 'Colin Campbell',
    'guestrating': 6,
    'kinds': 'historic monuments ',
    'distance': 461.55434081,
    'coordinate': {'lat': 51.506695, 'lon': -0.131703}
  },
  {
    'id': 'W208645224',
    'name': 'Former Whitehall Palace Steps',
    'guestrating': 3,
    'kinds': 'historic palaces ',
    'distance': 460.78780197,
    'coordinate': {'lat': 51.504532, 'lon': -0.124015}
  },
  {
    'id': 'N5502336565',
    'name': 'John Lawrence',
    'guestrating': 6,
    'kinds': 'historic monuments ',
    'distance': 461.7508251,
    'coordinate': {'lat': 51.506554, 'lon': -0.131589}
  },
  {
    'id': 'Q27080715',
    'name': '20, Tavistock Street',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 461.67210674,
    'coordinate': {'lat': 51.51157, 'lon': -0.121212}
  },
  {
    'id': 'R5640782',
    'name': 'Golden Jubilee Bridge',
    'guestrating': 3,
    'kinds': 'bridges architecture ',
    'distance': 462.23175572,
    'coordinate': {'lat': 51.505985, 'lon': -0.120479}
  },
  {
    'id': 'N5502335172',
    'name': 'Robert Falcon Scott',
    'guestrating': 6,
    'kinds': 'historic monuments ',
    'distance': 462.95422498,
    'coordinate': {'lat': 51.50684, 'lon': -0.131832}
  },
  {
    'id': 'Q27083606',
    'name': '33 Lamp Standards Lining Footpaths And Ride On North Side',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 463.89057692,
    'coordinate': {'lat': 51.505978, 'lon': -0.131025}
  },
  {
    'id': 'Q26319159',
    'name': 'Statue of General Charles George Gordon',
    'guestrating': 7,
    'kinds': 'cultural urban ',
    'distance': 463.890538,
    'coordinate': {'lat': 51.504532, 'lon': -0.123836}
  },
  {
    'id': 'W202759278',
    'name': "Queen's Chapel of the Savoy",
    'guestrating': 7,
    'kinds': 'religion churches ',
    'distance': 464.98040059,
    'coordinate': {'lat': 51.510563, 'lon': -0.119887}
  },
  {
    'id': 'Q26412987',
    'name': '28, James Street Wc2',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 464.5401935,
    'coordinate': {'lat': 51.512516, 'lon': -0.123753}
  },
  {
    'id': 'W4256958',
    'name': 'Horse Guards Parade',
    'guestrating': 3,
    'kinds': 'interesting squares ',
    'distance': 464.61305148,
    'coordinate': {'lat': 51.504658, 'lon': -0.128244}
  },
  {
    'id': 'N3010386634',
    'name': 'Charles George Gordon',
    'guestrating': 3,
    'kinds': 'historic monuments ',
    'distance': 465.55312882,
    'coordinate': {'lat': 51.504528, 'lon': -0.123776}
  },
  {
    'id': 'Q41966099',
    'name': 'Cinema Blue, Lisle Street',
    'guestrating': 1,
    'kinds': 'cinemas cultural ',
    'distance': 469.21671962,
    'coordinate': {'lat': 51.511566, 'lon': -0.130431}
  },
  {
    'id': 'Q27081663',
    'name':
        '2 Mounting Blocks On Kerbs Outside South East And South West Corners Respectively Of The Athenaeum And The Institute Of Directors',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 471.28222824,
    'coordinate': {'lat': 51.506866, 'lon': -0.131983}
  },
  {
    'id': 'Q1464767',
    'name': 'Royal United Services Institute',
    'guestrating': 7,
    'kinds': 'other unclassified ',
    'distance': 470.63959124,
    'coordinate': {'lat': 51.504299, 'lon': -0.1258}
  },
  {
    'id': 'Q25842292',
    'name': 'The Spirit of Electricity',
    'guestrating': 6,
    'kinds': 'cultural urban ',
    'distance': 470.86614596,
    'coordinate': {'lat': 51.512611, 'lon': -0.127525}
  },
  {
    'id': 'Q27080776',
    'name': '14-27, Lisle Street Wc2',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 473.14538032,
    'coordinate': {'lat': 51.511684, 'lon': -0.130308}
  },
  {
    'id': 'Q18160247',
    'name': 'Holbein Gate',
    'guestrating': 3,
    'kinds': 'fortifications historic ',
    'distance': 473.49326898,
    'coordinate': {'lat': 51.504299, 'lon': -0.12649}
  },
  {
    'id': 'N5012281310',
    'name': '',
    'guestrating': 0,
    'kinds': 'other unclassified ',
    'distance': 473.77897887,
    'coordinate': {'lat': 51.51226, 'lon': -0.122454}
  },
  {
    'id': 'N2251084208',
    'name': 'Lord Delfont of Stepney',
    'guestrating': 1,
    'kinds': 'historic monuments ',
    'distance': 474.57837727,
    'coordinate': {'lat': 51.510109, 'lon': -0.13209}
  },
  {
    'id': 'N25507035',
    'name': 'Douglas Haig',
    'guestrating': 3,
    'kinds': 'historic monuments ',
    'distance': 474.33342265,
    'coordinate': {'lat': 51.50428, 'lon': -0.126245}
  },
  {
    'id': 'Q27080816',
    'name': '3 And 5, Mercer Street Wc2',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 474.51703265,
    'coordinate': {'lat': 51.512794, 'lon': -0.125889}
  },
  {
    'id': 'W349937184',
    'name': 'Carlton House Terrace',
    'guestrating': 3,
    'kinds': 'urban cultural ',
    'distance': 475.89544869,
    'coordinate': {'lat': 51.506413, 'lon': -0.131697}
  },
  {
    'id': 'W49797434',
    'name': 'Covent Garden',
    'guestrating': 3,
    'kinds': 'urban cultural ',
    'distance': 475.56769182,
    'coordinate': {'lat': 51.512081, 'lon': -0.121931}
  },
  {
    'id': 'Q5325895',
    'name': 'Earl Haig Memorial',
    'guestrating': 7,
    'kinds': 'cultural urban ',
    'distance': 476.71703001,
    'coordinate': {'lat': 51.504261, 'lon': -0.12631}
  },
  {
    'id': 'N4813200617',
    'name': 'Carlton House Terrace',
    'guestrating': 7,
    'kinds': 'historic architecture ',
    'distance': 478.286068,
    'coordinate': {'lat': 51.506382, 'lon': -0.131707}
  },
  {
    'id': 'N1584895172',
    'name': 'Hong Kong Buffet',
    'guestrating': 1,
    'kinds': 'cultural cinemas ',
    'distance': 479.45089,
    'coordinate': {'lat': 51.511505, 'lon': -0.130739}
  },
  {
    'id': 'W572758431',
    'name': 'King Edward VII',
    'guestrating': 1,
    'kinds': 'urban cultural ',
    'distance': 484.45174045,
    'coordinate': {'lat': 51.50671, 'lon': -0.132078}
  },
  {
    'id': 'N2403511275',
    'name': 'Tiger Tiger',
    'guestrating': 2,
    'kinds': 'nightclubs cultural ',
    'distance': 484.80721908,
    'coordinate': {'lat': 51.509632, 'lon': -0.132496}
  },
  {
    'id': 'W4253932',
    'name': '',
    'guestrating': 0,
    'kinds': 'cemeteries historic ',
    'distance': 484.73167036,
    'coordinate': {'lat': 51.510605, 'lon': -0.119602}
  },
  {
    'id': 'W297204228',
    'name': 'Duke of York Column;Frederick, Duke of York',
    'guestrating': 7,
    'kinds': 'historic monuments ',
    'distance': 484.83461499,
    'coordinate': {'lat': 51.506287, 'lon': -0.131727}
  },
  {
    'id': 'N2145826681',
    'name': 'Comedy Store',
    'guestrating': 3,
    'kinds': 'cultural theatres ',
    'distance': 485.84925452,
    'coordinate': {'lat': 51.51012, 'lon': -0.132257}
  },
  {
    'id': 'W184107136',
    'name': 'Hungerford Bridge',
    'guestrating': 3,
    'kinds': 'bridges architecture ',
    'distance': 485.71584804,
    'coordinate': {'lat': 51.506035, 'lon': -0.119998}
  },
  {
    'id': 'Q19930022',
    'name': 'Equestrian statue of Edward VII',
    'guestrating': 6,
    'kinds': 'historic cultural ',
    'distance': 486.24704235,
    'coordinate': {'lat': 51.506699, 'lon': -0.1321}
  },
  {
    'id': 'Q27083014',
    'name': '356-359, Strand Wc2',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 486.98246786,
    'coordinate': {'lat': 51.511166, 'lon': -0.120139}
  },
  {
    'id': 'Q27083430',
    'name': '6 And 8, Mercer Street Wc2',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 487.11405538,
    'coordinate': {'lat': 51.512909, 'lon': -0.125667}
  },
  {
    'id': 'Q4637892',
    'name': '43 Club',
    'guestrating': 2,
    'kinds': 'cultural theatres ',
    'distance': 489.73110956,
    'coordinate': {'lat': 51.511902, 'lon': -0.130278}
  },
  {
    'id': 'Q27084846',
    'name': '7-9, Waterloo Place Sw1',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 490.47182275,
    'coordinate': {'lat': 51.507805, 'lon': -0.132708}
  },
  {
    'id': 'N5502341065',
    'name': 'Sidney Herbert',
    'guestrating': 7,
    'kinds': 'urban cultural ',
    'distance': 490.47059143,
    'coordinate': {'lat': 51.50732, 'lon': -0.132533}
  },
  {
    'id': 'N4590646389',
    'name': 'Burger & Lobster Leicester Square',
    'guestrating': 1,
    'kinds': 'cultural cinemas ',
    'distance': 490.75710925,
    'coordinate': {'lat': 51.511032, 'lon': -0.131562}
  },
  {
    'id': 'Q27083627',
    'name': '116, Long Acre Wc2',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 490.42757739,
    'coordinate': {'lat': 51.512917, 'lon': -0.125019}
  },
  {
    'id': 'Q27083000',
    'name': 'Rialto Cinema',
    'guestrating': 6,
    'kinds': 'cinemas cultural ',
    'distance': 491.57836534,
    'coordinate': {'lat': 51.510555, 'lon': -0.132034}
  },
  {
    'id': 'Q26319685',
    'name': '47, Gerrard Street W1',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 492.25509189,
    'coordinate': {'lat': 51.512066, 'lon': -0.130001}
  },
  {
    'id': 'Q1031925',
    'name': 'Dover House',
    'guestrating': 7,
    'kinds': 'historic architecture ',
    'distance': 492.60565239,
    'coordinate': {'lat': 51.504166, 'lon': -0.126944}
  },
  {
    'id': 'Q5623756',
    'name': 'Gwydyr House',
    'guestrating': 7,
    'kinds': 'historic architecture ',
    'distance': 492.99791411,
    'coordinate': {'lat': 51.504101, 'lon': -0.1259}
  },
  {
    'id': 'Q26319149',
    'name': '7 And 9, Wardour Street W1',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 494.08302568,
    'coordinate': {'lat': 51.510777, 'lon': -0.131879}
  },
  {
    'id': 'Q27084781',
    'name': "St Paul's Clergy House",
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 494.24925627,
    'coordinate': {'lat': 51.511696, 'lon': -0.120746}
  },
  {
    'id': 'N5072911672',
    'name': 'Cádiz Memorial',
    'guestrating': 7,
    'kinds': 'historic monuments ',
    'distance': 494.90959554,
    'coordinate': {'lat': 51.504189, 'lon': -0.127301}
  },
  {
    'id': 'W44599803',
    'name': 'London Transport Museum',
    'guestrating': 7,
    'kinds': 'museums cultural ',
    'distance': 495.61387698,
    'coordinate': {'lat': 51.511978, 'lon': -0.12122}
  },
  {
    'id': 'Q27086467',
    'name': 'Guild House (South Wing)',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 495.20038093,
    'coordinate': {'lat': 51.512863, 'lon': -0.127371}
  },
  {
    'id': 'Q26319139',
    'name': '2 Lampstandards Numbered 8 And 9 Flanking Crimean War Memorial',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 496.43884241,
    'coordinate': {'lat': 51.507389, 'lon': -0.132653}
  },
  {
    'id': 'Q27080774',
    'name': '6 and 7 Lisle Street',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 496.09428052,
    'coordinate': {'lat': 51.511333, 'lon': -0.131296}
  },
  {
    'id': 'N346352061',
    'name': 'The Royal Artillery Boer War Memorial',
    'guestrating': 7,
    'kinds': 'historic burial ',
    'distance': 496.25791783,
    'coordinate': {'lat': 51.505527, 'lon': -0.131027}
  },
  {
    'id': 'Q7719809',
    'name': 'The Brain',
    'guestrating': 2,
    'kinds': 'cultural theatres ',
    'distance': 496.66901348,
    'coordinate': {'lat': 51.510799, 'lon': -0.1319}
  },
  {
    'id': 'Q27083600',
    'name': 'Lampstandard,  Numbered 10 On South End Of Crimean War Memorial',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 497.03860478,
    'coordinate': {'lat': 51.507263, 'lon': -0.132606}
  },
  {
    'id': 'Q27081508',
    'name': 'Churchyard Railings And Gates',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 497.39367498,
    'coordinate': {'lat': 51.510677, 'lon': -0.119455}
  },
  {
    'id': 'Q27080514',
    'name': '41, Gerrard Street W1',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 497.00092234,
    'coordinate': {'lat': 51.51186, 'lon': -0.13051}
  },
  {
    'id': 'Q27154696',
    'name': 'Statue of Michael Faraday',
    'guestrating': 2,
    'kinds': 'cultural urban ',
    'distance': 498.73981602,
    'coordinate': {'lat': 51.509899, 'lon': -0.1189}
  },
  {
    'id': 'W572758808',
    'name': 'Crimean War Memorial',
    'guestrating': 7,
    'kinds': 'historic burial ',
    'distance': 498.91060651,
    'coordinate': {'lat': 51.507389, 'lon': -0.132689}
  },
  {
    'id': 'Q27086469',
    'name': 'North Wing',
    'guestrating': 5,
    'kinds': 'historic architecture ',
    'distance': 498.40403357,
    'coordinate': {'lat': 51.512882, 'lon': -0.127442}
  },
  {
    'id': 'N2374328717',
    'name': 'Giro',
    'guestrating': 1,
    'kinds': 'historic burial ',
    'distance': 499.71339828,
    'coordinate': {'lat': 51.506264, 'lon': -0.131952}
  },
  {
    'id': 'Q27080513',
    'name': '40, Gerrard Street W1',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 499.69623829,
    'coordinate': {'lat': 51.511837, 'lon': -0.130612}
  },
  {
    'id': 'N5502341064',
    'name': "Florence Nightingale the 'Lady with the Lamp'",
    'guestrating': 7,
    'kinds': 'urban cultural ',
    'distance': 500.65268602,
    'coordinate': {'lat': 51.507278, 'lon': -0.132667}
  },
  {
    'id': 'W289643423',
    'name': 'Cafe de Paris',
    'guestrating': 3,
    'kinds': 'nightclubs cultural ',
    'distance': 500.58420793,
    'coordinate': {'lat': 51.510632, 'lon': -0.132117}
  },
  {
    'id': 'Q27084677',
    'name': '39, Gerrard Street W1',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 501.03910473,
    'coordinate': {'lat': 51.511806, 'lon': -0.130692}
  },
  {
    'id': 'W40412564',
    'name': "St Martin's",
    'guestrating': 7,
    'kinds': 'cultural theatres ',
    'distance': 501.34151301,
    'coordinate': {'lat': 51.512886, 'lon': -0.127579}
  },
  {
    'id': 'Q27151441',
    'name': 'Statue of Charles Portal, 1st Viscount Portal of Hungerford',
    'guestrating': 2,
    'kinds': 'cultural urban ',
    'distance': 502.13713588,
    'coordinate': {'lat': 51.5042, 'lon': -0.1237}
  },
  {
    'id': 'N2622441755',
    'name': 'Charles Portal',
    'guestrating': 3,
    'kinds': 'historic monuments ',
    'distance': 502.53459745,
    'coordinate': {'lat': 51.504192, 'lon': -0.123713}
  },
  {
    'id': 'W31200563',
    'name': 'The Tattershall Castle',
    'guestrating': 3,
    'kinds': 'historic architecture ',
    'distance': 502.82805217,
    'coordinate': {'lat': 51.504467, 'lon': -0.122565}
  },
  {
    'id': 'Q27080512',
    'name': '36, Gerrard Street W1',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 505.63702821,
    'coordinate': {'lat': 51.511707, 'lon': -0.130948}
  },
  {
    'id': 'Q26319208',
    'name':
        'Charles H Fox Limited And Robert White And Sons  Harper And Row Limited',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 505.61798796,
    'coordinate': {'lat': 51.511799, 'lon': -0.12068}
  },
  {
    'id': 'Q27083643',
    'name': "St John's Hospital for Diseases of the Skin",
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 506.05001305,
    'coordinate': {'lat': 51.511318, 'lon': -0.131498}
  },
  {
    'id': 'Q26319141',
    'name': 'Statue of John Franklin',
    'guestrating': 6,
    'kinds': 'cultural urban ',
    'distance': 507.46092282,
    'coordinate': {'lat': 51.506386, 'lon': -0.13219}
  },
  {
    'id': 'Q43303652',
    'name': 'Ministry of Defence Main Building',
    'guestrating': 7,
    'kinds': 'other unclassified ',
    'distance': 507.36178013,
    'coordinate': {'lat': 51.504002, 'lon': -0.1249}
  },
  {
    'id': 'W139810560',
    'name': 'Covent Garden Station',
    'guestrating': 7,
    'kinds': 'industrial railway ',
    'distance': 507.54264711,
    'coordinate': {'lat': 51.512981, 'lon': -0.124138}
  },
  {
    'id': 'Q6469929',
    'name': "Queen's Theatre, Long Acre",
    'guestrating': 2,
    'kinds': 'architecture historic ',
    'distance': 507.96736522,
    'coordinate': {'lat': 51.513, 'lon': -0.12425}
  },
  {
    'id': 'N5502330246',
    'name': 'Rear-Admiral Sir John Franklin',
    'guestrating': 1,
    'kinds': 'historic monuments ',
    'distance': 509.57055631,
    'coordinate': {'lat': 51.506485, 'lon': -0.132309}
  },
  {
    'id': 'N5502334929',
    'name': 'John Fox Burgoyne',
    'guestrating': 6,
    'kinds': 'historic monuments ',
    'distance': 510.64009573,
    'coordinate': {'lat': 51.506351, 'lon': -0.132214}
  },
  {
    'id': 'N5502331034',
    'name': 'Sir Keith Park',
    'guestrating': 2,
    'kinds': 'historic monuments ',
    'distance': 510.73916062,
    'coordinate': {'lat': 51.50663, 'lon': -0.132436}
  },
  {
    'id': 'Q42030114',
    'name': 'Metro Cinema',
    'guestrating': 1,
    'kinds': 'cinemas cultural ',
    'distance': 511.3400877,
    'coordinate': {'lat': 51.510567, 'lon': -0.132344}
  },
  {
    'id': 'Q23304804',
    'name': 'Burleigh House',
    'guestrating': 7,
    'kinds': 'historic architecture ',
    'distance': 511.19976552,
    'coordinate': {'lat': 51.511272, 'lon': -0.119834}
  },
  {
    'id': 'W27163672',
    'name': 'Lyceum Theatre',
    'guestrating': 7,
    'kinds': 'cultural theatres ',
    'distance': 513.19096836,
    'coordinate': {'lat': 51.511482, 'lon': -0.120059}
  },
  {
    'id': 'W349340731',
    'name': 'Souk Bazaar',
    'guestrating': 6,
    'kinds': 'historic architecture ',
    'distance': 513.74049468,
    'coordinate': {'lat': 51.512863, 'lon': -0.128294}
  }
];

List dummyHotels = [
  {
    "id": 114754,
    "name": "PULLMAN PARIS MONTPARNASSE Hotel (opening soon)",
    "starRating": 4.0,
    "guestrating": "10.0",
    "address": "Paris",
    "street": "Paris",
    "price": "",
    "features": "",
    "imgURL":
        "https://thumbnails.trvl-media.com/SJ1sXOMRNRuMm9oUc8dxqbYUX3s=/250x140/smart/filters:quality(60)/images.trvl-media.com/hotels/1000000/20000/17400/17333/814ffa64_z.jpg",
    "coordinate": {"lat": 48.838548, "lon": 2.320186},
    "deals": {}
  },
  {
    "id": 1212544,
    "name": "Four Seasons Hotel George V",
    "starRating": 5.0,
    "guestrating": "10.0",
    "address": "Paris",
    "street": "Paris",
    "price": {"old_price": 1078.9, "new_price": "\$1,079"},
    "features": {"paymentPreference": false, "noCCRequired": false},
    "imgURL":
        "https://thumbnails.trvl-media.com/E-mMsniXmJzCWnvw2qZDxEtpIFQ=/250x140/smart/filters:quality(60)/images.trvl-media.com/hotels/1000000/10000/6700/6642/34c77dfa_z.jpg",
    "coordinate": {"lat": 48.868744, "lon": 2.300932},
    "deals": {}
  },
  {
    "id": 1239959872,
    "name": "Beausoleil Studio",
    "starRating": 0.0,
    "guestrating": "10.0",
    "address": "Le Kremlin-Bicetre",
    "street": "Le Kremlin-Bicetre",
    "price": "",
    "features": "",
    "imgURL":
        "https://thumbnails.trvl-media.com/i7s3HIwn_uewU4CydL9KDCQaXcA=/250x140/smart/filters:quality(60)/images.trvl-media.com/hotels/39000000/38720000/38717500/38717496/a7d42487_z.jpg",
    "coordinate": {"lat": 48.808885, "lon": 2.362368},
    "deals": {}
  },
  {
    "id": 1446475392,
    "name": "Suite Vetiver great Apt  best loc",
    "starRating": 0.0,
    "guestrating": "10.0",
    "address": "Paris",
    "street": "Paris",
    "price": "",
    "features": "",
    "imgURL":
        "https://thumbnails.trvl-media.com/8FLOpgVuAoY0I1sHb9Y77-uExuQ=/250x140/smart/filters:quality(60)/images.trvl-media.com/hotels/46000000/45180000/45171200/45171106/a80779c3_z.jpg",
    "coordinate": {"lat": 48.880125, "lon": 2.297378},
    "deals": {}
  },
  // {
  //   "id": 1254648672,
  //   "name": "La Maison de Robinson",
  //   "starRating": 0.0,
  //   "guestrating": "10.0",
  //   "address": "Le Plessis-Robinson",
  //   "street": "Le Plessis-Robinson",
  //   "price": {"old_price": 549.9, "new_price": "\$550"},
  //   "features": {"paymentPreference": false, "noCCRequired": false},
  //   "imgURL":
  //       "https://thumbnails.trvl-media.com/vBjR62jPGiAidItVNNova6Q8FLE=/250x140/smart/filters:quality(60)/images.trvl-media.com/hotels/40000000/39180000/39176600/39176521/36eda940_z.jpg",
  //   "coordinate": {"lat": 48.77575, "lon": 2.264032},
  //   "deals": {}
  // },
  // {
  //   "id": 1119297664,
  //   "name": "Villa Trianon Versailles",
  //   "starRating": 0.0,
  //   "guestrating": "10.0",
  //   "address": "Le Chesnay",
  //   "street": "Le Chesnay",
  //   "price": "",
  //   "features": "",
  //   "imgURL":
  //       "https://thumbnails.trvl-media.com/xM3THVa52nFGJJrOBORBWfYxoQk=/250x140/smart/filters:quality(60)/images.trvl-media.com/hotels/35000000/34950000/34946900/34946802/21ebb6b0_z.jpg",
  //   "coordinate": {"lat": 48.82121, "lon": 2.127196},
  //   "deals": {}
  // },
  // {
  //   "id": 418484,
  //   "name": "H\u00f4tel 33 Marbeuf",
  //   "starRating": 0.0,
  //   "guestrating": "10.0",
  //   "address": "Paris",
  //   "street": "Paris",
  //   "price": {"old_price": 228.76, "new_price": "\$229"},
  //   "features": {"paymentPreference": false, "noCCRequired": false},
  //   "imgURL":
  //       "https://thumbnails.trvl-media.com/-N0vZEkJnuOqka8bA1mnnt8JbP4=/250x140/smart/filters:quality(60)/images.trvl-media.com/hotels/6000000/5410000/5400400/5400382/6990ce75_z.jpg",
  //   "coordinate": {"lat": 48.869309, "lon": 2.304859},
  //   "deals": {}
  // },
  // {
  //   "id": 1364431840,
  //   "name": "Yays Issy Concierged Boutique Apartments",
  //   "starRating": 0.0,
  //   "guestrating": "10.0",
  //   "address": "Issy-les-Moulineaux",
  //   "street": "Issy-les-Moulineaux",
  //   "price": {"old_price": 81.3, "new_price": "\$81"},
  //   "features": {"paymentPreference": false, "noCCRequired": false},
  //   "imgURL":
  //       "https://thumbnails.trvl-media.com/i_Wn9xLzfHskQ8-uAuTHddSgWjM=/250x140/smart/filters:quality(60)/images.trvl-media.com/hotels/43000000/42610000/42607300/42607245/e9c137f5_z.jpg",
  //   "coordinate": {"lat": 48.821614, "lon": 2.265273},
  //   "deals": {}
  // },
  // {
  //   "id": 1471599776,
  //   "name": "Edgar Suites Spacious Apartment Martyrs",
  //   "starRating": 0.0,
  //   "guestrating": "10.0",
  //   "address": "Paris",
  //   "street": "Paris",
  //   "price": "",
  //   "features": "",
  //   "imgURL":
  //       "https://thumbnails.trvl-media.com/pSij8F4nNhAlMoCL96UidtVhB3o=/250x140/smart/filters:quality(60)/images.trvl-media.com/hotels/46000000/45960000/45956300/45956243/bffae4e6_z.jpg",
  //   "coordinate": {"lat": 48.877329, "lon": 2.339749},
  //   "deals": {}
  // },
  // {
  //   "id": 1173184864,
  //   "name": "Apartment R\u00e9publique",
  //   "starRating": 3.5,
  //   "guestrating": "10.0",
  //   "address": "Paris",
  //   "street": "Paris",
  //   "price": "",
  //   "features": "",
  //   "imgURL":
  //       "https://thumbnails.trvl-media.com/-b6b0ysd2H1Wu6eRHzU_7CrvyWA=/250x140/smart/filters:quality(60)/images.trvl-media.com/hotels/37000000/36640000/36630800/36630777/7ae43d99_y.jpg",
  //   "coordinate": {"lat": 48.86901, "lon": 2.3584},
  //   "deals": {}
  // },
  // {
  //   "id": 1655121504,
  //   "name": "Louvre Paris Guesthouse",
  //   "starRating": 0.0,
  //   "guestrating": "10.0",
  //   "address": "Paris",
  //   "street": "Paris",
  //   "price": "",
  //   "features": "",
  //   "imgURL":
  //       "https://thumbnails.trvl-media.com/STfhj18PDZ5-RneQlrTZUUGRzg0=/250x140/smart/filters:quality(60)/images.trvl-media.com/hotels/52000000/51700000/51691300/51691297/883134a1_z.jpg",
  //   "coordinate": {"lat": 48.868518, "lon": 2.335418},
  //   "deals": {}
  // },
  // {
  //   "id": 1752411488,
  //   "name": "S\u00e9jours & Affaires Paris Vincennes",
  //   "starRating": 0.0,
  //   "guestrating": "10.0",
  //   "address": "Vincennes",
  //   "street": "Vincennes",
  //   "price": "",
  //   "features": "",
  //   "imgURL":
  //       "https://thumbnails.trvl-media.com/z1-_fJ8C2f7SYB6lJTMRQ6LJoCk=/250x140/smart/filters:quality(60)/images.trvl-media.com/hotels/55000000/54740000/54731700/54731609/62858cd4_z.jpg",
  //   "coordinate": {"lat": 48.845941, "lon": 2.456674},
  //   "deals": {}
  // },
  // {
  //   "id": 566784,
  //   "name": "Du C\u00f4t\u00e9 De Chez Jos",
  //   "starRating": 0.0,
  //   "guestrating": "10.0",
  //   "address": "Colombes",
  //   "street": "Colombes",
  //   "price": "",
  //   "features": "",
  //   "imgURL":
  //       "https://thumbnails.trvl-media.com/viZlGgW4N6INPF1kpTst9n3WOik=/250x140/smart/filters:quality(60)/images.trvl-media.com/hotels/14000000/13200000/13196000/13195994/8559de1e_z.jpg",
  //   "coordinate": {"lat": 48.919093, "lon": 2.230744},
  //   "deals": {}
  // },
  // {
  //   "id": 1429049952,
  //   "name": "Bed & Breakfast Crosne Plazza & Spa",
  //   "starRating": 0.0,
  //   "guestrating": "10.0",
  //   "address": "Crosne",
  //   "street": "Crosne",
  //   "price": {"old_price": 156.73, "new_price": "\$157"},
  //   "features": {"paymentPreference": false, "noCCRequired": false},
  //   "imgURL":
  //       "https://thumbnails.trvl-media.com/fvKeLbBf17DLm4k66HRdbiV9LaI=/250x140/smart/filters:quality(60)/images.trvl-media.com/hotels/45000000/44630000/44626600/44626561/0546b484_z.jpg",
  //   "coordinate": {"lat": 48.713873, "lon": 2.464837},
  //   "deals": {}
  // },
  // {
  //   "id": 1025047104,
  //   "name": "Havre de paix",
  //   "starRating": 0.0,
  //   "guestrating": "10.0",
  //   "address": "Chatillon",
  //   "street": "Chatillon",
  //   "price": "",
  //   "features": "",
  //   "imgURL":
  //       "https://thumbnails.trvl-media.com/pAt1OqxKRB1WHLZ3Zr-cXqAmZso=/250x140/smart/filters:quality(60)/images.trvl-media.com/hotels/33000000/32010000/32001500/32001472/0454c283_z.jpg",
  //   "coordinate": {"lat": 48.800862, "lon": 2.27937},
  //   "deals": {}
  // },
  // {
  //   "id": 1800195296,
  //   "name": "Appartement Arc de Triomphe George V",
  //   "starRating": 0.0,
  //   "guestrating": "10.0",
  //   "address": "Paris",
  //   "street": "Paris",
  //   "price": "",
  //   "features": "",
  //   "imgURL":
  //       "https://thumbnails.trvl-media.com/DlmDsyY3SrYOz-bRDx6qAvN3eBI=/250x140/smart/filters:quality(60)/images.trvl-media.com/hotels/57000000/56230000/56224900/56224853/4b0eaa99_z.jpg",
  //   "coordinate": {"lat": 48.87336, "lon": 2.30319},
  //   "deals": {}
  // },
  // {
  //   "id": 1909593632,
  //   "name": "Relax - Romance  Jacuzzi - Paris",
  //   "starRating": 0.0,
  //   "guestrating": "10.0",
  //   "address": "Gentilly",
  //   "street": "Gentilly",
  //   "price": {"old_price": 128.55, "new_price": "\$129"},
  //   "features": {"paymentPreference": false, "noCCRequired": false},
  //   "imgURL":
  //       "https://thumbnails.trvl-media.com/FxBnHnvTesiAIvtVhPOBqhd2u1I=/250x140/smart/filters:quality(60)/images.trvl-media.com/hotels/60000000/59650000/59643600/59643551/37307e76_z.jpg",
  //   "coordinate": {"lat": 48.813739, "lon": 2.343071},
  //   "deals": {}
  // },
  // {
  //   "id": 1309943104,
  //   "name": "Meubl\u00e9s de Tourisme \u00e0 Vincennes",
  //   "starRating": 0.0,
  //   "guestrating": "10.0",
  //   "address": "Vincennes",
  //   "street": "Vincennes",
  //   "price": "",
  //   "features": "",
  //   "imgURL":
  //       "https://thumbnails.trvl-media.com/ebQAqUvi4tDQ9F8_t7DIZ7q4rh4=/250x140/smart/filters:quality(60)/images.trvl-media.com/hotels/41000000/40910000/40904500/40904472/c703d29b_z.jpg",
  //   "coordinate": {"lat": 48.845011, "lon": 2.43232},
  //   "deals": {}
  // },
  // {
  //   "id": 1920965088,
  //   "name": "Guestready - Lovely Studio for 2 / Eiffel Tower - Prime Location!",
  //   "starRating": 2.5,
  //   "guestrating": "10.0",
  //   "address": "Paris",
  //   "street": "Paris",
  //   "price": "",
  //   "features": "",
  //   "imgURL":
  //       "https://thumbnails.trvl-media.com/WQ0CFc6z5TcaBgaBhEE3vlvBRVc=/250x140/smart/filters:quality(60)/images.trvl-media.com/hotels/60000000/60000000/59999000/59998909/ba1590df_z.jpg",
  //   "coordinate": {"lat": 48.849845, "lon": 2.289024},
  //   "deals": {}
  // },
  // {
  //   "id": 282578,
  //   "name": "Tribe Paris Batignolles",
  //   "starRating": 4.0,
  //   "guestrating": "10.0",
  //   "address": "Paris",
  //   "street": "Paris",
  //   "price": {"old_price": 122.41, "new_price": "\$122"},
  //   "features": {"paymentPreference": false, "noCCRequired": false},
  //   "imgURL":
  //       "https://thumbnails.trvl-media.com/VggHdPREDLxInx1RXT6t5xCWaNo=/250x140/smart/filters:quality(60)/images.trvl-media.com/hotels/1000000/40000/34500/34484/b85a6fd0_z.jpg",
  //   "coordinate": {"lat": 48.89054, "lon": 2.31753},
  //   "deals": {}
  // },
  // {
  //   "id": 1856831392,
  //   "name": "La Cl\u00e9 des Expos \"In Paris\" 2",
  //   "starRating": 3.0,
  //   "guestrating": "10.0",
  //   "address": "Arcueil",
  //   "street": "Arcueil",
  //   "price": "",
  //   "features": "",
  //   "imgURL":
  //       "https://thumbnails.trvl-media.com/ls6RpQ9OisLNszl4lo79271vTpk=/250x140/smart/filters:quality(60)/images.trvl-media.com/hotels/58000000/58000000/57994800/57994731/8a05d93e_z.jpg",
  //   "coordinate": {"lat": 48.80454, "lon": 2.32874},
  //   "deals": {}
  // },
  // {
  //   "id": 1342218528,
  //   "name": "Hotel de l'Abbaye Saint Germain",
  //   "starRating": 4.0,
  //   "guestrating": "10.0",
  //   "address": "Paris",
  //   "street": "Paris",
  //   "price": "",
  //   "features": "",
  //   "imgURL":
  //       "https://thumbnails.trvl-media.com/WZyRLs-mhaJPmvufxTmzFJwncmw=/250x140/smart/filters:quality(60)/images.trvl-media.com/hotels/42000000/41920000/41913100/41913079/ae6b6a1b_z.jpg",
  //   "coordinate": {"lat": 48.850067, "lon": 2.330756},
  //   "deals": {}
  // },
  // {
  //   "id": 1799592352,
  //   "name": "Hotel De La Gare",
  //   "starRating": 0.0,
  //   "guestrating": "10.0",
  //   "address": "Vitry-sur-Seine",
  //   "street": "Vitry-sur-Seine",
  //   "price": "",
  //   "features": "",
  //   "imgURL":
  //       "https://thumbnails.trvl-media.com/_R6bJkyv9kr4vX232Bb3aaIQ4F8=/250x140/smart/filters:quality(60)/images.trvl-media.com/hotels/57000000/56210000/56206100/56206011/de1f4a01_z.jpg",
  //   "coordinate": {"lat": 48.80117, "lon": 2.402564},
  //   "deals": {}
  // },
  // {
  //   "id": 1563307520,
  //   "name": "Roissy Appartements",
  //   "starRating": 0.0,
  //   "guestrating": "10.0",
  //   "address": "Roissy-en-France",
  //   "street": "Roissy-en-France",
  //   "price": {"old_price": 103.38, "new_price": "\$103"},
  //   "features": {"paymentPreference": false, "noCCRequired": false},
  //   "imgURL":
  //       "https://thumbnails.trvl-media.com/VSDbXEYa0oyVGnYVs52hYo5mCus=/250x140/smart/filters:quality(60)/images.trvl-media.com/hotels/49000000/48830000/48822200/48822110/34393997_z.jpg",
  //   "coordinate": {"lat": 49.00558, "lon": 2.51505},
  //   "deals": {}
  // },
  // {
  //   "id": 799390752,
  //   "name": "Family Apartment in Buttes Chaumont",
  //   "starRating": 0.0,
  //   "guestrating": "10.0",
  //   "address": "Paris",
  //   "street": "Paris",
  //   "price": {"old_price": 164.17, "new_price": "\$164"},
  //   "features": {"paymentPreference": false, "noCCRequired": false},
  //   "imgURL":
  //       "https://thumbnails.trvl-media.com/9g-U0uDoMOuflSfh1Wwl8ooiwoo=/250x140/smart/filters:quality(60)/images.trvl-media.com/hotels/25000000/24950000/24949800/24949711/9ad94643_z.jpg",
  //   "coordinate": {"lat": 48.875427, "lon": 2.38752},
  //   "deals": {}
  // },
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
      return Colors.purple[900]!;
    case 'historic':
      return Colors.yellow[900]!;
    case 'cultural':
      return Colors.blue[900]!;
    case 'other':
      return Colors.grey[900]!;
    case 'natural':
      return Colors.green[900]!;
    case 'interesting_places':
      return Colors.red[900]!;
  }
  return Colors.pink[900]!;
}

Color selectSecondaryColor(String place) {
  switch (place) {
    case 'religion':
      return Colors.purple[100]!;
    case 'historic':
      return Colors.yellow[100]!;
    case 'cultural':
      return Colors.blue[100]!;
    case 'other':
      return Colors.grey[100]!;
    case 'natural':
      return Colors.green[100]!;
    case 'interesting_places':
      return Colors.red[100]!;
  }
  return Colors.pink[100]!;
}
