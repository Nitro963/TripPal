import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoundedTypeCard extends StatelessWidget {
  RoundedTypeCard({
    Key? key,
    required this.title,
    required this.selected,
    required this.onTap,
    this.iconName,
  }) : super(key: key);

  final String title;
  final IconData? iconName;
  final RxBool selected;
  final onTap;
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Container(
      child: GestureDetector(
        onTap: onTap,
        child: Obx(() => Container(
            padding: EdgeInsets.all(12.0),
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 6.0),
            // height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(
                  color:
                      !selected.value ? Colors.grey[350]! : Colors.grey[200]!),
              color: !selected.value
                  ? themeData.cardColor
                  : themeData.colorScheme.surface,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 6,
                  offset: Offset(2, 2), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                if (iconName != null)
                  Icon(
                    iconName,
                    color: !selected.value
                        ? themeData.colorScheme.onBackground
                        : themeData.colorScheme.onSurface,
                    size: 16.0,
                  ),
                SizedBox(
                  width: iconName != null ? 8.0 : 0.0,
                ),
                Text(title,
                    textAlign: TextAlign.center,
                    style: themeData.textTheme.subtitle1!.copyWith(
                        color: !selected.value
                            ? themeData.colorScheme.onBackground
                            : themeData.colorScheme.onSurface,
                        fontWeight: !selected.value
                            ? FontWeight.normal
                            : FontWeight.bold)),
              ],
            ))),
      ),
    );
  }
}
