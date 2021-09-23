import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';

class TripTypeCard extends StatelessWidget {
  const TripTypeCard({
    Key? key,
    required this.tripType,
    required this.tripWriter,
    required this.onTap,
    required this.img,
  }) : super(key: key);
  final String tripType;
  final String tripWriter;
  final onTap;
  final String img;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4, sigmaY: 12),
              child: Container(
                padding: Spacing.all(10),
                height: MySize.getScaledSizeHeight(160),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.0),
                  color: Get.theme.backgroundColor.withOpacity(0.4),
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: MySize.getScaledSizeHeight(150),
                      width: MySize.getScaledSizeWidth(140),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.0),
                          image: DecorationImage(
                            image: AssetImage(img),
                            fit: BoxFit.cover,
                          )),
                    ),
                    SizedBox(width: MySize.size16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Flexible(
                            flex: 1,
                            child: Text(
                              tripType,
                              overflow: TextOverflow.fade,
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: onTap != null
                                      ? Colors.white
                                      : Get.theme.disabledColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(height: MySize.size12),
                          Flexible(
                            flex: 1,
                            child: Text(
                              tripWriter,
                              overflow: TextOverflow.fade,
                              style: TextStyle(
                                fontSize: 16.0,
                                color: onTap != null
                                    ? Colors.white
                                    : Get.theme.disabledColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
