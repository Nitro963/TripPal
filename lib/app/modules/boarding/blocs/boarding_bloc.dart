import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:transformer_page_view_tv/transformer_page_view.dart';

import '../../../core/bases.dart';
import '../../../core/control_mixins.dart';
import '../../../data/models/boarding_model.dart';
import '../../../routes/app_pages.dart';
import 'boarding_state.dart';

// import 'package:get_storage/get_storage.dart';

class BoardingCubit extends BaseCubit<BoardingState> with PageViewControlMixin {
  BoardingCubit()
      : super(
          BoardingState(
            const [
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
                    'Search and find the best hotels around the world by using our search engine, with a high degree of filtering and customization. Share your experiences with the hotels you visited and let other users benefit from it',
                imagePath: 'assets/images/2.jpg',
              ),
              BoardingModel(
                subTitle: 'Share your',
                title: 'experience',
                description:
                    'Share the best moments of your travels with other users, give your opinion of the hotels and places you visited. Share your trips plans on the newsfeed page and let other users try it out and rate your planning taste.',
                imagePath: 'assets/images/1.jpg',
              )
            ],
            0,
          ),
        );

  @override
  int get currentPage => state.currentPage;

  @override
  late final PageController controller;

  late final IndexController tController;

  @override
  int get totalPages => state.data.length;

  @override
  set currentPage(int value) => emit(state.copyWith({'currentPage': value}));

  @override
  void onInit() {
    super.onInit();
    controller = PageController(initialPage: 0);
    tController = IndexController();
    controller.addListener(() {
      currentPage = controller.page?.ceil() ?? 0;
    });
  }

  void onDone() {
    // TODO activate statement
    // GetStorage().write('boarding', false);
    Get.offNamed(Routes.HOME);
  }

  void onPageChanged(int? page) {
    if (page == null) return;
    animateToPage(page, const Duration(milliseconds: 900), curve: Curves.ease);
  }

  void onButtonPressed() {
    if (currentPage == state.data.length - 1) {
      onDone();
      return;
    }
    tController.next();
  }
}
