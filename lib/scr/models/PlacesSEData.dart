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
    "id": "W331188177",
    "name": "Bıçakçı Alaaddin Cami",
    "guestrating": 1,
    "kinds": "religion,other_temples,interesting_places",
    "distance": 6.1449093,
    "coordinate": {"lat": 41.013805, "lon": 28.949715}
  },
  {
    "id": "W331188177",
    "name": "LA Town",
    "guestrating": 1,
    "kinds": "religion,other_temples,interesting_places",
    "distance": 6.1449093,
    "coordinate": {"lat": 37.42796133580664, "lon": -122.085749655962}
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
  {
    "id": 1254648672,
    "name": "La Maison de Robinson",
    "starRating": 0.0,
    "guestrating": "10.0",
    "address": "Le Plessis-Robinson",
    "street": "Le Plessis-Robinson",
    "price": {"old_price": 549.9, "new_price": "\$550"},
    "features": {"paymentPreference": false, "noCCRequired": false},
    "imgURL":
        "https://thumbnails.trvl-media.com/vBjR62jPGiAidItVNNova6Q8FLE=/250x140/smart/filters:quality(60)/images.trvl-media.com/hotels/40000000/39180000/39176600/39176521/36eda940_z.jpg",
    "coordinate": {"lat": 48.77575, "lon": 2.264032},
    "deals": {}
  },
  {
    "id": 1119297664,
    "name": "Villa Trianon Versailles",
    "starRating": 0.0,
    "guestrating": "10.0",
    "address": "Le Chesnay",
    "street": "Le Chesnay",
    "price": "",
    "features": "",
    "imgURL":
        "https://thumbnails.trvl-media.com/xM3THVa52nFGJJrOBORBWfYxoQk=/250x140/smart/filters:quality(60)/images.trvl-media.com/hotels/35000000/34950000/34946900/34946802/21ebb6b0_z.jpg",
    "coordinate": {"lat": 48.82121, "lon": 2.127196},
    "deals": {}
  },
  {
    "id": 418484,
    "name": "H\u00f4tel 33 Marbeuf",
    "starRating": 0.0,
    "guestrating": "10.0",
    "address": "Paris",
    "street": "Paris",
    "price": {"old_price": 228.76, "new_price": "\$229"},
    "features": {"paymentPreference": false, "noCCRequired": false},
    "imgURL":
        "https://thumbnails.trvl-media.com/-N0vZEkJnuOqka8bA1mnnt8JbP4=/250x140/smart/filters:quality(60)/images.trvl-media.com/hotels/6000000/5410000/5400400/5400382/6990ce75_z.jpg",
    "coordinate": {"lat": 48.869309, "lon": 2.304859},
    "deals": {}
  },
  {
    "id": 1364431840,
    "name": "Yays Issy Concierged Boutique Apartments",
    "starRating": 0.0,
    "guestrating": "10.0",
    "address": "Issy-les-Moulineaux",
    "street": "Issy-les-Moulineaux",
    "price": {"old_price": 81.3, "new_price": "\$81"},
    "features": {"paymentPreference": false, "noCCRequired": false},
    "imgURL":
        "https://thumbnails.trvl-media.com/i_Wn9xLzfHskQ8-uAuTHddSgWjM=/250x140/smart/filters:quality(60)/images.trvl-media.com/hotels/43000000/42610000/42607300/42607245/e9c137f5_z.jpg",
    "coordinate": {"lat": 48.821614, "lon": 2.265273},
    "deals": {}
  },
  {
    "id": 1471599776,
    "name": "Edgar Suites Spacious Apartment Martyrs",
    "starRating": 0.0,
    "guestrating": "10.0",
    "address": "Paris",
    "street": "Paris",
    "price": "",
    "features": "",
    "imgURL":
        "https://thumbnails.trvl-media.com/pSij8F4nNhAlMoCL96UidtVhB3o=/250x140/smart/filters:quality(60)/images.trvl-media.com/hotels/46000000/45960000/45956300/45956243/bffae4e6_z.jpg",
    "coordinate": {"lat": 48.877329, "lon": 2.339749},
    "deals": {}
  },
  {
    "id": 1173184864,
    "name": "Apartment R\u00e9publique",
    "starRating": 3.5,
    "guestrating": "10.0",
    "address": "Paris",
    "street": "Paris",
    "price": "",
    "features": "",
    "imgURL":
        "https://thumbnails.trvl-media.com/-b6b0ysd2H1Wu6eRHzU_7CrvyWA=/250x140/smart/filters:quality(60)/images.trvl-media.com/hotels/37000000/36640000/36630800/36630777/7ae43d99_y.jpg",
    "coordinate": {"lat": 48.86901, "lon": 2.3584},
    "deals": {}
  },
  {
    "id": 1655121504,
    "name": "Louvre Paris Guesthouse",
    "starRating": 0.0,
    "guestrating": "10.0",
    "address": "Paris",
    "street": "Paris",
    "price": "",
    "features": "",
    "imgURL":
        "https://thumbnails.trvl-media.com/STfhj18PDZ5-RneQlrTZUUGRzg0=/250x140/smart/filters:quality(60)/images.trvl-media.com/hotels/52000000/51700000/51691300/51691297/883134a1_z.jpg",
    "coordinate": {"lat": 48.868518, "lon": 2.335418},
    "deals": {}
  },
  {
    "id": 1752411488,
    "name": "S\u00e9jours & Affaires Paris Vincennes",
    "starRating": 0.0,
    "guestrating": "10.0",
    "address": "Vincennes",
    "street": "Vincennes",
    "price": "",
    "features": "",
    "imgURL":
        "https://thumbnails.trvl-media.com/z1-_fJ8C2f7SYB6lJTMRQ6LJoCk=/250x140/smart/filters:quality(60)/images.trvl-media.com/hotels/55000000/54740000/54731700/54731609/62858cd4_z.jpg",
    "coordinate": {"lat": 48.845941, "lon": 2.456674},
    "deals": {}
  },
  {
    "id": 566784,
    "name": "Du C\u00f4t\u00e9 De Chez Jos",
    "starRating": 0.0,
    "guestrating": "10.0",
    "address": "Colombes",
    "street": "Colombes",
    "price": "",
    "features": "",
    "imgURL":
        "https://thumbnails.trvl-media.com/viZlGgW4N6INPF1kpTst9n3WOik=/250x140/smart/filters:quality(60)/images.trvl-media.com/hotels/14000000/13200000/13196000/13195994/8559de1e_z.jpg",
    "coordinate": {"lat": 48.919093, "lon": 2.230744},
    "deals": {}
  },
  {
    "id": 1429049952,
    "name": "Bed & Breakfast Crosne Plazza & Spa",
    "starRating": 0.0,
    "guestrating": "10.0",
    "address": "Crosne",
    "street": "Crosne",
    "price": {"old_price": 156.73, "new_price": "\$157"},
    "features": {"paymentPreference": false, "noCCRequired": false},
    "imgURL":
        "https://thumbnails.trvl-media.com/fvKeLbBf17DLm4k66HRdbiV9LaI=/250x140/smart/filters:quality(60)/images.trvl-media.com/hotels/45000000/44630000/44626600/44626561/0546b484_z.jpg",
    "coordinate": {"lat": 48.713873, "lon": 2.464837},
    "deals": {}
  },
  {
    "id": 1025047104,
    "name": "Havre de paix",
    "starRating": 0.0,
    "guestrating": "10.0",
    "address": "Chatillon",
    "street": "Chatillon",
    "price": "",
    "features": "",
    "imgURL":
        "https://thumbnails.trvl-media.com/pAt1OqxKRB1WHLZ3Zr-cXqAmZso=/250x140/smart/filters:quality(60)/images.trvl-media.com/hotels/33000000/32010000/32001500/32001472/0454c283_z.jpg",
    "coordinate": {"lat": 48.800862, "lon": 2.27937},
    "deals": {}
  },
  {
    "id": 1800195296,
    "name": "Appartement Arc de Triomphe George V",
    "starRating": 0.0,
    "guestrating": "10.0",
    "address": "Paris",
    "street": "Paris",
    "price": "",
    "features": "",
    "imgURL":
        "https://thumbnails.trvl-media.com/DlmDsyY3SrYOz-bRDx6qAvN3eBI=/250x140/smart/filters:quality(60)/images.trvl-media.com/hotels/57000000/56230000/56224900/56224853/4b0eaa99_z.jpg",
    "coordinate": {"lat": 48.87336, "lon": 2.30319},
    "deals": {}
  },
  {
    "id": 1909593632,
    "name": "Relax - Romance  Jacuzzi - Paris",
    "starRating": 0.0,
    "guestrating": "10.0",
    "address": "Gentilly",
    "street": "Gentilly",
    "price": {"old_price": 128.55, "new_price": "\$129"},
    "features": {"paymentPreference": false, "noCCRequired": false},
    "imgURL":
        "https://thumbnails.trvl-media.com/FxBnHnvTesiAIvtVhPOBqhd2u1I=/250x140/smart/filters:quality(60)/images.trvl-media.com/hotels/60000000/59650000/59643600/59643551/37307e76_z.jpg",
    "coordinate": {"lat": 48.813739, "lon": 2.343071},
    "deals": {}
  },
  {
    "id": 1309943104,
    "name": "Meubl\u00e9s de Tourisme \u00e0 Vincennes",
    "starRating": 0.0,
    "guestrating": "10.0",
    "address": "Vincennes",
    "street": "Vincennes",
    "price": "",
    "features": "",
    "imgURL":
        "https://thumbnails.trvl-media.com/ebQAqUvi4tDQ9F8_t7DIZ7q4rh4=/250x140/smart/filters:quality(60)/images.trvl-media.com/hotels/41000000/40910000/40904500/40904472/c703d29b_z.jpg",
    "coordinate": {"lat": 48.845011, "lon": 2.43232},
    "deals": {}
  },
  {
    "id": 1920965088,
    "name": "Guestready - Lovely Studio for 2 / Eiffel Tower - Prime Location!",
    "starRating": 2.5,
    "guestrating": "10.0",
    "address": "Paris",
    "street": "Paris",
    "price": "",
    "features": "",
    "imgURL":
        "https://thumbnails.trvl-media.com/WQ0CFc6z5TcaBgaBhEE3vlvBRVc=/250x140/smart/filters:quality(60)/images.trvl-media.com/hotels/60000000/60000000/59999000/59998909/ba1590df_z.jpg",
    "coordinate": {"lat": 48.849845, "lon": 2.289024},
    "deals": {}
  },
  {
    "id": 282578,
    "name": "Tribe Paris Batignolles",
    "starRating": 4.0,
    "guestrating": "10.0",
    "address": "Paris",
    "street": "Paris",
    "price": {"old_price": 122.41, "new_price": "\$122"},
    "features": {"paymentPreference": false, "noCCRequired": false},
    "imgURL":
        "https://thumbnails.trvl-media.com/VggHdPREDLxInx1RXT6t5xCWaNo=/250x140/smart/filters:quality(60)/images.trvl-media.com/hotels/1000000/40000/34500/34484/b85a6fd0_z.jpg",
    "coordinate": {"lat": 48.89054, "lon": 2.31753},
    "deals": {}
  },
  {
    "id": 1856831392,
    "name": "La Cl\u00e9 des Expos \"In Paris\" 2",
    "starRating": 3.0,
    "guestrating": "10.0",
    "address": "Arcueil",
    "street": "Arcueil",
    "price": "",
    "features": "",
    "imgURL":
        "https://thumbnails.trvl-media.com/ls6RpQ9OisLNszl4lo79271vTpk=/250x140/smart/filters:quality(60)/images.trvl-media.com/hotels/58000000/58000000/57994800/57994731/8a05d93e_z.jpg",
    "coordinate": {"lat": 48.80454, "lon": 2.32874},
    "deals": {}
  },
  {
    "id": 1342218528,
    "name": "Hotel de l'Abbaye Saint Germain",
    "starRating": 4.0,
    "guestrating": "10.0",
    "address": "Paris",
    "street": "Paris",
    "price": "",
    "features": "",
    "imgURL":
        "https://thumbnails.trvl-media.com/WZyRLs-mhaJPmvufxTmzFJwncmw=/250x140/smart/filters:quality(60)/images.trvl-media.com/hotels/42000000/41920000/41913100/41913079/ae6b6a1b_z.jpg",
    "coordinate": {"lat": 48.850067, "lon": 2.330756},
    "deals": {}
  },
  {
    "id": 1799592352,
    "name": "Hotel De La Gare",
    "starRating": 0.0,
    "guestrating": "10.0",
    "address": "Vitry-sur-Seine",
    "street": "Vitry-sur-Seine",
    "price": "",
    "features": "",
    "imgURL":
        "https://thumbnails.trvl-media.com/_R6bJkyv9kr4vX232Bb3aaIQ4F8=/250x140/smart/filters:quality(60)/images.trvl-media.com/hotels/57000000/56210000/56206100/56206011/de1f4a01_z.jpg",
    "coordinate": {"lat": 48.80117, "lon": 2.402564},
    "deals": {}
  },
  {
    "id": 1563307520,
    "name": "Roissy Appartements",
    "starRating": 0.0,
    "guestrating": "10.0",
    "address": "Roissy-en-France",
    "street": "Roissy-en-France",
    "price": {"old_price": 103.38, "new_price": "\$103"},
    "features": {"paymentPreference": false, "noCCRequired": false},
    "imgURL":
        "https://thumbnails.trvl-media.com/VSDbXEYa0oyVGnYVs52hYo5mCus=/250x140/smart/filters:quality(60)/images.trvl-media.com/hotels/49000000/48830000/48822200/48822110/34393997_z.jpg",
    "coordinate": {"lat": 49.00558, "lon": 2.51505},
    "deals": {}
  },
  {
    "id": 799390752,
    "name": "Family Apartment in Buttes Chaumont",
    "starRating": 0.0,
    "guestrating": "10.0",
    "address": "Paris",
    "street": "Paris",
    "price": {"old_price": 164.17, "new_price": "\$164"},
    "features": {"paymentPreference": false, "noCCRequired": false},
    "imgURL":
        "https://thumbnails.trvl-media.com/9g-U0uDoMOuflSfh1Wwl8ooiwoo=/250x140/smart/filters:quality(60)/images.trvl-media.com/hotels/25000000/24950000/24949800/24949711/9ad94643_z.jpg",
    "coordinate": {"lat": 48.875427, "lon": 2.38752},
    "deals": {}
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
