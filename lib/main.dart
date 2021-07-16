import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:travel_app/scr/screens/Main/main_page.dart';
import 'package:travel_app/scr/shared/constants.dart';


void main() async {
  Paint.enableDithering = true;
  WidgetsFlutterBinding.ensureInitialized();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: Themes.mainTheme,
    home: MainPage(),
  ));
}
