import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../utils/locale_extensions.dart';

class LanguageAwareIcon extends StatelessWidget {
  const LanguageAwareIcon({
    Key? key,
    required this.icon,
  }) : super(key: key);

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.rotationY(
          Localizations.localeOf(context).isRTL ? math.pi : 0),
      alignment: Alignment.center,
      child: Icon(icon),
    );
  }
}
