import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip_pal_null_safe/controllers/app_theme_controller.dart';
import 'package:trip_pal_null_safe/utilities/themes.dart';
import 'package:trip_pal_null_safe/widgets/animated/stars.dart';

// TODO extend to read from a model
class ReviewCard extends StatelessWidget {
  final bool scrollable;
  final double height;
  final void Function()? onPressed;

  const ReviewCard(
      {Key? key, this.scrollable = false, this.height = 190, this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            color: Get.theme.cardColor,
            boxShadow: [
              BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0)
            ]),
        child: TextButton(
          onPressed: onPressed,
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Get.theme.cardColor),
              overlayColor: MaterialStateProperty.all(Colors.grey.shade200),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                    side: BorderSide(
                        color: Colors.transparent, style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(20)),
              )),
          child: buildCardContent(),
        ));
  }

  Widget buildCardContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReviewHeader(),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: scrollable
                  ? BouncingScrollPhysics()
                  : NeverScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                    'A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart. I am alone, and feel the charm of existence in this spot, which was created for the bliss of souls like mine.',
                    maxLines: scrollable ? null : 5,
                    softWrap: true,
                    overflow: scrollable
                        ? TextOverflow.visible
                        : TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 15, color: const Color(0xff8C8C98))),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ReviewHeader extends StatelessWidget {
  const ReviewHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.only(right: 10.0),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/11.jpg'),
                backgroundColor: Colors.transparent,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Istiak Remon',
                  style: TextStyle(
                      fontSize: 19,
                      color: Get.find<AppThemeController>().themeMode ==
                              Themes.lightMode
                          ? Color(0xff24253D)
                          : Get.theme.colorScheme.onSurface),
                ),
                SizedBox(height: 5),
                StarRating(
                  size: 17,
                  starCount: 5,
                  rating: 4,
                  isStatic: true,
                ),
              ],
            ),
          ],
        ),
        Text('June 2017',
            style: TextStyle(fontSize: 15, color: const Color(0xff8C8C98))),
      ],
    );
  }
}
