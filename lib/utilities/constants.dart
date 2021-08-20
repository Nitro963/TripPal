import 'package:flutter/material.dart';

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

const LOCAL_SERVER_END_POINT = '192.168.1.103:8000';
const BASE_URL = '/api';
const JSON_HEADERS = {
  'Accept': 'application/json',
  'Content-Type': 'application/json'
};
