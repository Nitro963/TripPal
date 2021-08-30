import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:trip_pal_null_safe/controllers/profile_controller.dart';
import 'package:trip_pal_null_safe/screens/planing/trip/trip.dart';
import 'package:trip_pal_null_safe/screens/planing/trip/trip_card.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';

import 'profile_card.dart';
import 'profile_header.dart';

// TODO add saved places
// TODO read from auth controller
class ProfilePage extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    // return SafeArea(
    //   child: Column(
    //     children: [
    //       Padding(
    //         padding: Spacing.only(left: 10, top: 10),
    //         child: ProfileHeader(
    //             image: AssetImage(controller.imgPath.value),
    //             userName: controller.userName.value,
    //             activateButtons: true,
    //             userDisc: controller.userSubName.value),
    //       ),
    //       Expanded(
    //         child: Padding(
    //           padding: Spacing.horizontal(10),
    //           child: SizedBox.expand(
    //             child: ListView(
    //               physics: BouncingScrollPhysics(),
    //               children: <Widget>[
    //                 ProfileBlockTitle(title: 'Ongoing Trip'),
    //                 TripCard(
    //                     imgPath:
    //                         'https://loremflickr.com/320/320/hotels?random=1',
    //                     tripType: 'Extended Trip',
    //                     location: 'Dubai, UAE',
    //                     details: 'foods and Malls Included',
    //                     days: 7,
    //                     onTap: () => Get.to(TripPlan())),
    //                 SizedBox(height: 10.0),
    //                 ProfileBlockTitle(title: 'Recent Trips'),
    //                 Container(
    //                   height: MySize.getScaledSizeHeight(280),
    //                   // TODO use ListView.separated don't user left margin
    //                   child: ListView(
    //                     scrollDirection: Axis.horizontal,
    //                     physics: BouncingScrollPhysics(),
    //                     children: <Widget>[
    //                       ProfileCard(
    //                         title: 'Ankara, Turkey',
    //                         subtitle: '3 Months ago',
    //                         image: AssetImage('assets/images/ankara.jpg'),
    //                       ),
    //                       ProfileCard(
    //                         title: 'Milan, Italy',
    //                         subtitle: '9 Months ago',
    //                         image: AssetImage('assets/images/milan.jpg'),
    //                       ),
    //                       ProfileCard(
    //                         title: 'Barcelona, Spain',
    //                         subtitle: '6 Months ago',
    //                         image: AssetImage('assets/images/barcelona.jpg'),
    //                       ),
    //                       ProfileCard(
    //                         title: 'dubai, UAE',
    //                         subtitle: '3 Years ago',
    //                         image: AssetImage('assets/images/dubai.jpg'),
    //                       )
    //                     ],
    //                   ),
    //                 ),
    //                 SizedBox(height: 10.0),
    //                 ProfileBlockTitle(title: 'Rated Hotels'),
    //                 // Container(
    //                 //   height: MySize.safeHeight * .25,
    //                 //   child: ListView(
    //                 //     physics: BouncingScrollPhysics(),
    //                 //     scrollDirection: Axis.horizontal,
    //                 //     children: <Widget>[
    //                 //       ...controller.availableHotels.map(
    //                 //         (e) => ProfileCard(
    //                 //           title: e.name!,
    //                 //           subtitle: e.address! + ', ' + e.street!,
    //                 //           image: NetworkImage(e.image!),
    //                 //         ),
    //                 //       )
    //                 //     ],
    //                 //   ),
    //                 // )
    //               ],
    //             ),
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
    return SafeArea(
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [Icon(Icons.person, size: 40), Text('No Elements!')],
            ),
          ),
        ],
      ),
    );
  }
}
