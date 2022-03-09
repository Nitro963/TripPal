import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SystemChromeRegion extends StatelessWidget {
  const SystemChromeRegion({Key? key, required this.style, required this.child})
      : super(key: key);

  final SystemUiOverlayStyle style;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: style,
      child: child,
    );
  }
}
