import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:trip_pal_null_safe/controllers/details_controller.dart';
import 'package:trip_pal_null_safe/models/user.dart';
import 'package:trip_pal_null_safe/screens/planing/trip/trip_card.dart';
import 'package:trip_pal_null_safe/services/backend_service.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';
import 'package:trip_pal_null_safe/utilities/utils.dart';
import 'package:trip_pal_null_safe/widgets/extendable/model_details_view.dart';

import 'profile_card.dart';
import 'profile_header.dart';

class UserProfileController extends DetailsController {
  late final User user;

  void onInit() {
    hasData = false;
    super.onInit();
  }

  void onReady() {
    Get.find<BackendService>()
        .getApiView<User>(name: 'users')
        .getItem(int.parse(Get.parameters['user_id']!))
        .then((value) {
      user = value;
      hasData = true;
    }).onError((error, stackTrace) {
      errorModel = ErrorHandlerModel.fromError(error, onReady);
      hasError = true;
    });
  }
}

class UserProfile extends DetailsScaffold {
  UserProfileController get controller => Get.find<UserProfileController>();

  @override
  PreferredSizeWidget? buildAppBar() => PreferredSize(
        preferredSize: Size(MySize.screenWidth, MySize.scaleFactorHeight * 80),
        child: SafeArea(
          child: Obx(() => controller.hasData
              ? Padding(
                  padding: Spacing.only(top: 10, left: 10),
                  child: ProfileHeader(
                    image: controller.user.profilePicture!,
                    userName: controller.user.name,
                    userDisc: controller.user.email!,
                    activateButtons: false,
                  ),
                )
              : Container()),
        ),
      );

  @override
  Widget buildBody() {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: Spacing.horizontal(10),
            child: SizedBox.expand(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: <Widget>[
                  ProfileBlockTitle(title: 'Ongoing Trip'),
                  TripCard(
                      imgPath: "https://loremflickr.com/320/320/tags?random=1",
                      tripType: 'Extended Trip',
                      location: 'Dubai, UAE',
                      details: 'foods and Malls Included',
                      days: 7,
                      onTap: null),
                  SizedBox(height: 10.0),
                  ProfileBlockTitle(title: 'Recent Trips'),
                  Container(
                    height: MySize.getScaledSizeHeight(280),
                    // TODO use ListView.separated don't user left margin
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      children: <Widget>[
                        ProfileCard(
                          title: 'Ankara, Turkey',
                          subtitle: '3 Months ago',
                          image: AssetImage('assets/images/ankara.jpg'),
                        ),
                        ProfileCard(
                          title: 'Milan, Italy',
                          subtitle: '9 Months ago',
                          image: AssetImage('assets/images/milan.jpg'),
                        ),
                        ProfileCard(
                          title: 'Barcelona, Spain',
                          subtitle: '6 Months ago',
                          image: AssetImage('assets/images/barcelona.jpg'),
                        ),
                        ProfileCard(
                          title: 'dubai, UAE',
                          subtitle: '3 Years ago',
                          image: AssetImage('assets/images/dubai.jpg'),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0),
                  ProfileBlockTitle(title: 'Rated Hotels'),
                  // Container(
                  //   height: MySize.safeHeight * .25,
                  //   child: ListView(
                  //     physics: BouncingScrollPhysics(),
                  //     scrollDirection: Axis.horizontal,
                  //     children: <Widget>[
                  //       ...controller.availableHotels.map(
                  //         (e) => ProfileCard(
                  //           title: e.name!,
                  //           subtitle: e.address! + ', ' + e.street!,
                  //           image: NetworkImage(e.image!),
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
