import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:readmore/readmore.dart';
import 'package:trip_pal_null_safe/controllers/app_theme_controller.dart';
import 'package:trip_pal_null_safe/controllers/details_controller.dart';
import 'package:trip_pal_null_safe/models/hotel.dart';
import 'package:trip_pal_null_safe/models/review.dart';
// import 'package:trip_pal_null_safe/screens/review/reviews_bar_chart.dart';
import 'package:trip_pal_null_safe/services/auth_service.dart';
import 'package:trip_pal_null_safe/services/backend_service.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';
import 'package:trip_pal_null_safe/utilities/themes.dart';
import 'package:trip_pal_null_safe/utilities/utils.dart';
import 'package:trip_pal_null_safe/widgets/animated/stars.dart';
import 'package:trip_pal_null_safe/widgets/simple/avatar_overflow.dart';
import 'package:trip_pal_null_safe/widgets/simple/blend_shimmer_image.dart';
import 'package:trip_pal_null_safe/widgets/simple/place_image_card.dart';

class PlaceDetailsController extends DetailsController {
  late final int type;
  Place place = Place();
  List<Review> reviews = [];
  int count = 0;
  final _reviewsHasData = false.obs;
  late final String placeID;
  @override
  bool get hasData => super.hasData & _reviewsHasData.value;

  void onInit() {
    type = int.parse(Get.parameters['type']!);
    placeID = Get.parameters['place_id']!;
    super.onInit();
  }

  void _fetchReviews() {
    _reviewsHasData.value = false;
    Get.find<BackendService>()
        .getApiView<Review>(name: 'reviews')
        .getAllElements(queryParameters: {
      'limit': '10',
      'place': placeID,
    }).then((value) {
      count = value.count!;
      reviews = value.results;
      _reviewsHasData.value = true;
    }).onError((error, stackTrace) {
      print(stackTrace);
      errorModel = ErrorHandlerModel.fromError(error, onReady, handel: true);
      hasError = true;
    });
  }

  void _fetchPlace() {
    hasData = false;
    Get.find<BackendService>()
        .getApiView<Place>(name: type == 1 ? 'places' : 'hotels')
        .getItem(int.parse(placeID))
        .then((value) {
      place = value;
      hasData = true;
    }).onError((error, stackTrace) {
      errorModel = ErrorHandlerModel.fromError(error, onReady, handel: true);
      hasError = true;
    });
  }

  void onReady() {
    hasError = false;
    _fetchPlace();
    _fetchReviews();
  }
}

class PlaceDetailsBindings extends Bindings {
  @override
  void dependencies() {
    final tag = Get.parameters['place_id'];
    Get.put(PlaceDetailsController(), tag: tag);
  }
}

class PlaceDetails extends GetView<PlaceDetailsController> {
  Place get place => controller.place;
  late final tag;
  PlaceDetails() {
    tag = Get.parameters['place_id'];
  }
  @override
  PlaceDetailsController get controller =>
      Get.find<PlaceDetailsController>(tag: tag);

  @override
  Widget build(BuildContext context) {
    final themeData = Get.theme;
    return Obx(() => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: controller.hasError ? AppBar(elevation: 0) : null,
        body: controller.hasData
            ? CustomScrollView(
                slivers: [
                  SliverAppBar(
                    floating: false,
                    pinned: true,
                    expandedHeight: 2.3 * MySize.screenHeight / 5,
                    leading: BackButton(color: Colors.white),
                    backgroundColor: Themes.getDetailsAppBarColorFromThemeMode(
                        Get.find<AppThemeController>().themeMode),
                    flexibleSpace: FlexibleSpaceBar(
                      // title: Text(
                      //   place.name!,
                      //   style: Get.theme.textTheme.headline6!
                      //       .copyWith(color: Colors.white),
                      // ),
                      centerTitle: true,
                      background: Stack(
                        fit: StackFit.expand,
                        children: [
                          BlendShimmerImage(
                              imageUrl: place.image!, boxFit: BoxFit.cover),
                          const DecoratedBox(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment(0.0, 0.5),
                                end: Alignment(0.0, 0.0),
                                colors: <Color>[
                                  Color(0x60000000),
                                  Color(0x00000000),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      IconButton(
                        icon: Icon(Icons.location_pin, color: Colors.white),
                        onPressed: () {
                          // TODO navigate to map page
                          // Get.to(
                          //   () => MapPage(
                          //       latitude: place.latitude,
                          //       longitude: place.longitude,
                          //       placeName: controller.place.name),
                          // );
                        },
                      )
                    ],
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      margin: Spacing.left(15),
                      child: Column(
                        children: [
                          Space.height(20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(place.name!,
                                  style: themeData.textTheme.headline6!
                                      .copyWith(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold)),
                              Space.height(5),
                              if (place.guestRating != null) ...[
                                StarRating(
                                    isStatic: true,
                                    rating: place.guestRating ?? 0),
                                Space.height(20),
                                AvatarOverFlowView(
                                    reviews: controller.reviews,
                                    count: controller.count,
                                    place: place),
                                Space.height(20),
                              ],
                              ReadMoreText(
                                place.description!,
                                colorClickableText: themeData.primaryColor,
                                trimMode: TrimMode.Length,
                                trimCollapsedText: '...Read more',
                                trimExpandedText: ' Less',
                                style: themeData.textTheme.bodyText2,
                              ),
                              Space.height(3),
                              Align(
                                alignment: Alignment.centerRight,
                                child: CupertinoButton(
                                    child: Text(
                                      'Write a review',
                                      style: TextStyle(
                                        color: !Get.find<AuthControl>().isGuest
                                            ? const Color(0xffffaa00)
                                            : themeData.disabledColor,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                    onPressed: !Get.find<AuthControl>().isGuest
                                        ? () {
                                            Get.toNamed(
                                                'home/places/review-writing',
                                                arguments: place.id);
                                          }
                                        : null),
                              ),
                              if (place.guestRating != null)
                                Container(
                                  height: MySize.getScaledSizeHeight(180),
                                  margin: Spacing.left(15),
                                  child: FittedBox(
                                    fit: BoxFit.fill,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Column(children: [
                                          Text(
                                              place.guestRating
                                                      ?.toStringAsPrecision(
                                                          2) ??
                                                  '0',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      const Color(0xffffaa00),
                                                  fontSize: 60)),
                                          Text(
                                            'out of 5',
                                            style: Get.textTheme.headline6!
                                                .copyWith(
                                                    color: const Color(
                                                        0xff8c8c98)),
                                          ),
                                        ]),
                                        // SizedBox(width: 35),
                                        // Column(
                                        //   crossAxisAlignment:
                                        //       CrossAxisAlignment.end,
                                        //   children: [
                                        //     SizedBox(
                                        //         height:
                                        //             MySize.getScaledSizeHeight(
                                        //                 165),
                                        //         width:
                                        //             MySize.getScaledSizeWidth(
                                        //                 280),
                                        //         child: ReviewsBarChart.fromJson(
                                        //             place.ratingStat)),
                                        //     Padding(
                                        //       padding:
                                        //           const EdgeInsets.all(8.0),
                                        //       child: Text(
                                        //           'Total Rating ${place.totalRatings}',
                                        //           style: Get
                                        //               .textTheme.subtitle2!
                                        //               .copyWith(
                                        //                   fontWeight:
                                        //                       FontWeight.bold,
                                        //                   color: Get
                                        //                       .theme
                                        //                       .colorScheme
                                        //                       .onSurface)),
                                        //     ),
                                        //   ],
                                        // ),
                                      ],
                                    ),
                                  ),
                                ),
                              if (controller.place.properties.isNotEmpty) ...[
                                Space.height(20),
                                buildPropertiesSection(themeData),
                              ],
                              if (controller
                                  .place.similarPlaces.isNotEmpty) ...[
                                Space.height(20),
                                buildSimilarPlacesSection(themeData),
                              ],
                              Space.height(20),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
            : Center(
                child: controller.hasError
                    ? buildErrorContent(controller.errorModel!)
                    : CircularProgressIndicator())));
  }

  Column buildSimilarPlacesSection(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Places like ${controller.place.name}',
            style: theme.textTheme.headline6!
                .copyWith(fontSize: 24, fontWeight: FontWeight.bold)),
        Padding(
          padding: Spacing.vertical(20),
          child: Container(
            height: MySize.getScaledSizeHeight(200),
            child: ListView.separated(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  var place = controller.place.similarPlaces[index];
                  return PlaceImageCard(
                    place.image!,
                    place.name!,
                    MySize.getScaledSizeHeight(200),
                    MySize.getScaledSizeWidth(180),
                    onTap: () {
                      Get.offNamed(
                          '/home/place-details?type=1&place_id=${place.id}');
                    },
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(width: 15);
                },
                itemCount: controller.place.similarPlaces.length),
          ),
        ),
      ],
    );
  }

  Column buildPropertiesSection(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Properties',
            style: theme.textTheme.headline6!
                .copyWith(fontSize: 24, fontWeight: FontWeight.bold)),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 12, 8, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: place.properties
                .map((value) => Row(
                      children: [
                        Icon(Icons.assistant_photo_rounded),
                        Space.width(8),
                        Text(value.name!.capitalizeFirst!),
                      ],
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}
