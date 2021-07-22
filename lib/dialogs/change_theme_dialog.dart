import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip_pal_null_safe/controllers/app_theme_controller.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';
import 'package:trip_pal_null_safe/utilities/themes.dart';
import 'package:trip_pal_null_safe/utilities/utils.dart';

class SelectThemeDialog extends GetView<AppThemeController> {
  void _handleRadioValueChange(int? value) {
    Get.back();
    controller.updateTheme(value!);
  }

  Widget build(BuildContext context) {
    final themeData = Get.theme;
    final rightSpacing = isRTL(Get.locale!.languageCode) ? MySize.size16 : 0.0;
    final leftSpacing = isRTL(Get.locale!.languageCode) ? 0.0 : MySize.size16;

    return Dialog(
      elevation: 0,
      shape: Shape.circular(8, shapeTypeFor: ShapeTypeFor.button),
      child: Container(
        padding: EdgeInsets.only(top: MySize.size16, bottom: MySize.size16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              padding: Spacing.only(left: 16, right: 16),
              child: GestureDetector(
                onTap: () {
                  _handleRadioValueChange(Themes.lightMode);
                },
                child: Row(
                  children: <Widget>[
                    Obx(() => Radio(
                          onChanged: (dynamic value) {
                            _handleRadioValueChange(value);
                          },
                          groupValue: controller.themeMode,
                          value: Themes.lightMode,
                          activeColor: themeData.colorScheme.primary,
                        )),
                    Text("Light Theme".tr,
                        style: themeData.textTheme.subtitle1!
                            .copyWith(fontWeight: FontWeight.w600)),
                    Container(
                      margin: EdgeInsets.only(
                          right: rightSpacing, left: leftSpacing),
                      width: MySize.size22,
                      height: MySize.size22,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: themeData.colorScheme.onBackground,
                              width: 1),
                          color: Themes.lightTheme.backgroundColor,
                          borderRadius: BorderRadius.all(Radius.circular(11))),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          right: rightSpacing / 2, left: leftSpacing / 2),
                      width: MySize.size22,
                      height: MySize.size22,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: themeData.colorScheme.onBackground,
                              width: 1),
                          color: Themes.lightTheme.colorScheme.primary,
                          borderRadius: BorderRadius.all(Radius.circular(11))),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          right: rightSpacing / 2, left: leftSpacing / 2),
                      width: MySize.size22,
                      height: MySize.size22,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: themeData.colorScheme.onBackground,
                              width: 1),
                          color: Themes.lightTheme.colorScheme.secondary,
                          borderRadius: BorderRadius.all(Radius.circular(11))),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: Spacing.only(left: 16, right: 16),
              child: GestureDetector(
                onTap: () {
                  _handleRadioValueChange(Themes.darkMode);
                },
                child: Row(
                  children: <Widget>[
                    Obx(() => Radio(
                          onChanged: (dynamic value) {
                            _handleRadioValueChange(value);
                          },
                          groupValue: controller.themeMode,
                          value: Themes.darkMode,
                          activeColor: themeData.colorScheme.secondary,
                        )),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 3 * leftSpacing / MySize.size16,
                          right: 3 * rightSpacing / MySize.size16),
                      child: Text("Dark Theme".tr,
                          style: themeData.textTheme.subtitle1!
                              .copyWith(fontWeight: FontWeight.w600)),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          right: rightSpacing, left: leftSpacing),
                      width: MySize.size22,
                      height: MySize.size22,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: themeData.colorScheme.onBackground,
                              width: 1),
                          color: Themes.darkTheme.backgroundColor,
                          borderRadius: BorderRadius.all(Radius.circular(11))),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          right: rightSpacing / 2, left: leftSpacing / 2),
                      width: MySize.size22,
                      height: MySize.size22,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: themeData.colorScheme.onBackground,
                              width: 1),
                          color: Themes.darkTheme.colorScheme.primary,
                          borderRadius: BorderRadius.all(Radius.circular(11))),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          right: rightSpacing / 2, left: leftSpacing / 2),
                      width: MySize.size22,
                      height: MySize.size22,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: themeData.colorScheme.onBackground,
                              width: 1),
                          color: Themes.darkTheme.colorScheme.secondary,
                          borderRadius: BorderRadius.all(Radius.circular(11))),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
