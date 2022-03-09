import 'package:flutter/material.dart';

class BoardingPage extends StatelessWidget {
  const BoardingPage({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.description,
    required this.image,
  }) : super(key: key);

  final String title;
  final String subTitle;
  final String description;
  final ImageProvider image;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 1,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: image,
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsetsDirectional.only(top: 100.0, start: 50.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      subTitle,
                      style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.white.withOpacity(0.60),
                          fontFamily: 'Bebas'),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: 70.0,
                          color: Colors.white.withOpacity(0.60),
                          fontFamily: 'Bebas'),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 80.0),
                      child: Text(
                        description,
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white.withOpacity(0.60),
                            fontFamily: 'Lato'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
