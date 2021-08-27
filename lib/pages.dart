import 'package:get/get.dart';
import 'package:trip_pal_null_safe/controllers/blogger_page_controller.dart';
import 'package:trip_pal_null_safe/controllers/hotel_search_controller.dart';
import 'package:trip_pal_null_safe/controllers/main_page_controller.dart';
import 'package:trip_pal_null_safe/controllers/places_search_view_controller.dart';
import 'package:trip_pal_null_safe/controllers/profile_controller.dart';
import 'package:trip_pal_null_safe/controllers/reviews_list_controller.dart';
import 'package:trip_pal_null_safe/controllers/search_bar_controller.dart';
import 'package:trip_pal_null_safe/controllers/trips_list_controller.dart';
import 'package:trip_pal_null_safe/controllers/weather_buddy_controller.dart';
import 'package:trip_pal_null_safe/screens/apps/tags_app.dart';
import 'package:trip_pal_null_safe/screens/boarding/boarding.dart';
import 'package:trip_pal_null_safe/screens/boarding/loading.dart';
import 'package:trip_pal_null_safe/screens/details/place_details.dart';
import 'package:trip_pal_null_safe/screens/details/user_saved_places.dart';
import 'package:trip_pal_null_safe/screens/editing/edit_profile.dart';
import 'package:trip_pal_null_safe/screens/filtering/locations_page.dart';
import 'package:trip_pal_null_safe/screens/home/blog_list.dart';
import 'package:trip_pal_null_safe/screens/home/hotels_list.dart';
import 'package:trip_pal_null_safe/screens/home/main_map_page.dart';
import 'package:trip_pal_null_safe/screens/home/main_page.dart';
import 'package:trip_pal_null_safe/screens/home/profile_page.dart';
import 'package:trip_pal_null_safe/screens/credentials/login.dart';
import 'package:trip_pal_null_safe/screens/credentials/password_reset.dart';
import 'package:trip_pal_null_safe/screens/credentials/register.dart';
import 'package:trip_pal_null_safe/screens/home/users_list.dart';
import 'package:trip_pal_null_safe/screens/planing/places_search_page.dart';
import 'package:trip_pal_null_safe/screens/planing/trip/shared_trips_page.dart';
import 'package:trip_pal_null_safe/screens/review/review_writing.dart';
import 'package:trip_pal_null_safe/screens/weather_buddy/buddy.dart';
import 'package:trip_pal_null_safe/screens/weather_buddy/places_list.dart';
import 'package:trip_pal_null_safe/screens/weather_buddy/search_view.dart';
import 'package:trip_pal_null_safe/screens/review/reviews_list_1.dart';
import 'package:trip_pal_null_safe/utilities/routes_middleware.dart';
import 'package:trip_pal_null_safe/widgets/simple/fetch_widget.dart';

import 'controllers/apps_controllers.dart';
import 'controllers/blog_view_controller.dart';
import 'controllers/trips_controller.dart';
import 'screens/details/blog_details.dart';

List<GetPage> pages = [
  // boarding and loading
  GetPage(
    name: '/loading',
    page: () => FetchScreen<void>(),
    binding: SplashBindings(),
    middlewares: [GlobalMiddleWare()],
  ),

  GetPage(
    name: '/boarding',
    page: () => BoardingScreen(),
    binding: BindingsBuilder.put(() => BoardingController()),
  ),
  // home page navigation
  GetPage(
    name: '/home',
    page: () => MainPage(),
    middlewares: [GlobalMiddleWare()],
    bindings: [
      BindingsBuilder.put(() => MainPageController()),
      BindingsBuilder.put(() => ProfileController()),
      BindingsBuilder.put(() => HotelSearchController()),
      BindingsBuilder.put(() => BloggerPageController()),
    ],
  ),
  GetPage(
    name: '/home/trips/list',
    page: () => SharedTripsPage(),
    middlewares: [GlobalMiddleWare()],
    binding: BindingsBuilder.put(() => TripsListController()),
  ),
  GetPage(
    name: '/home/trips/auto',
    page: () => LocationsPage(),
    middlewares: [GlobalMiddleWare()],
    binding: BindingsBuilder.put(() => TripsController()),
  ),
  // maps app
  GetPage(
    name: '/map',
    page: () => MainMapScreen(),
    middlewares: [GlobalMiddleWare()],
    binding: BindingsBuilder.put(() => SearchBarController()),
  ),
  // blogger app
  GetPage(
    name: '/home/blog_page/list',
    page: () => BlogListView(),
    middlewares: [GlobalMiddleWare()],
    binding: BindingsBuilder.put(() => BlogListViewController()),
  ),
  GetPage(
    name: '/home/blog_page/blog',
    page: () => BlogView(),
    middlewares: [GlobalMiddleWare()],
    binding: BindingsBuilder.put(() => BlogViewController()),
  ),
  GetPage(
      name: '/home/blog_page/tags',
      page: () => TagsListView(),
      middlewares: [GlobalMiddleWare()],
      binding: BindingsBuilder.put(() => TagsListController())),
  GetPage(
    name: '/home/blog_page/users',
    page: () => UsersList(),
    middlewares: [GlobalMiddleWare()],
    binding: BindingsBuilder.put(() => UsersListController()),
  ),

  GetPage(
    name: 'home/places_page',
    page: () => PlacesSearchPage(),
    middlewares: [GlobalMiddleWare()],
    binding: BindingsBuilder.put(() => SearchBarController()),
  ),

  // planning app
  GetPage(
      name: '/home/hotels',
      page: () => HotelsView(),
      middlewares: [GlobalMiddleWare()],
      binding: BindingsBuilder.put(() => HotelsViewController())),

  // TODO add details controller
  GetPage(
    name: '/home/place-details',
    page: () => PlaceDetails(),
    middlewares: [GlobalMiddleWare()],
    binding: BindingsBuilder.put(() => PlaceDetailsController()),
  ),
  // reviews app
  GetPage(
    name: '/home/places/reviews',
    page: () => ReviewList(),
    middlewares: [GlobalMiddleWare()],
    binding: BindingsBuilder.put(() => ReviewsListController()),
  ),
  // TODO add controller
  GetPage(
    name: 'home/places/review-writing',
    middlewares: [GlobalMiddleWare()],
    page: () => ReviewWriting(),
  ),
  GetPage(
    name: '/home/places/saved',
    page: () => SavedPlaces(),
    middlewares: [GlobalMiddleWare()],
    binding: BindingsBuilder.put(() => ProfileController()),
  ),
  // profiles app
  GetPage(
    name: '/profile_page',
    page: () => ProfilePage(),
    middlewares: [GlobalMiddleWare()],
    binding: BindingsBuilder.put(() => ProfileController()),
  ),

  GetPage(
    name: '/profile_page/edit',
    page: () => EditProfileScreen(),
    middlewares: [GlobalMiddleWare()],
  ),

  // auth app
  GetPage(name: '/login', page: () => Login()),
  GetPage(name: '/register', page: () => SignUp()),
  GetPage(name: '/password-reset', page: () => PasswordReset()),

  // weather-buddy app
  GetPage(
    name: '/weather-buddy',
    page: () => WeatherBuddy(),
    middlewares: [GlobalMiddleWare()],
    // TODO store places locally.
    binding:
        BindingsBuilder.put(() => WeatherBuddyController(6), permanent: true),
  ),
  GetPage(
    name: '/weather-buddy/list',
    page: () => WeatherBuddyPlaces(),
    middlewares: [GlobalMiddleWare()],
  ),
  GetPage(
    name: '/weather-buddy/list/search',
    page: () => PlacesSearch(),
    middlewares: [GlobalMiddleWare()],
    binding: BindingsBuilder.put(() => PlacesSearchViewController(),
        permanent: true),
  ),
];
