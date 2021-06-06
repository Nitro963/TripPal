
import 'package:flutter/material.dart';

class LaunchScreenWidget extends StatelessWidget {
  const LaunchScreenWidget({
    Key key,
    @required this.title,
    @required this.subTitle,
    @required this.description,
    @required this.imagePath,
  }) : super(key: key);

  final String title;
  final String subTitle;
  final String description;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 1,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(
            child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 100.0, left: 50.0),
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
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 70.0,
                        color: Colors.white.withOpacity(0.60),
                        fontFamily: 'Bebas'),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 80.0),
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
        )),
      ),
    );
  }
}
