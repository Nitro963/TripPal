import 'package:flutter/material.dart';
import 'package:travel_app/scr/screens/Chat/chat.dart';
import 'package:travel_app/scr/screens/ToDoList/check_list.dart';
import 'package:travel_app/scr/screens/Home/home.dart';
import 'package:travel_app/scr/screens/LogIn/Component/password_reset.dart';
import 'package:travel_app/scr/screens/Home/place_details.dart';
import 'package:travel_app/scr/screens/Reviews/review_writing.dart';
import 'package:travel_app/scr/screens/Reviews/reviews.dart';
import 'package:travel_app/scr/shared/Constants/constants.dart';
import 'package:travel_app/scr/screens/LogIn/login.dart';
import "package:get/get.dart";
import 'package:travel_app/scr/shared/services/location.dart';
import 'scr/screens/ToDoList/Categorized_list.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Paint.enableDithering = true;
   LocationCustom location =LocationCustom();
   await location.init();  
   Get.put(location);
  runApp(
    GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: appTheme,
    home: HomePage(),
  ));
}
