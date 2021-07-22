import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel_app/scr/controllers/profile_controller.dart';
import 'package:get/get.dart';
import 'package:travel_app/scr/models/PlacesSEData.dart';
import 'package:travel_app/scr/screens/Trip2/trip.dart';
import 'package:travel_app/scr/screens/trip/components/trip_widget.dart';

import 'Component/profile_appbar.dart';
import 'Component/profile_card.dart';

class ProfilePage extends StatelessWidget {
  final selectedIndex = 0.obs;
  final controller = PageController();
  final profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    // List<Map<String, String>> trips = [];
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.blue[300],
    ));
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        toolbarHeight: 70.0,
        backgroundColor: Colors.grey[50],
        title: ProfileAppBar(
            image: AssetImage(profileController.imgPath),
            userName: profileController.userName,
            userDisc: profileController.userSubName),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Expanded(
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              ProfileBlockTitle(title: 'Ongoing Trip'),
              TripWidget(
                  imgPath: 'images/dubai.jpg',
                  tripType: 'Extended Trip',
                  location: 'Duabi, UAE',
                  details: 'foods and Malls Included',
                  days: 7,
                  onTap: () => Get.to(TripPlan())),
              SizedBox(height: 10.0),
              ProfileBlockTitle(title: 'Recent Trips'),
              Container(
                height: 250.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  children: <Widget>[
                    ProfileCard(
                      title: 'Ankara, Turkey',
                      subtitle: '3 Months ago',
                      image: AssetImage('images/ankara.jpg'),
                    ),
                    ProfileCard(
                      title: 'Milan, Italy',
                      subtitle: '9 Months ago',
                      image: AssetImage('images/milan.jpg'),
                    ),
                    ProfileCard(
                      title: 'Barcelona, Spain',
                      subtitle: '6 Months ago',
                      image: AssetImage('images/barcelona.jpg'),
                    ),
                    ProfileCard(
                      title: 'dubai, UAE',
                      subtitle: '3 Years ago',
                      image: AssetImage('images/dubai.jpg'),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              ProfileBlockTitle(title: 'Rated Hotels'),
              Container(
                height: 250.0,
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    ProfileCard(
                      title: dummyHotels[0]['name'],
                      subtitle: dummyHotels[0]['address'] +
                          ', ' +
                          dummyHotels[0]['street'],
                      image: NetworkImage(dummyHotels[0]['imgURL']),
                    ),
                    ProfileCard(
                      title: dummyHotels[1]['name'],
                      subtitle: dummyHotels[1]['address'] +
                          ', ' +
                          dummyHotels[1]['street'],
                      image: NetworkImage(dummyHotels[1]['imgURL']),
                    ),
                    ProfileCard(
                      title: dummyHotels[2]['name'],
                      subtitle: dummyHotels[2]['address'] +
                          ', ' +
                          dummyHotels[2]['street'],
                      image: NetworkImage(dummyHotels[2]['imgURL']),
                    ),
                    ProfileCard(
                      title: dummyHotels[3]['name'],
                      subtitle: dummyHotels[3]['address'] +
                          ', ' +
                          dummyHotels[3]['street'],
                      image: NetworkImage(dummyHotels[3]['imgURL']),
                    ),
                    ProfileCard(
                      title: dummyHotels[4]['name'],
                      subtitle: dummyHotels[4]['address'] +
                          ', ' +
                          dummyHotels[4]['street'],
                      image: NetworkImage(dummyHotels[4]['imgURL']),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
