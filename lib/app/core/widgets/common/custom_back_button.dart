import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton(
      {Key? key,
      required this.defaultRoute,
      this.useCupertinoStyle = true,
      this.color})
      : super(key: key);
  final String defaultRoute;
  final bool useCupertinoStyle;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: useCupertinoStyle
            ? Icon(
                Icons.arrow_back_ios,
                color: color,
              )
            : Icon(
                Icons.arrow_back,
                color: color,
              ),
        onPressed: () {
          final navigator = Navigator.of(context);
          if (navigator.canPop()) {
            navigator.pop();
          } else {
            navigator.pushReplacementNamed(defaultRoute);
          }
        });
  }
}
