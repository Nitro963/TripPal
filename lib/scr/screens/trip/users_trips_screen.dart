import 'package:flutter/material.dart';

class UsersTripsScreen extends StatefulWidget {
  const UsersTripsScreen({ Key key }) : super(key: key);

  @override
  _UsersTripsScreenState createState() => _UsersTripsScreenState();
}

class _UsersTripsScreenState extends State<UsersTripsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Text('Trips'),
      ),
      
    );
  }
}