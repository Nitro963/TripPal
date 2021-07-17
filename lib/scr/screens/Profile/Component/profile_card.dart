import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard(
      {Key key,
      @required this.title,
      @required this.subtitle,
      @required this.image})
      : super(key: key);
  final String title;
  final String subtitle;
  final image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190.0,
      margin: EdgeInsets.only(right: 10.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[100]),
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(15.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 175.0,
            margin: EdgeInsets.only(bottom: 8.0),
            decoration: BoxDecoration(
                image: DecorationImage(image: image, fit: BoxFit.cover),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(14.0),
                    topRight: Radius.circular(14.0))),
          ),
          // SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              title,
              overflow:  TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              subtitle,
              overflow:  TextOverflow.ellipsis,
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.grey[600]),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileBlockTitle extends StatelessWidget {
  const ProfileBlockTitle({
    Key key,
    @required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical : 12.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}
