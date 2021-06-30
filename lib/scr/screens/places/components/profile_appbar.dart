import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/scr/controllers/profile_controller.dart';

class ProfileAppbar extends StatelessWidget {
  ProfileAppbar({
    Key key, @required this.title,
  }) : super(key: key);

  final controller = Get.find<ProfileContnroller>();
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                color: Colors.blueGrey[900],
                fontSize: 23.0,
                fontWeight: FontWeight.bold),
          ),
          Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    controller.userName,
                    style:
                        TextStyle(color: Colors.blueGrey[900], fontSize: 14.0),
                  ),
                  Text(
                    controller.userSubName,
                    style:
                        TextStyle(color: Colors.blueGrey[600], fontSize: 8.0),
                  ),
                ],
              ),
              SizedBox(
                width: 6.0,
              ),
              Hero(
                  tag: 1,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(controller.imgPath),
                    radius: 28.0,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
