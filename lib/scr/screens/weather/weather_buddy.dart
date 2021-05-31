import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:transformer_page_view/transformer_page_view.dart';
import 'package:travel_app/scr/controllers/weather_buddy_controller.dart';
import 'package:travel_app/scr/screens/weather/weather_buddy_places.dart';
import 'package:travel_app/scr/shared/services/transformers.dart';

import 'component/weather_page.dart';

class WeatherBuddy extends StatefulWidget {
  @override
  _WeatherBuddyState createState() => _WeatherBuddyState();
}

class _WeatherBuddyState extends State<WeatherBuddy>
    with TickerProviderStateMixin {
  final controller = Get.find<WeatherBuddyController>();
  AnimationController animationController;
  Animation<double> animation;

  void initState() {
    animationController = AnimationController(
      duration: const Duration(milliseconds: 1600),
      vsync: this,
    )..repeat();
    animation = Tween<double>(begin: 0, end: -1).animate(
        CurvedAnimation(parent: animationController, curve: Curves.linear));
    animationController.reset();
    super.initState();
  }

  Widget _buildBackground() {
    var path;
    var key;
    if (controller.hasInfo[controller.currentPage]) {
      String val = controller.weatherStatus[controller.currentPage].weatherIcon;
      if (val == '10n' || val == '11n') val = '09n';
      if (val == '10d' || val == '11d') val = '09d';
      key = ValueKey(val);
      path = '${key.value}.jpg';
    } else {
      key = ValueKey(-1);
      path = 'Empty List.jpg';
    }
    return Image.asset(
      'images/The Weather Buddy/$path',
      key: key,
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      colorBlendMode: BlendMode.darken,
      color: Colors.black38,
    );
  }

  Widget _buildEmptyPlaceHolder() {
    return Stack(
      key: ValueKey(1),
      children: [
        Image.asset(
          'images/The Weather Buddy/Empty List.jpg',
          key: ValueKey(-1),
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
          colorBlendMode: BlendMode.darken,
          color: Colors.black38,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Text('Please add some places to track!',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.bold,
                    fontSize: 24)),
          ),
        ),
      ],
    );
  }

  Widget _buildPlacesStack() {
    return Stack(key: ValueKey(0), children: [
      AnimatedSwitcher(
          duration: Duration(milliseconds: 800), child: _buildBackground()),
      PageView.builder(
          controller: controller.pageController,
          itemCount: controller.places.length,
          itemBuilder: (context, index) => Container()),
      TransformerPageView(
          scrollDirection: Axis.horizontal,
          transformer: ScaleAndFadeTransformer(),
          itemCount: controller.places.length,
          onPageChanged: (int page) {
            controller.pageController.animateToPage(page,
                duration: Duration(milliseconds: 300), curve: Curves.ease);
            controller.currentPage = page;
          },
          itemBuilder: (context, index) => WeatherPage(index: index)),
      Positioned(
          top: 90,
          left: 20,
          child: SmoothPageIndicator(
            controller: controller.pageController,
            count: controller.places.length,
            effect: ExpandingDotsEffect(
              activeDotColor: Colors.white,
              dotWidth: 16,
              dotHeight: 4,
              spacing: 3,
              expansionFactor: 2,
            ),
          )),
    ]);
  }

  Widget _buildView() {
    return Obx(() => AnimatedSwitcher(
        switchOutCurve: Curves.elasticOut,
        duration: Duration(milliseconds: 650),
        child: controller.isNotEmpty
            ? _buildPlacesStack()
            : _buildEmptyPlaceHolder()));
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          leading: BackButton(),
          actions: [
            if (controller.isNotEmpty)
              IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () async {
                    await controller
                        .removePlaceAt(controller.currentPage);
                  }),
            if (controller.isNotEmpty)
              RotationTransition(
                turns: animation,
                child: IconButton(
                    icon: Icon(Icons.sync),
                    onPressed: () async {
                      print('refresh weather state');
                      animationController.forward();
                      await controller.refreshCurrentPageWeatherInfo();
                      await animationController.animateTo(0,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeOut);
                      animationController.reset();
                    }),
              ),
            IconButton(
                icon: Icon(Icons.playlist_add),
                onPressed: () {
                  Get.to(() => WeatherBuddyPlaces());
                }),
          ],
        ),
        body: _buildView()));
  }
}
