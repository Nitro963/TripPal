
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
  final AssetImage img;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        padding: EdgeInsets.all(25.0),
        height: 180.0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.0),
          image: DecorationImage(
            image: img,
            fit: BoxFit.cover,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              tripType,
              style: TextStyle(
                fontSize: 40.0,
                color: Colors.white,
              ),
            ),
            Text(
              tripWriter,
              style: TextStyle(
                fontSize: 22.0,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            Text(
              tripExp,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
