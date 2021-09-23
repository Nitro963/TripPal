import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';

class HomeDrawerItem extends StatelessWidget {
  const HomeDrawerItem(
      {Key? key,
      required this.title,
      required this.subTitle,
      this.onTap,
      required this.icon,
      required this.needLogin,
      required this.availability})
      : super(key: key);
  final String title;
  final String subTitle;
  final void Function()? onTap;
  final IconData icon;
  final bool availability;
  final bool needLogin;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: !needLogin ? onTap : null,
      child: Container(
        height: 70.0,
        padding: EdgeInsets.only(right: 16, left: 12),
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            border: Border.symmetric(
                horizontal: BorderSide(
                    color: Theme.of(context).dividerColor.withAlpha(40)))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Icon(
                    icon,
                    size: 16.0,
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(title, style: Get.theme.textTheme.subtitle1),
                            SizedBox(
                              width: MySize.size10,
                            ),
                            this.availability
                                ? Container(
                                    padding: Spacing.symmetric(
                                        horizontal: 4, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: Get.theme.primaryColor
                                          .withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      'Soon',
                                      style: Get.theme.textTheme.subtitle2!
                                          .copyWith(fontSize: 12),
                                    ),
                                  )
                                : SizedBox(),
                            this.needLogin
                                ? Container(
                                    margin: Spacing.left(6),
                                    padding: Spacing.symmetric(
                                        horizontal: 4, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: Get.theme.secondaryHeaderColor
                                          .withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      'Log-In',
                                      style: Get.theme.textTheme.subtitle2!
                                          .copyWith(fontSize: 12),
                                    ),
                                  )
                                : SizedBox()
                          ],
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                        FittedBox(
                          child: Text(subTitle,
                              style: Get.theme.textTheme.subtitle2),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Center(
              child: Icon(
                FontAwesomeIcons.angleRight,
                size: 16.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
