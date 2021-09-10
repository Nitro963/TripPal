import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:trip_pal_null_safe/models/boarding_model.dart';
import 'package:trip_pal_null_safe/screens/boarding/components.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';
import 'package:trip_pal_null_safe/utilities/transformers.dart';
import 'package:trip_pal_null_safe/widgets/smooth_page_indicator/components/effects/worm_effect.dart';
import 'package:trip_pal_null_safe/widgets/smooth_page_indicator/smooth_page_indicator.dart';
import 'package:trip_pal_null_safe/widgets/transformer_page_view/index_controller.dart';
import 'package:trip_pal_null_safe/widgets/transformer_page_view/transformer_page_view.dart';

class BoardingController extends GetxController {
  static bool boarding = true;
  final _currentPage = 0.0.obs;
  late final PageController pageController;
  late final IndexController tController;
  final List<BoardingModel> info = List<BoardingModel>.empty(growable: true);

  double get currentPage => _currentPage.value;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: 0);
    tController = IndexController();
    pageController.addListener(() {
      _currentPage.value = pageController.page!;
    });
    info.addAll([
      BoardingModel(
          title: 'Trip',
          subTitle: 'Plan your',
          description:
              "Search and try the best trip plan's, you can plan your own trip too; with the help of the best artificial intelligence technologies. Our search engine help you to find all places around the world as well as create a dynamic map for your own trip.",
          imagePath: 'assets/images/trip_.jpg'),
      BoardingModel(
        subTitle: 'Book your',
        title: 'HOTEL',
        description:
            "Search and find the best hotels around the world by using our search engine, with a high degree of filtering and customization. Share your experiences with the hotels you visited and let other users benefit from it",
        imagePath: 'assets/images/2.jpg',
      ),
      BoardingModel(
        subTitle: 'Share your',
        title: 'experience',
        description:
            "Share the best moments of your travels with other users, give your opinion of the hotels and places you visited. Share your trips plans on the newsfeed page and let other users try it out and rate your planning taste.",
        imagePath: 'assets/images/1.jpg',
      )
    ]);
  }

  void onDone() {
    boarding = false;
    GetStorage().write('boarding', false);
    Get.offNamed('/login');
  }

  void onPageChanged(int page) {
    pageController
        .animateToPage(page,
            duration: Duration(milliseconds: 900), curve: Curves.ease)
        .then((_) {
      _currentPage.value = double.parse(page.toString());
    });
  }

  void onButtonPressed() {
    if (currentPage == info.length - 1) {
      onDone();
      return;
    }
    tController.next();
    // pageController.nextPage(
    //     duration: Duration(milliseconds: 900), curve: Curves.easeOut);
  }
}

class BoardingScreen extends GetView<BoardingController> {
  @override
  Widget build(BuildContext context) {
    MySize.init(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox.expand(
        child: Stack(
          children: <Widget>[
            PageView.builder(
              controller: controller.pageController,
              itemCount: controller.info.length,
              itemBuilder: (_, __) => Container(color: Color(0xff495057)),
            ),
            TransformerPageView.children(
              children: controller.info
                  .map(
                    (value) => BoardingPage(data: value),
                  )
                  .toList(),
              scrollDirection: Axis.horizontal,
              transformer: DeepthPageTransformer(),
              duration: Duration(milliseconds: 900),
              onPageChanged: controller.onPageChanged,
              controller: controller.tController,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: ClipRRect(
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
                            controller: controller.pageController,
                            count: 3,
                            effect: WormEffect(
                              activeDotColor: Colors.white,
                              dotWidth: 10,
                              dotHeight: 10,
                              spacing: 6,
                            ),
                          ),
                          InkWell(
                            onTap: controller.onButtonPressed,
                            child: Obx(
                              () => Text(
                                controller.currentPage >
                                        controller.info.length - 2
                                    ? 'GET STARTED'
                                    : 'NEXT',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white.withOpacity(0.6),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
