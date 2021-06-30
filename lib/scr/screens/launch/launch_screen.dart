import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travel_app/scr/screens/Main/home.dart';
import 'Components/starting_page_view_item.dart';

class LaunchingScreen extends StatefulWidget {
  @override
  _StartingScreenState createState() => _StartingScreenState();
}

class _StartingScreenState extends State<LaunchingScreen> {
  PageController _pageController = PageController();
  double currentPage = 0;
  String img = 'images/trip_.jpg';
  @override
  void initState() {
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: <Widget>[
          PageView(
            controller: _pageController,
            children: <Widget>[
              LaunchScreenWidget(
                subTitle: 'Plan your',
                title: 'Trip',
                description: 'write something here',
                imagePath: 'images/trip_.jpg',
              ),
              LaunchScreenWidget(
                subTitle: 'Book your',
                title: 'HOTEL',
                description: 'write something here',
                imagePath: 'images/2.jpg',
              ),
              LaunchScreenWidget(
                subTitle: 'Share your',
                title: 'experience',
                description: 'write something here',
                imagePath: 'images/1.jpg',
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ClipRRect(
                  child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                      child: Container(
                        height: 100.0,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18.0),
                          color: Colors.white.withOpacity(0.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 40.0, horizontal: 30.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              SmoothPageIndicator(
                                controller: _pageController,
                                count: 3,
                                effect: WormEffect(
                                  activeDotColor: Colors.white,
                                  dotWidth: 10,
                                  dotHeight: 10,
                                  spacing: 6,
                                ),
                                onDotClicked: (index) =>
                                    _pageController.animateToPage(index,
                                        duration: Duration(milliseconds: 900),
                                        curve: Curves.bounceOut),
                              ),
                              GestureDetector(
                                onTap: () {
                                  _pageController.nextPage(
                                      duration: Duration(milliseconds: 900),
                                      curve: Curves.easeOut);
                                  setState(() {
                                    if (currentPage == 2) {
                                      Get.to(HomePagePV());
                                    }
                                  });
                                },
                                child: Text(
                                  currentPage == 2 ? 'GET STARTED': 'NEXT',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white.withOpacity(0.6),
                                     ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ))),
            ],
          )
        ],
      ),
    );
  }
}
