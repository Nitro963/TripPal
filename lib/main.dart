import 'package:flutter/material.dart';
import 'package:travel_app/scr/screens/chat.dart';
import 'package:travel_app/scr/screens/check_list.dart';
import 'package:travel_app/scr/screens/home.dart';
import 'package:travel_app/scr/screens/place_details.dart';
import 'package:travel_app/scr/shared/constants.dart';
import 'package:travel_app/scr/screens/login.dart';
import "package:get/get.dart";
import 'scr/screens/Categorized_list.dart';
void main() {
  Paint.enableDithering = true;
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: appTheme,
    home: CategorizedList(),
  ));
}
