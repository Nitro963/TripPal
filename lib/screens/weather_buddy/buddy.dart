import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip_pal_null_safe/controllers/weather_buddy_controller.dart';
import 'package:trip_pal_null_safe/screens/weather_buddy/places_list.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';
import 'package:trip_pal_null_safe/widgets/smooth_page_indicator/components/effects/expanding_dots_effect.dart';
import 'package:trip_pal_null_safe/widgets/smooth_page_indicator/smooth_page_indicator.dart';
import 'package:trip_pal_null_safe/widgets/transformer_page_view/transformer_page_view.dart';
import 'package:trip_pal_null_safe/utilities/transformers.dart';
import 'package:trip_pal_null_safe/widgets/animated/sync_button.dart';

import 'weather_page.dart';

class WeatherBuddy extends StatefulWidget {
  @override
  WeatherBuddyState createState() => WeatherBuddyState();
}

class WeatherBuddyState extends State<WeatherBuddy> {
  WeatherBuddyController get controller => Get.find<WeatherBuddyController>();

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
      'assets/images/The Weather Buddy/$path',
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
          'assets/images/The Weather Buddy/Empty List.jpg',
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
                    fontWeight: FontWeight.w300,
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
          top: MySize.getScaledSizeHeight(140) +
              2 * MediaQuery.of(context).padding.top,
          left: MySize.getScaledSizeWidth(20),
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
          leading: BackButton(color: Colors.white),
          actions: [
            if (controller.isNotEmpty)
              IconButton(
                  icon: Icon(Icons.remove, color: Colors.white),
                  onPressed: () async {
                    await controller.removePlaceAt(controller.currentPage);
                  }),
            if (controller.isNotEmpty)
              AnimatedSyncIconButton(
                  key: controller.syncButtonState,
                  color: Colors.white,
                  duration: Duration(milliseconds: 1600),
                  onPressed: controller.onSyncButtonPressed),
            IconButton(
                icon: Icon(Icons.playlist_add, color: Colors.white),
                onPressed: () {
                  Get.toNamed('/weather-buddy/list');
                }),
          ],
        ),
        body: _buildView()));
  }
}
