import 'package:flutter/material.dart';
import 'package:trip_pal_null_safe/models/boarding_model.dart';

class BoardingPage extends StatelessWidget {
  const BoardingPage({
    Key? key,
    required this.data,
  }) : super(key: key);
  final BoardingModel data;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 1,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(data.imagePath),
            fit: BoxFit.cover,
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
                    data.subTitle,
                    style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.white.withOpacity(0.60),
                        fontFamily: 'Bebas'),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    data.title,
                    style: TextStyle(
                        fontSize: 70.0,
                        color: Colors.white.withOpacity(0.70),
                        fontFamily: 'Bebas'),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 80.0),
                    child: Text(
                      data.description,
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white.withOpacity(0.78),
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
