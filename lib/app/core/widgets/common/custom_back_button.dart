import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({Key? key, required this.defaultRoute})
      : super(key: key);
  final String defaultRoute;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: const Icon(CupertinoIcons.back),
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
