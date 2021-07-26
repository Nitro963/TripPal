import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';

class FilterSubTitle extends StatelessWidget {
  const FilterSubTitle({
    Key? key,
    required this.filterName,
  }) : super(key: key);
  final String filterName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          filterName,
          style: Get.theme.textTheme.headline6!.copyWith(fontSize: 16.0),
        ),
      ),
    );
  }
}

class FiltersHeader extends StatelessWidget {
  const FiltersHeader({
    Key? key,
    required this.title,
    required this.subTitle,
  }) : super(key: key);
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          alignment: Alignment.topCenter,
          padding: Spacing.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(FontAwesomeIcons.rocket, color: Get.theme.toggleableActiveColor),
                  Space.width(10),
                  Text(
                    title,
                    style: Get.theme.textTheme.headline6,
                  ),
                ],
              ),
              Space.height(10),
              Text(
                subTitle,
                style: Get.theme.textTheme.subtitle2,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Padding(
          padding: Spacing.vertical(8),
          child: IconButton(
              icon: Icon(Icons.arrow_back,
                  color: Get.theme.iconTheme.color),
              onPressed: () => Get.back()),
        )
      ],
    );
  }
}
