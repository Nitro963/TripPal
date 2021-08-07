import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.image})
      : super(key: key);
  final String title;
  final String subtitle;
  // TODO convert to network path
  final ImageProvider image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MySize.getScaledSizeWidth(200),
      margin: EdgeInsets.only(right: 10.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[100]!),
          color: Get.theme.cardColor,
          borderRadius: BorderRadius.circular(15.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
              // TODO convert to shimmer image
              child: Image(
                image: image,
                fit: BoxFit.fill,
                height: MySize.getScaledSizeHeight(200),
              ),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(14.0),
                  topRight: Radius.circular(14.0))),
          SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: Get.theme.textTheme.subtitle1!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(subtitle,
                overflow: TextOverflow.ellipsis,
                style: Get.theme.textTheme.bodyText2),
          ),
        ],
      ),
    );
  }
}

class ProfileBlockTitle extends StatelessWidget {
  const ProfileBlockTitle({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}
