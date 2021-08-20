import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:trip_pal_null_safe/controllers/abstract_filters_controllers.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';
import 'package:trip_pal_null_safe/widgets/extendable/filters.dart';

class EventFilterDialog extends StatelessWidget {
  final List<FilterWidgetController> controllers;

  EventFilterDialog({Key? key, required this.controllers}) : super(key: key);

  Widget build(BuildContext context) {
    final themeData = Get.theme;

    final filterWidgets = controllers.map((e) {
      if (e is RangeFilterWidgetController)
        return RangeFilterWidget(controller: e);

      if (e is QuantityFilterWidgetController)
        return QuantityFilterWidget(controller: e);

      if (e is CategoricalFilterWidgetController)
        return CategoricalFilterWidget(controller: e);

      return DateFilterWidget(controller: e as DateFilterWidgetController);
    }).toList();

    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildDialogHeader(themeData),
              ...filterWidgets,
              Container(
                margin: Spacing.vertical(16),
                child: Row(
                  children: [
                    Expanded(
                      child: CupertinoButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Center(
                          child: Text(
                            "CANCEL".tr,
                            style: themeData.textTheme.caption!.copyWith(
                                fontSize: 12,
                                color: themeData.colorScheme.primary,
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: ElevatedButton(
                          style: ButtonStyle(
                              padding:
                                  MaterialStateProperty.all(Spacing.xy(16, 0))),
                          onPressed: () {
                            Get.back(result: true);
                          },
                          child: Text(
                            "APPLY".tr,
                            style: themeData.textTheme.caption!.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                letterSpacing: 0.5,
                                color: themeData.colorScheme.onPrimary),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Container buildDialogHeader(ThemeData themeData) {
    return Container(
      margin: Spacing.only(top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              Get.back();
            },
            splashRadius: MySize.size8,
            padding: EdgeInsets.zero,
            icon: Icon(
              MdiIcons.close,
              color: themeData.colorScheme.onBackground,
              size: MySize.size16,
            ),
          ),
          Text(
            "Filter".tr.toUpperCase(),
            style: themeData.textTheme.caption!.copyWith(
                fontWeight: FontWeight.w700,
                color: themeData.colorScheme.onBackground),
          ),
          CupertinoButton(
            onPressed: () {
              controllers.forEach((e) {
                e.reset();
              });
            },
            borderRadius: BorderRadius.zero,
            child: Text(
              'Reset'.tr,
              style: themeData.textTheme.caption!.copyWith(
                  fontSize: 12,
                  letterSpacing: 0,
                  fontWeight: FontWeight.w600,
                  color: themeData.colorScheme.onBackground),
            ),
          )
        ],
      ),
    );
  }
}
