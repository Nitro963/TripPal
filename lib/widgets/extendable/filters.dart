import 'package:flutter/material.dart';
import 'package:get/get.dart' hide GetStringUtils;
import 'package:intl/intl.dart' as intl;
import 'package:recase/recase.dart' as recase;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';
import 'package:trip_pal_null_safe/controllers/abstract_filters_controllers.dart';

Widget singleChip({IconData? iconData, String? text, bool? isSelected}) {
  final themeData = Get.theme;
  if (iconData != null) {
    return Chip(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      backgroundColor: isSelected!
          ? themeData.colorScheme.primary
          : themeData.colorScheme.primary.withAlpha(24),
      avatar: Icon(iconData,
          size: MySize.size16,
          color: isSelected
              ? themeData.colorScheme.onPrimary
              : themeData.colorScheme.primary),
      label: Text(
        text!,
        style: themeData.textTheme.caption!.copyWith(
            fontSize: 12.5,
            color: isSelected
                ? themeData.colorScheme.onPrimary
                : themeData.colorScheme.primary,
            letterSpacing: 0,
            wordSpacing: 0,
            fontWeight: FontWeight.w500),
      ),
      padding: Spacing.fromLTRB(12, 6, 12, 6),
    );
  }
  return Chip(
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    backgroundColor: isSelected!
        ? themeData.colorScheme.primary
        : themeData.colorScheme.primary.withAlpha(24),
    label: Text(
      text!,
      style: themeData.textTheme.caption!.copyWith(
          color: isSelected
              ? themeData.colorScheme.onPrimary
              : themeData.colorScheme.primary,
          letterSpacing: 0,
          wordSpacing: 0,
          fontWeight: FontWeight.w500),
    ),
    padding: Spacing.fromLTRB(12, 6, 12, 6),
  );
}

abstract class FilterWidget extends StatelessWidget {
  final FilterWidgetController controller;

  const FilterWidget({Key? key, required this.controller}) : super(key: key);
}

class CategoricalFilterWidget extends FilterWidget {
  final CategoricalFilterWidgetController controller;

  const CategoricalFilterWidget({Key? key, required this.controller})
      : super(key: key, controller: controller);

  @override
  Widget build(BuildContext context) {
    final themeData = Get.theme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: Spacing.fromLTRB(24, 12, 24, 0),
          child: Text(
            controller.filter.attribute.titleCase.tr,
            style: themeData.textTheme.subtitle2!.copyWith(
                color: themeData.colorScheme.onBackground,
                fontWeight: FontWeight.w700),
          ),
        ),
        Container(
          margin: Spacing.fromLTRB(24, 12, 24, 0),
          child: Wrap(
            spacing: MySize.size12,
            runSpacing: MySize.size12,
            children: Iterable<Widget>.generate(controller.filter.values.length,
                (index) {
              return Obx(() => GestureDetector(
                  onTap: () {
                    controller.choice = index;
                  },
                  child: singleChip(
                      text: controller.filter.values[index].sentenceCase.tr,
                      isSelected: controller.choice == index)));
            }).toList(),
          ),
        ),
      ],
    );
  }
}

class RangeFilterWidget extends FilterWidget {
  final RangeFilterWidgetController controller;

  const RangeFilterWidget({Key? key, required this.controller})
      : super(key: key, controller: controller);

  @override
  Widget build(BuildContext context) {
    final themeData = Get.theme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: Spacing.fromLTRB(24, 12, 24, 0),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  controller.filter.attribute.titleCase.tr,
                  style: themeData.textTheme.subtitle2!.copyWith(
                      color: themeData.colorScheme.onBackground,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Obx(() => Checkbox(
                  onChanged: (_) {
                    controller.toggleActivation();
                  },
                  value: controller.activated)),
            ],
          ),
        ),
        Container(
          margin: Spacing.fromLTRB(24, 4, 24, 0),
          child: Obx(() => Text(
                '${controller.min} - ${controller.max}',
                style: themeData.textTheme.caption!.copyWith(
                    color: themeData.colorScheme.onBackground,
                    fontWeight: FontWeight.w600),
              )),
        ),
        Container(
          margin: Spacing.fromLTRB(12, 0, 12, 0),
          child: SliderTheme(
            data: SliderThemeData(
              rangeThumbShape:
                  RoundRangeSliderThumbShape(enabledThumbRadius: 7),
              trackHeight: 2,
            ),
            child: Obx(() => RangeSlider(
                  values: RangeValues(
                      controller.min.toDouble(), controller.max.toDouble()),
                  min: controller.filter.min.toDouble(),
                  max: controller.filter.max.toDouble(),
                  divisions: controller.filter.max,
                  onChanged: controller.activated
                      ? (values) {
                          var min = values.start.round();
                          var max = values.end.round();
                          if (min <= max &&
                              min >= controller.filter.min &&
                              max <= controller.filter.max) {
                            controller.min = min;
                            controller.max = max;
                          }
                        }
                      : null,
                )),
          ),
        ),
      ],
    );
  }
}

class DateFilterWidget extends FilterWidget {
  final DateFilterWidgetController controller;

  const DateFilterWidget({Key? key, required this.controller})
      : super(key: key, controller: controller);

  @override
  Widget build(BuildContext context) {
    final themeData = Get.theme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: Spacing.fromLTRB(24, 12, 24, 0),
          child: Text(
            controller.filter.attribute.titleCase.tr,
            style: themeData.textTheme.subtitle2!.copyWith(
                color: themeData.colorScheme.onBackground,
                fontWeight: FontWeight.w700),
          ),
        ),
        Container(
          margin: Spacing.fromLTRB(24, 12, 24, 0),
          child: Wrap(
            spacing: MySize.size12,
            runSpacing: MySize.size12,
            children: [
              GestureDetector(
                onTap: () {
                  controller.startDate =
                      DateTime.now().subtract(Duration(days: 1));
                  controller.endDate =
                      DateTime.now().subtract(Duration(days: 1));
                  controller.choice = 0;
                },
                onLongPress: controller.reset,
                child: Obx(() => singleChip(
                    isSelected: controller.choice == 0, text: "Yesterday".tr)),
              ),
              GestureDetector(
                onTap: () {
                  controller.choice = 1;
                  controller.startDate = DateTime.now();
                  controller.endDate = DateTime.now();
                },
                onLongPress: controller.reset,
                child: Obx(() => singleChip(
                    isSelected: controller.choice == 1, text: "Today".tr)),
              ),
              GestureDetector(
                onTap: () {
                  controller.choice = 2;
                  controller.startDate = DateTime.now().add(Duration(days: 1));
                  controller.endDate = DateTime.now().add(Duration(days: 1));
                },
                onLongPress: controller.reset,
                child: Obx(() => singleChip(
                      isSelected: controller.choice == 2,
                      text: "Tomorrow".tr,
                    )),
              ),
              GestureDetector(
                onLongPress: () {
                  var value = controller.endDate != null ? 4 : -1;
                  controller.choice = value;
                  controller.startDate = null;
                },
                onTap: () async {
                  var res = await showDatePicker(
                      context: Get.context!,
                      initialDate: controller.startDate != null
                          ? controller.startDate!
                          : DateTime.now(),
                      firstDate: DateTime(DateTime.now().year - 10),
                      cancelText: 'CANCEL'.tr,
                      confirmText: 'OK'.tr,
                      helpText: 'SELECT DATE'.tr,
                      fieldLabelText: 'Enter Date'.tr,
                      errorFormatText: 'Invalid format.'.tr,
                      errorInvalidText: 'Out of range.'.tr,
                      lastDate: DateTime(DateTime.now().year + 10));
                  if (res != null) {
                    if (controller.choice != 3) controller.choice = 3;
                    controller.startDate = res;
                  }
                },
                child: Obx(() => singleChip(
                    isSelected: controller.choice == 3 ||
                        (controller.startDate != null &&
                            controller.choice == 4),
                    text: controller.formattedStartDate,
                    iconData: MdiIcons.calendarOutline)),
              ),
              GestureDetector(
                onLongPress: () {
                  var value = controller.startDate != null ? 3 : -1;
                  controller.choice = value;
                  controller.endDate = null;
                },
                onTap: () async {
                  var res = await showDatePicker(
                      context: Get.context!,
                      initialDate: controller.endDate != null
                          ? controller.endDate!
                          : DateTime.now(),
                      firstDate: DateTime(DateTime.now().year - 10),
                      cancelText: 'CANCEL'.tr,
                      confirmText: 'OK'.tr,
                      helpText: 'SELECT DATE'.tr,
                      fieldLabelText: 'Enter Date'.tr,
                      errorFormatText: 'Invalid format.'.tr,
                      errorInvalidText: 'Out of range.'.tr,
                      lastDate: DateTime(DateTime.now().year + 10));
                  if (res != null) {
                    if (controller.choice != 4) controller.choice = 4;
                    controller.endDate = res;
                  }
                },
                child: Obx(() => singleChip(
                    isSelected: controller.choice == 4 ||
                        (controller.endDate != null && controller.choice == 3),
                    text: controller.formattedEndDate,
                    iconData: MdiIcons.calendarOutline)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class QuantityFilterWidget extends FilterWidget {
  final QuantityFilterWidgetController controller;
  final formatter = intl.NumberFormat.compact(locale: Get.locale!.toString());

  QuantityFilterWidget({Key? key, required this.controller})
      : super(key: key, controller: controller);

  String get status {
    var s = '${formatter.format(controller.start)} - ';
    s += controller.max - 1 < 0
        ? '${formatter.format(controller.end)}'
        : '\u221e';
    return s;
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Get.theme;
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: Spacing.fromLTRB(24, 12, 24, 0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    controller.filter.attribute.titleCase.tr,
                    style: themeData.textTheme.subtitle2!.copyWith(
                        color: themeData.colorScheme.onBackground,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Obx(() => Checkbox(
                    onChanged: (_) {
                      controller.toggleActivation();
                    },
                    value: controller.activated)),
              ],
            ),
          ),
          Container(
            margin: Spacing.fromLTRB(26, 4, 24, 0),
            child: Obx(() => Text(
                  status,
                  style: themeData.textTheme.caption!.copyWith(
                      color: themeData.colorScheme.onBackground,
                      fontWeight: FontWeight.w600),
                )),
          ),
          Container(
            margin: Spacing.fromLTRB(12, 0, 12, 0),
            child: SliderTheme(
              data: SliderThemeData(
                rangeThumbShape:
                    RoundRangeSliderThumbShape(enabledThumbRadius: 7),
                trackHeight: 2,
              ),
              child: Obx(() => RangeSlider(
                    values: RangeValues(controller.min, controller.max),
                    min: 0,
                    max: 1,
                    divisions: 100,
                    onChanged: controller.activated
                        ? (values) {
                            var min = values.start;
                            var max = values.end;
                            if (min <= max && min >= -1e-6 && max < 1 + 1e-6) {
                              controller.min = values.start;
                              controller.max = values.end;
                            }
                          }
                        : null,
                  )),
            ),
          ),
        ]);
  }
}
