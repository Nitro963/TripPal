import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final String picture;
  final double width;
  final double height;
  final double borderRadius;
  final void Function()? onTap;
  final Widget? child;

  ImageCard(this.picture,
      {this.child,
      this.borderRadius = 20,
      this.height = double.infinity,
      this.width = double.infinity,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(borderRadius),
      elevation: 8,
      child: InkWell(
        onTap: onTap,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: Stack(
            children: [
              // TODO convert to fancy shimmer image
              Image.asset(
                "$picture",
                height: height,
                width: width,
                fit: BoxFit.cover,
              ),
              child != null ? child! : Material(),
            ],
          ),
        ),
      ),
    );
  }
}
