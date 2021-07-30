
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({
    Key? key,
    required this.userName,
    required this.userDisc,
    required this.image,
  }) : super(key: key);
  final String userName;
  final String userDisc;
  final image;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: image,
              radius: 24.0,
            ),
            SizedBox(width: 8.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Text>[
                Text(userName,
                   ),
                Text(
                  userDisc,
                 style: Get.theme.textTheme.bodyText2,
                )
              ],
            ),
          ],
        ),
        IconButton(
          icon: Icon(
            Icons.settings,
          ),
          onPressed: () {},
        )
      ],
    );
  }
}
