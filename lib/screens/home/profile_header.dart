import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';
import 'package:trip_pal_null_safe/widgets/simple/blend_shimmer_image.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    Key? key,
    required this.userName,
    required this.userDisc,
    required this.image,
    required this.activateButtons,
  }) : super(key: key);
  final String userName;
  final String userDisc;
  final image;
  final bool activateButtons;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ClipOval(
                child: BlendShimmerImage(
                    imageUrl: image,
                    width: MySize.getScaledSizeHeight(50),
                    height: MySize.getScaledSizeHeight(50),
                    boxFit: BoxFit.fill),
              ),
              SizedBox(width: 8.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Text>[
                  Text(
                    userName,
                  ),
                  Text(
                    userDisc,
                    style: Get.theme.textTheme.bodyText2,
                  )
                ],
              ),
            ],
          ),
        ),
        activateButtons
            ? Row(
                children: [
                  IconButton(
                      icon: Icon(Icons.settings,
                          size: MySize.size24, color: Colors.white),
                      onPressed: () => Get.toNamed('/profile_page/edit')),
                  IconButton(
                    icon: Icon(Icons.menu,
                        color: Get.theme.appBarTheme.iconTheme!.color,
                        size: MySize.size24),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ),
                ],
              )
            : SizedBox(),
      ],
    );
  }
}
