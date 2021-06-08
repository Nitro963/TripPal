
import 'dart:ui';

import 'package:flutter/material.dart';

class TripCard extends StatelessWidget {
  const TripCard({
    Key key,
    @required this.tripType,
    @required this.tripWriter,
    @required this.tripExp,
    @required this.onTap,
    @required this.img,
  }) : super(key: key);
  final String tripType;
  final String tripWriter;
  final String tripExp;
  final onTap;
  final String img;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: FittedBox(
        fit: BoxFit.contain,
              child: Padding(
          padding:  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 9, sigmaY: 9),
              child: Container(
                padding: EdgeInsets.all(15.0),
                height: 150.0,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18.0),
                  color: Colors.white.withOpacity(0.4),
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 120.0,
                      width: 120.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          image: AssetImage(img),
                          fit: BoxFit.cover,
                          )
                      ),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Expanded(
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          tripType,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                         SizedBox(
                          height: 12.0,
                        ),
                        Text(
                          tripWriter,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                  ),
                    ),
                  ],
                                
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
