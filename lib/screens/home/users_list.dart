import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:trip_pal_null_safe/controllers/app_theme_controller.dart';
import 'package:trip_pal_null_safe/controllers/apps_controllers.dart';
import 'package:trip_pal_null_safe/controllers/model_list_view_controller.dart';
import 'package:trip_pal_null_safe/models/abstract_model.dart';
import 'package:trip_pal_null_safe/models/user.dart';
import 'package:trip_pal_null_safe/screens/home/user_profile.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';
import 'package:trip_pal_null_safe/utilities/themes.dart';
import 'package:trip_pal_null_safe/widgets/extendable/model_view.dart';
import 'package:trip_pal_null_safe/widgets/simple/blend_shimmer_image.dart';

class UsersList extends IModelView {
  @override
  IModelViewController<User> get controller => Get.find<UsersListController>();

  @override
  IconData get tileIcon => Icons.person_outline;

  Widget appointmentWidget(
      {required String image, required String docName, required String type}) {
    final themeData = Get.theme;
    final customAppTheme =
        Themes.getCustomAppTheme(Get.find<AppThemeController>().themeMode);
    return Container(
      padding: Spacing.fromLTRB(4, 4, 8, 4),
      decoration: BoxDecoration(
          color: customAppTheme.bgLayer1,
          borderRadius: BorderRadius.all(Radius.circular(MySize.size12)),
          boxShadow: [
            BoxShadow(
                color: customAppTheme.shadowColor,
                blurRadius: MySize.size6,
                offset: Offset(0, MySize.size4))
          ]),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(MySize.size12)),
            child: BlendShimmerImage(
              imageUrl: image,
              width: MySize.size72,
              height: MySize.size72,
              errorWidget: Container(
                color: themeData.colorScheme.surface,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(MdiIcons.alert, color: Get.theme.errorColor),
                    Text('Error',
                        style: themeData.textTheme.caption!
                            .copyWith(color: Get.theme.errorColor))
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: MySize.size72,
              margin: Spacing.horizontal(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    docName,
                    style: themeData.textTheme.bodyText2!.copyWith(
                        color: themeData.colorScheme.onBackground,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    type,
                    style: themeData.textTheme.caption!.copyWith(
                        color: themeData.colorScheme.onBackground,
                        fontWeight: FontWeight.w500),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildViewTile(int index, IModel model, BuildContext context) {
    final user = model as User;
    return InkWell(
      onTap: () {
        // TODO navigate to profile with no edit button
        Get.to(UserProfile());
      },
      child: appointmentWidget(
        image: user.profilePicture!,
        docName: user.name,
        type: 'Received 110 likes', // TODO add user likes
      ),
    );
  }

  @override
  String get title => 'users';
}
