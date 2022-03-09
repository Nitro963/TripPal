import 'package:flutter/material.dart';

abstract class Config {
  static const DEFAULT_LANGUAGE_CODE = 'en';
  static const DEFAULT_COUNTRY_CODE = 'US';
  static const DEFAULT_LOCALE_ID = 0;
  static const SUPPORTED_LOCALES = [Locale('en', 'US'), Locale('ar', 'SY')];
  static const FALLBACK_LOCALE = Locale('en', 'US');
}
