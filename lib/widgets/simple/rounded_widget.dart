import 'package:flutter/material.dart';

class RoundedWidget extends StatelessWidget {
  const RoundedWidget({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.grey[200]!),
          color: Colors.grey[100],
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(title),
          ),
        ),
      ),
    );
  }
}
