import 'package:get/get.dart';
import 'package:trip_pal_null_safe/controllers/hotel_search_controller.dart';
import 'package:trip_pal_null_safe/controllers/places_search_view_controller.dart';
import 'package:trip_pal_null_safe/controllers/profile_controller.dart';
import 'package:trip_pal_null_safe/controllers/reviews_list_controller.dart';
import 'package:trip_pal_null_safe/controllers/search_bar_controller.dart';
import 'package:trip_pal_null_safe/controllers/trips_controller.dart';
import 'package:trip_pal_null_safe/controllers/weather_buddy_controller.dart';
import 'package:trip_pal_null_safe/main.dart';
import 'package:trip_pal_null_safe/screens/boarding/boarding.dart';
import 'package:trip_pal_null_safe/screens/boarding/loading.dart';
import 'package:trip_pal_null_safe/screens/credentials/Profile_page.dart';
import 'package:trip_pal_null_safe/screens/credentials/login.dart';
import 'package:trip_pal_null_safe/screens/credentials/password_reset.dart';
import 'package:trip_pal_null_safe/screens/credentials/register.dart';
import 'package:trip_pal_null_safe/screens/home/blogs_page.dart';
import 'package:trip_pal_null_safe/screens/home/hotel_search_page.dart';
import 'package:trip_pal_null_safe/screens/planing/places_search_page.dart';
import 'package:trip_pal_null_safe/screens/planing/trip/trip_types_screen.dart';
import 'package:trip_pal_null_safe/screens/review/review_writing.dart';
import 'package:trip_pal_null_safe/screens/weather_buddy/buddy.dart';
import 'package:trip_pal_null_safe/screens/weather_buddy/places_list.dart';
import 'package:trip_pal_null_safe/screens/weather_buddy/search_view.dart';
import 'package:trip_pal_null_safe/screens/review/reviews_list_1.dart';
import 'package:trip_pal_null_safe/utilities/routes_middleware.dart';

import 'screens/details/blog_details.dart';

List<GetPage> pages = [
  GetPage(
      name: '/loading',
      page: () => LoadingScreen(),
      middlewares: [GlobalMiddleWare()],
      binding: BindingsBuilder.put(() => LoadController())),
  GetPage(
    name: '/boarding',
    page: () => BoardingScreen(),
    binding: BindingsBuilder.put(() => BoardingController()),
  ),
  GetPage(
    name: '/trips_page',
    page: () => TripsPage(),
    binding: BindingsBuilder.put(() => TripsController()),
  ),
  GetPage(
    name: '/hotels_page',
    page: () => HotelSearchPage(),
    binding: BindingsBuilder.put(() => HotelSearchController()),
  ),
  GetPage(
    name: '/blogs_page',
    page: () => Blog(),
    binding: BindingsBuilder.put(() => BlogViewController()),
  ),
  GetPage(
    name: '/places_page',
    page: () => (PlacesSearchEngine()),
    binding: BindingsBuilder.put(() => SearchBarController()),
  ),
  GetPage(
    name: '/profile_page',
    page: () => (ProfilePage()),
    binding: BindingsBuilder.put(() => ProfileController()),
  ),
  GetPage(
      name: '/home',
      page: () => MyHomePage(title: 'TripPal'),
      middlewares: [GlobalMiddleWare()]),
  GetPage(name: '/login', page: () => Login()),
  GetPage(name: '/register', page: () => SignUp()),
  GetPage(name: '/password-reset', page: () => PasswordReset()),
  GetPage(
      name: '/reviews',
      page: () => ReviewList(),
      binding: BindingsBuilder.put(() => ReviewsListController()),
      middlewares: [GlobalMiddleWare()]),
  GetPage(
      name: '/review-writing',
      page: () => ReviewWriting(),
      middlewares: [GlobalMiddleWare()]),
  GetPage(
      name: '/weather-buddy',
      page: () => WeatherBuddy(),
      // TODO store places locally.
      binding: BindingsBuilder.put(() => WeatherBuddyController(6)),
      middlewares: [GlobalMiddleWare()]),
  GetPage(
      name: '/weather-buddy/list',
      page: () => WeatherBuddyPlaces(),
      middlewares: [GlobalMiddleWare()]),
  GetPage(
      name: '/weather-buddy/list/search',
      page: () => PlacesSearch(),
      binding: BindingsBuilder.put(() => PlacesSearchViewController(),
          permanent: true),
      middlewares: [GlobalMiddleWare()]),
];
