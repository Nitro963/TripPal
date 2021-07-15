import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:transformer_page_view/transformer_page_view.dart';
import 'package:travel_app/scr/screens/Main/main_page.dart';
import 'Components/starting_page_view_item.dart';

class ScaleAndFadeTransformer extends PageTransformer {
  final double _fade;

  ScaleAndFadeTransformer({double fade: 0.07, double scale: 1}) : _fade = fade;

  @override
  Widget transform(Widget item, TransformInfo info) {
    double position = info.position;
    double fadeFactor = (1 - position.abs()) * (1 - _fade);
    double opacity = _fade + fadeFactor;
    return new Opacity(
      opacity: opacity,
      child: new Transform.scale(
        scale: 1,
        child: item,
      ),
    );
  }
}

class LaunchingScreen extends StatefulWidget {
  @override
  _StartingScreenState createState() => _StartingScreenState();
}

class _StartingScreenState extends State<LaunchingScreen> {
  TransformerPageController _pageController = TransformerPageController();
  bool last = false;
  String img = 'images/trip_.jpg';
  String exp1 =
      "Search and try the best trip planns, you can plan your own trip too; with the help of the best artificial intelligence technologies. Our search engine help you to find all places around the world as well as create a dynamic map for your own trip.";
  String exp2 =
      "Search and find the best hotels around the world by using our search engine, with a high degree of filtering and customization. Share your experiences with the hotels you visited and let other users benefit from it";
  String exp3 =
      "Share the best moments of your travels with other users, give your opinion of the hotels and places you visited. Share your trips plans on the newsfeed page and let other users try it out and rate your planning taste.";
  double currentPage ;
  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: <Widget>[
          TransformerPageView.children(
            pageController: _pageController,
            transformer: ScaleAndFadeTransformer(),
            children: <Widget>[
              LaunchScreenWidget(
                subTitle: 'Plan your',
                title: 'Trip',
                description: exp1,
                imagePath: 'images/trip_.jpg',
              ),
              LaunchScreenWidget(
                subTitle: 'Book your',
                title: 'HOTEL',
                description: exp2,
                imagePath: 'images/2.jpg',
              ),
              LaunchScreenWidget(
                subTitle: 'Share your',
                title: 'experience',
                description: exp3,
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
                              ),
                              GestureDetector(
                                onTap: () {
                                  _pageController.nextPage(
                                      duration: Duration(milliseconds: 700),
                                      curve: Curves.easeOut);
                                },
                                child: Text(
                                  currentPage == 2 ? 'GET STARTED' : 'NEXT',
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
