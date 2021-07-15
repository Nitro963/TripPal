import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:travel_app/scr/controllers/profile_controller.dart';
import 'package:travel_app/scr/shared/constants.dart';

class ProfileAppbar extends StatelessWidget {
  ProfileAppbar({
    Key key, @required this.title,
  }) : super(key: key);

  final controller = Get.find<ProfileContnroller>();
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 16.0),
        width: SizeConfig.screenWidth,
        child: Stack(
          children: <Widget>[
            IconButton(
                onPressed: ()=> Get.back(),
                icon: Icon(
                  FontAwesomeIcons.arrowLeft,
                  color: Colors.black,
                  size: 16,
                )),
            Positioned(
              child: Text(
                'Favorite Places',
                style: TextStyle(color: Colors.black),
              ),
            ),
            
          ],
        ));
  }
}
