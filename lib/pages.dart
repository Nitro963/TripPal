import 'package:get/get.dart';
import 'package:trip_pal_null_safe/controllers/places_search_view_controller.dart';
import 'package:trip_pal_null_safe/controllers/reviews_list_controller.dart';
import 'package:trip_pal_null_safe/controllers/weather_buddy_controller.dart';
import 'package:trip_pal_null_safe/main.dart';
import 'package:trip_pal_null_safe/screens/boarding/boarding.dart';
import 'package:trip_pal_null_safe/screens/credentials/login.dart';
import 'package:trip_pal_null_safe/screens/credentials/password_reset.dart';
import 'package:trip_pal_null_safe/screens/credentials/register.dart';
import 'package:trip_pal_null_safe/screens/review/review_writing.dart';
import 'package:trip_pal_null_safe/screens/weather_buddy/buddy.dart';
import 'package:trip_pal_null_safe/screens/weather_buddy/places_list.dart';
import 'package:trip_pal_null_safe/screens/weather_buddy/search_view.dart';
import 'package:trip_pal_null_safe/screens/review/reviews_list_1.dart';

List<GetPage> pages = [
  GetPage(name: '/boarding', page: () => BoardingScreen()),
  GetPage(name: '/home', page: () => MyHomePage(title: 'TripPal')),
  GetPage(name: '/login', page: () => Login()),
  GetPage(name: '/register', page: () => SignUp()),
  GetPage(name: '/password-reset', page: () => PasswordReset()),
  GetPage(
      name: '/reviews',
      page: () => ReviewList(),
      binding: BindingsBuilder.put(() => ReviewsListController())),
  GetPage(name: '/review-writing', page: () => ReviewWriting()),
  GetPage(
      name: '/weather-buddy',
      page: () => WeatherBuddy(),
      // TODO store places locally.
      binding: BindingsBuilder.put(() => WeatherBuddyController(6))),
  GetPage(name: '/weather-buddy/list', page: () => WeatherBuddyPlaces()),
  GetPage(
      name: '/weather-buddy/list/search',
      page: () => PlacesSearch(),
      binding: BindingsBuilder.put(() => PlacesSearchViewController(),
          permanent: true)),
          
];
