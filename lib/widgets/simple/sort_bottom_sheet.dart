import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip_pal_null_safe/models/sort_policy.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';

class SortBottomSheet extends StatelessWidget {
  final _radio;
  final List<SortPolicy> policies;

  SortBottomSheet({Key? key, required this.policies, int initialValue = 0})
      : _radio = RxInt(initialValue),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
            color: themeData.backgroundColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(MySize.size16),
                topRight: Radius.circular(MySize.size16))),
        child: Padding(
          padding: EdgeInsets.only(
              top: MySize.size16,
              left: MySize.size24,
              right: MySize.size24,
              bottom: MySize.size16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: MySize.size8),
                child: Column(
                  children: <Widget>[
                    ...policies.map((e) => GestureDetector(
                          onTap: () {
                            _radio.value = e.index;
                            Future.delayed(Duration(milliseconds: 300), () {
                              Get.back(result: e.index);
                            });
                          },
                          child: Row(
                            children: <Widget>[
                              Obx(() => Radio(
                                    onChanged: (value) async {
                                      _radio.value = value as int;
                                      Future.delayed(
                                          Duration(milliseconds: 300), () {
                                        Get.back(result: e.index);
                                      });
                                    },
                                    groupValue: _radio.value,
                                    value: e.index,
                                    visualDensity: VisualDensity.compact,
                                    activeColor: themeData.colorScheme.primary,
                                  )),
                              Text("${e.displayName}",
                                  style: themeData.textTheme.subtitle2!
                                      .copyWith(fontWeight: FontWeight.w600)),
                              if (e.message != null)
                                Text(' - ' + e.message!.tr,
                                    style: themeData.textTheme.subtitle2!
                                        .copyWith(fontWeight: FontWeight.w600)),
                            ],
                          ),
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
