import 'package:flutter/material.dart';
import 'package:trip_pal_null_safe/utilities/generator.dart';

class ImageDominantColorCover extends StatelessWidget {
  final ImageProvider provider;
  final BorderRadius? borderRadius;
  final Alignment begin;
  final Alignment end;

  const ImageDominantColorCover({
    Key? key,
    required this.provider,
    this.begin = Alignment.bottomCenter,
    this.end = Alignment.topCenter,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Generator.pickAccentColor(
        provider,
      ),
      builder: (context, snapshot) {
        var gradient = Colors.black54;
        if (snapshot.hasData) {
          gradient = snapshot.data as Color;
        }
        return Container(
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            gradient: LinearGradient(
                colors: [gradient, Colors.transparent],
                begin: begin,
                end: end,
                stops: [0.0, 1],
                tileMode: TileMode.clamp),
          ),
        );
      },
    );
  }
}
