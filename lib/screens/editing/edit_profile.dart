import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';

// TODO change to GetView
class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  bool _passwordVisible = false;

  Widget build(BuildContext context) {
    final themeData = Get.theme;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: themeData.scaffoldBackgroundColor,
          centerTitle: true,
        ),
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: MySize.size24),
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      ClipOval(
                        child: FancyShimmerImage(
                            imageUrl:
                                'https://loremflickr.com/320/320/person?random=86',
                            width: MySize.getScaledSizeHeight(150),
                            height: MySize.getScaledSizeHeight(150),
                            boxFit: BoxFit.fill),
                      ),
                      Positioned(
                        bottom: MySize.size12,
                        right: MySize.size8,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: themeData.scaffoldBackgroundColor,
                                width: 2,
                                style: BorderStyle.solid),
                            color: themeData.colorScheme.primary,
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(MySize.size6),
                            child: Icon(
                              MdiIcons.pencil,
                              size: MySize.size20,
                              color: themeData.colorScheme.onPrimary,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Text(
                    "Marcelina Willis",
                    style: themeData.textTheme.headline6!.copyWith(
                        fontWeight: FontWeight.w600, letterSpacing: 0),
                  ),
                  Text(
                    "UI Designer",
                    style: themeData.textTheme.subtitle2!
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: MySize.size36,
                  left: MySize.size24,
                  right: MySize.size24),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: MySize.size16),
                    child: TextFormField(
                      style: themeData.textTheme.bodyText1!.copyWith(
                          letterSpacing: 0.1,
                          color: themeData.colorScheme.onBackground,
                          fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        hintText: "Name".tr,
                        hintStyle: themeData.textTheme.subtitle2!.copyWith(
                            letterSpacing: 0.1,
                            color: themeData.colorScheme.onBackground,
                            fontWeight: FontWeight.w500),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                            borderSide: BorderSide.none),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                            borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                            borderSide: BorderSide.none),
                        filled: true,
                        fillColor: themeData.colorScheme.background,
                        prefixIcon: Icon(
                          MdiIcons.accountOutline,
                        ),
                        contentPadding: EdgeInsets.all(0),
                      ),
                      controller:
                          TextEditingController(text: "Marcelina Willis"),
                      textCapitalization: TextCapitalization.sentences,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: MySize.size16),
                    child: TextFormField(
                      style: themeData.textTheme.bodyText1!.copyWith(
                          letterSpacing: 0.1,
                          color: themeData.colorScheme.onBackground,
                          fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        hintText: "Email".tr,
                        hintStyle: themeData.textTheme.subtitle2!.copyWith(
                            letterSpacing: 0.1,
                            color: themeData.colorScheme.onBackground,
                            fontWeight: FontWeight.w500),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                            borderSide: BorderSide.none),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                            borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                            borderSide: BorderSide.none),
                        filled: true,
                        fillColor: themeData.colorScheme.background,
                        prefixIcon: Icon(
                          MdiIcons.emailOutline,
                        ),
                        contentPadding: EdgeInsets.all(0),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      controller: TextEditingController(text: "nat@gmail.com"),
                      textCapitalization: TextCapitalization.sentences,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: MySize.size16),
                    child: TextFormField(
                      style: themeData.textTheme.bodyText1!.copyWith(
                          letterSpacing: 0.1,
                          color: themeData.colorScheme.onBackground,
                          fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        hintText: "Phone".tr,
                        hintStyle: themeData.textTheme.subtitle2!.copyWith(
                            letterSpacing: 0.1,
                            color: themeData.colorScheme.onBackground,
                            fontWeight: FontWeight.w500),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                            borderSide: BorderSide.none),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                            borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                            borderSide: BorderSide.none),
                        filled: true,
                        fillColor: themeData.colorScheme.background,
                        prefixIcon: Icon(
                          MdiIcons.phoneOutline,
                        ),
                        contentPadding: EdgeInsets.all(0),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      textCapitalization: TextCapitalization.sentences,
                      controller: TextEditingController(text: "091-987456321"),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: MySize.size16),
                    child: TextFormField(
                      style: themeData.textTheme.bodyText1!.copyWith(
                          letterSpacing: 0.1,
                          color: themeData.colorScheme.onBackground,
                          fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        hintText: "Change Password",
                        hintStyle: themeData.textTheme.subtitle2!.copyWith(
                            letterSpacing: 0.1,
                            color: themeData.colorScheme.onBackground,
                            fontWeight: FontWeight.w500),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                            borderSide: BorderSide.none),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                            borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                            borderSide: BorderSide.none),
                        filled: true,
                        fillColor: themeData.colorScheme.background,
                        prefixIcon: Icon(
                          MdiIcons.lockOutline,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _passwordVisible
                                ? MdiIcons.eyeOutline
                                : MdiIcons.eyeOffOutline,
                          ),
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                        contentPadding: EdgeInsets.all(0),
                      ),
                      textCapitalization: TextCapitalization.sentences,
                      obscureText: _passwordVisible,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: MySize.size24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(MySize.size8),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: themeData.colorScheme.primary.withAlpha(20),
                          blurRadius: 3,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            themeData.colorScheme.primary),
                        padding: MaterialStateProperty.all(
                          Spacing.xy(16, 0),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Update",
                        style: themeData.textTheme.button!.copyWith(
                            fontWeight: FontWeight.w600,
                            color: themeData.colorScheme.onPrimary,
                            letterSpacing: 0.3),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
