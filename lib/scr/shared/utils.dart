import 'package:flutter/material.dart';
import 'package:get/get.dart';

GetBar<Object> buildErrorSnackBar(String error) {
  return GetBar(
    duration: new Duration(seconds: 3),
    messageText: new Text(
      error,
      style: TextStyle(color: Colors.red),
    ),
    icon: Icon(Icons.error, color: Colors.red),
    maxWidth: Get.width * 0.95,
    margin: EdgeInsets.only(bottom: 20),
    borderRadius: 10,
    dismissDirection: SnackDismissDirection.HORIZONTAL,
    leftBarIndicatorColor: Colors.red,
  );
}
