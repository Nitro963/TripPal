import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:trip_pal_null_safe/controllers/profile_controller.dart';
import 'package:trip_pal_null_safe/dialogs/change_theme_dialog.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';

import 'home_drawer_item.dart';

class HomeDrawer extends StatelessWidget {
  final controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          CustomDrawerHeader(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0 , horizontal: 14.0),
            child: Text('Personal', style: Get.theme.textTheme.bodyText2!.copyWith(fontWeight: FontWeight.bold)),
          ), 
          HomeDrawerItem(
            title: 'Manage account',
            subTitle: 'Go to your profile',
            icon: FontAwesomeIcons.solidUserCircle,
            onTap: () => Get.toNamed('/profile_page')
          ),
          HomeDrawerItem(
            title: 'Saved Places',
            subTitle: 'Check out your saved places',
            icon: FontAwesomeIcons.solidHeart,
            // onTap: () => Get.toNamed()
          ),
          HomeDrawerItem(
            title: 'Address',
            subTitle: 'Add or remove an address',
            icon: Icons.location_on,
            onTap: () {},
          ),     
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0 , horizontal: 14.0),
            child: Text('Useful Features', style: Get.theme.textTheme.bodyText2!.copyWith(fontWeight: FontWeight.bold)),
          ),       
          HomeDrawerItem(
            title: 'AI-Assistant',
            subTitle: 'Ask questions to our bot',
            icon: Icons.message,
            // onTap: () => Get.to(Chat()),
          ),
          HomeDrawerItem(
              title: 'Weather Service ',
              subTitle: 'Check the weather condition',
              icon: FontAwesomeIcons.cloudRain,
              onTap: () {
                // Get.put(WeatherBuddyController(10));
                // Get.to(() => WeatherBuddy());
              }),
          HomeDrawerItem(
              title: 'TODO List',
              subTitle: 'Save your notes',
              icon: FontAwesomeIcons.solidCheckCircle,
              onTap: () {}),
          HomeDrawerItem(
            title: 'Appearance',
            subTitle: 'Try our creative modes',
            icon: FontAwesomeIcons.glasses,
            onTap: () => Get.dialog(SelectThemeDialog())
          ),    
          HomeDrawerItem(
            title: 'Privacy policy',
            subTitle: 'See our privacy policies',
            icon: FontAwesomeIcons.lock,
            onTap: () {},
          ),
          HomeDrawerItem(
            title: 'Log out',
            subTitle: 'Return to guest mode',
            icon: Icons.logout,
            // onTap: () => Get.to(() => Login()),
          ),
          Container(
            padding: Spacing.only(top: 36.0, bottom: 24),
            child: Center(
              child: AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Trip-Pal\t\u00a9',
                    speed: Duration(microseconds: 100000),
                    textStyle: TextStyle(
                        fontSize: 16.0,
                        color : Get.theme.textTheme.headline2!.color,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomDrawerHeader extends GetView<ProfileController> {
  const CustomDrawerHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(14.0)),
      ),
      child: Row(
        children: <Widget>[
          Flexible(
            child: Hero(
              tag: 1,
              // TODO convert to fancy shimmer image
              child: Container(
                height: 120.0,
                width: 120.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  image: DecorationImage(
                      image: AssetImage('assets/images/profile.jpg'), fit: BoxFit.cover),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: Offset(2, -4),
                    ),
                  ],
                ),
              ),
            ),
          ),
          ProfileMiniInfo()
        ],
      ),
    );
  }
}

class ProfileMiniInfo extends GetView<ProfileController> {
  const ProfileMiniInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Flexible(
            flex: 2,
            child: Text(
              controller.userName,
              style: Get.theme.textTheme.headline6
            ),
          ),
          SizedBox(
            height: 6.0,
          ),
          Flexible(
            flex: 1,
            child: Text(
              controller.userSubName,
              style:  Get.theme.textTheme.subtitle2
            ),
          ),
          SizedBox(height: 8.0),
          Flexible(
            flex: 3,
            child: Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Get.theme.cardColor),
              child: Row(
                children: <Widget>[
                  InfoItem(
                    title: 'Plans',
                    count: 7,
                  ),
                  SizedBox(
                    width: 6.0,
                  ),
                  InfoItem(
                    title: 'Reviews',
                    count: 16,
                  ),
                  SizedBox(
                    width: 6.0,
                  ),
                  InfoItem(
                    title: 'Blogs',
                    count: 10,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class InfoItem extends StatelessWidget {
  const InfoItem({
    Key? key,
    required this.title,
    required this.count,
  }) : super(key: key);
  final String title;
  final int count;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
          flex: 2,
          child: Text(
            title,
            style: Get.theme.textTheme.bodyText1!.copyWith(fontSize: 10),
            // style: TextStyle(color: Colors.grey, fontSize: 10.0),
          ),
        ),
        Flexible(
          flex: 3,
          child: Text(
            count.toString(),
            style: Get.theme.textTheme.bodyText2!.copyWith(fontSize: 15),
          ),
        )
      ],
    );
  }
}
