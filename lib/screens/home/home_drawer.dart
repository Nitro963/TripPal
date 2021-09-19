import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:trip_pal_null_safe/controllers/main_page_controller.dart';
import 'package:trip_pal_null_safe/controllers/profile_controller.dart';
import 'package:trip_pal_null_safe/dialogs/change_theme_dialog.dart';
import 'package:trip_pal_null_safe/services/auth_service.dart';
import 'package:trip_pal_null_safe/utilities/error_handlers.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';
import 'package:trip_pal_null_safe/widgets/simple/blend_shimmer_image.dart';

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
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 14.0),
            child: Text('Personal',
                style: Get.theme.textTheme.bodyText2!
                    .copyWith(fontWeight: FontWeight.bold)),
          ),
          HomeDrawerItem(
              title: 'Manage account',
              subTitle: 'Go to your profile',
              availability: false,
              needLogin: Get.find<AuthControl>().isGuest,
              icon: FontAwesomeIcons.solidUserCircle,
              onTap: () => Get.toNamed('/profile_page/edit')),
          HomeDrawerItem(
              title: 'Saved Places',
              subTitle: 'Check Out your loved places',
              availability: false,
              needLogin: Get.find<AuthControl>().isGuest,
              icon: FontAwesomeIcons.heart,
              onTap: () => Get.toNamed('/home/places/list')),
          HomeDrawerItem(
            title: 'Address',
            subTitle: 'Add or remove an address',
            availability: true,
            needLogin: Get.find<AuthControl>().isGuest,
            icon: Icons.location_on,
            onTap: () {},
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 14.0),
            child: Text('Useful Services',
                style: Get.theme.textTheme.bodyText2!
                    .copyWith(fontWeight: FontWeight.bold)),
          ),
          HomeDrawerItem(
            title: 'Dining',
            subTitle: 'Discover fine dining restaurants',
            availability: true,
            needLogin: false,
            icon: MdiIcons.pizza,
            onTap: () {},
          ),
          HomeDrawerItem(
            title: 'AI-Assistant',
            subTitle: 'Ask questions to our bot',
            icon: Icons.message,
            availability: true,
            needLogin: false,
            // onTap: () => Get.to(Chat()),
          ),
          HomeDrawerItem(
              title: 'Weather Service ',
              subTitle: 'Check the weather condition',
              icon: FontAwesomeIcons.cloudRain,
              availability: false,
              needLogin: false,
              onTap: () {
                Get.toNamed('/weather-buddy');
              }),
          HomeDrawerItem(
              title: 'TODO List',
              subTitle: 'Save your notes',
              icon: FontAwesomeIcons.solidCheckCircle,
              availability: true,
              needLogin: false,
              onTap: () {}),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 14.0),
            child: Text('Settings and  legal',
                style: Get.theme.textTheme.bodyText2!
                    .copyWith(fontWeight: FontWeight.bold)),
          ),
          HomeDrawerItem(
            title: 'Language',
            subTitle: 'Add or remove a language',
            availability: true,
            needLogin: false,
            icon: Icons.language,
            onTap: () {},
          ),
          HomeDrawerItem(
              title: 'Appearance',
              subTitle: 'Try our creative modes',
              icon: FontAwesomeIcons.glasses,
              availability: false,
              needLogin: false,
              onTap: () => Get.dialog(SelectThemeDialog())),
          HomeDrawerItem(
            title: 'Privacy policy',
            subTitle: 'See our privacy policies',
            icon: FontAwesomeIcons.lock,
            availability: true,
            needLogin: false,
            onTap: () {},
          ),
          HomeDrawerItem(
              title: 'Log out',
              subTitle: 'Return to guest mode',
              icon: Icons.logout,
              availability: false,
              needLogin: false,
              onTap: () {
                logout();
              }
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
                        color: Get.theme.textTheme.headline2!.color,
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

  Future<void> logout() async {
    Get.find<MainPageController>().inAsyncCall = true;
    try {
      await Get.find<AuthControl>().logout();
    } catch (e) {
      Get.find<MainPageController>().inAsyncCall = false;
      handelError(e, logout);
    }
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
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(10.0)),
      ),
      child: Row(
        children: <Widget>[
          Flexible(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: BlendShimmerImage(
                imageUrl: Get.find<AuthControl>().currentUser!.profilePicture!,
                boxFit: BoxFit.cover,
                height: MySize.getScaledSizeHeight(120),
                width: MySize.getScaledSizeWidth(120),
              ),
            ),
          ),
          ProfileMiniInfo()
        ],
      ),
    );
  }
}

class ProfileMiniInfo extends StatelessWidget {
  const ProfileMiniInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Flexible(
            flex: 2,
            child: Text(Get.find<AuthControl>().currentUser!.name,
                style: Get.theme.textTheme.headline6),
          ),
          SizedBox(
            height: 6.0,
          ),
          Flexible(
            flex: 1,
            child: Text(Get.find<AuthControl>().currentUser!.email!,
                style: Get.theme.textTheme.subtitle2),
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
                    count: Get.find<AuthControl>()
                            .currentUser!
                            .name
                            .contains('Guest')
                        ? 0
                        : 7,
                  ),
                  SizedBox(
                    width: 6.0,
                  ),
                  InfoItem(
                    title: 'Reviews',
                    count: Get.find<AuthControl>()
                            .currentUser!
                            .name
                            .contains('Guest')
                        ? 0
                        : 11,
                  ),
                  SizedBox(
                    width: 6.0,
                  ),
                  InfoItem(
                    title: 'Blogs',
                    count: Get.find<AuthControl>()
                            .currentUser!
                            .name
                            .contains('Guest')
                        ? 0
                        : 4,
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
