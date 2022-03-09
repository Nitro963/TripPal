import 'dart:ui';

extension UtilsRTL on Locale {
  static const List<String> _rtlLanguages = <String>[
    'ar', // Arabic
    'fa', // Farsi
    'he', // Hebrew
    'ps', // Pashto
    'ur',
  ];

  bool get isRTL => _rtlLanguages.contains(languageCode);

  TextDirection get textDirection =>
      isRTL ? TextDirection.rtl : TextDirection.ltr;
}
