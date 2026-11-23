import 'package:flutter/material.dart';

import 'networking_utils.dart';

final starsActivationColor = const Color(0xffffaa00);

final starsDeactivationColor = const Color(0xff8C8C98);

final activationColor = const Color(0xFF0288D1);

final deactivatedColor = const Color(0xFF757575);

final kCardTitle = TextStyle(
  fontSize: 26.0,
  fontWeight: FontWeight.bold,
  color: Colors.black,
  fontFamily: 'Patrick',
);

final kFiltersSubTitle =
    TextStyle(fontSize: 16, fontFamily: 'Lato', fontWeight: FontWeight.bold);

final kFieldTitle = TextStyle(
    fontFamily: 'Patrick',
    fontSize: 18,
    color: Colors.black.withOpacity(0.8),
    fontWeight: FontWeight.bold);

final kPrimaryFiltersTitleStyle =
    TextStyle(fontFamily: 'Lato', fontSize: 25.0, fontWeight: FontWeight.bold);

final kSecondaryFiltersTitleStyle = TextStyle(
  fontFamily: 'Lato',
  fontSize: 18.0,
);

// Backend host (and optional port), configurable at build time, e.g.
// flutter run --dart-define=API_HOST=10.0.2.2:8000 --dart-define=API_USE_HTTPS=false
const LOCAL_SERVER_END_POINT = String.fromEnvironment('API_HOST',
    defaultValue: 'trippal-server.herokuapp.com');
const DEFAULT_CONNECTION_PROTOCOL =
    bool.fromEnvironment('API_USE_HTTPS', defaultValue: true)
        ? HttpScheme.https
        : HttpScheme.http;
// OpenWeatherMap key for the Weather Buddy: --dart-define=OPENWEATHER_API_KEY=...
const OPENWEATHER_API_KEY = String.fromEnvironment('OPENWEATHER_API_KEY');
const BASE_URL = '/api';
const JSON_HEADERS = {
  'Accept': 'application/json',
  'Content-Type': 'application/json'
};
