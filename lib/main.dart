import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trip_pal_null_safe/controllers/maps_controller.dart';
import 'package:trip_pal_null_safe/controllers/profile_controller.dart';
import 'package:trip_pal_null_safe/controllers/search_bar_controller.dart';
import 'package:trip_pal_null_safe/dummy_data.dart';
import 'package:trip_pal_null_safe/screens/home/profile_page.dart';
import 'package:trip_pal_null_safe/screens/home/main_page.dart';
import 'package:trip_pal_null_safe/pages.dart';
import 'package:trip_pal_null_safe/screens/boarding/boarding.dart';
import 'package:trip_pal_null_safe/screens/details/blog_details.dart';
import 'package:trip_pal_null_safe/screens/details/place_details.dart';
import 'package:trip_pal_null_safe/screens/filtering/basic_filters_page.dart';
import 'package:trip_pal_null_safe/screens/editing/edit_profile.dart';
import 'package:trip_pal_null_safe/screens/home/blog_page.dart';
import 'package:trip_pal_null_safe/screens/home/home_drawer.dart';
import 'package:trip_pal_null_safe/screens/home/main_map_page.dart';
import 'package:trip_pal_null_safe/screens/home/hotels_list.dart';
import 'package:trip_pal_null_safe/screens/planing/trip/shared_trips_page.dart';
import 'package:trip_pal_null_safe/screens/planing/trip/trip.dart';
import 'package:trip_pal_null_safe/services/auth_service.dart';
import 'package:trip_pal_null_safe/services/backend_service.dart';
import 'package:trip_pal_null_safe/services/geocoding_service.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';
import 'package:trip_pal_null_safe/utilities/themes.dart';
import 'package:trip_pal_null_safe/controllers/weather_buddy_controller.dart';
import 'package:trip_pal_null_safe/screens/weather_buddy/buddy.dart';
import 'package:trip_pal_null_safe/services/weather_service.dart';
import 'package:trip_pal_null_safe/screens/review/reviews_list.dart';
import 'package:trip_pal_null_safe/screens/home/hotel_search_page.dart';
import 'package:trip_pal_null_safe/screens/details/user_saved_places.dart';
import 'package:trip_pal_null_safe/screens/planing/trip/trip_types_screen.dart';

import 'controllers/app_theme_controller.dart';
import 'controllers/trip_planning_controller.dart';
import 'controllers/trips_controller.dart';
import 'controllers/hotel_search_controller.dart';
import 'controllers/main_page_controller.dart';
import 'controllers/trips_list_controller.dart';
import 'dialogs/change_theme_dialog.dart';
import 'models/day_item.dart';
import 'screens/maps/map_page.dart';
import 'screens/planing/places_search_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initMemory();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(buildApp());
  });
}

Future<void> initMemory() async {
  // await PushNotificationService.init();
  await GetStorage.init();

  final box = GetStorage();
  box.writeIfNull('themeMode', 1);
  box.writeIfNull('language', 'en');
  box.writeIfNull('country', 'US');
  box.writeIfNull('boarding', true);
  BoardingController.boarding = box.read('boarding');
}

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OpenWeatherMap());
    Get.lazyPut(() => GeoCodingService());
    Get.lazyPut(() => BackendService());
    Get.lazyPut(() => AuthControl());
  }
}

GetMaterialApp buildApp() {
  final box = GetStorage();
  final controller = Get.put(AppThemeController(box.read('themeMode')));
  final themeMode = controller.themeMode;
  final language = box.read('language')!;
  final country = box.read('country')!;
  return GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: Themes.fromThemeMode(themeMode),
    initialRoute: '/loading',
    initialBinding: InitialBindings(),
    locale: Locale(language, country),
    // translations: AppTranslations(),
    getPages: pages,
  );
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    List<Item> points = [
      Item(
          type: 'hotel',
          id: '0',
          coordinate: LatLng(51.54, -0.125847),
          name: "St. Pancras Renaissance Hotel London",
          rate: 8),
      Item(
          type: 'food',
          id: '1',
          coordinate: LatLng(51.530228, -0.12801),
          name: "British Library restaurant",
          rate: 7),
      Item(
          type: 'architecture',
          id: '2',
          coordinate: LatLng(51.532394, -0.125386),
          name: "German Gymnasium",
          rate: 7),
      Item(
          type: 'cultural',
          id: '3',
          coordinate: LatLng(51.526623, -0.131859),
          name: "Friends House Garden",
          rate: 7),
      Item(
          type: 'food',
          id: '4',
          coordinate: LatLng(51.528236, -0.128996),
          name: "The Rocket",
          rate: 7),
      Item(
          type: 'historic',
          id: '5',
          coordinate: LatLng(51.527199, -0.1326),
          name: "London and North Western Railway War Memorial",
          rate: 7),
      Item(
          type: 'food',
          id: '6',
          coordinate: LatLng(51.526886, -0.137008),
          name: "Crown & Anchor",
          rate: 7),
    ];
    MySize.init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
              icon: Icon(Icons.workspaces_filled),
              onPressed: () async {
                Get.dialog(SelectThemeDialog());
              })
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '0',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // await GetStorage().erase();
          // var x = GetStorage().read<bool>('boarding');
          // print(x);
          // Get.toNamed('/login');
          // Get.toNamed('/reviews');
          // Get.toNamed('/weather-buddy');
          // Get.lazyPut(() => ProfileController());
          // Get.lazyPut(() => TripsListController());
          // Get.lazyPut(() => MainPageController());
          // Get.lazyPut(() => SearchBarController());
          // Get.put(MapController());
          // Get.to(() => ProfilePage());
          // Get.to(() => Scaffold(body: HomePage()));
          // Get.to(HomeDrawer());
          // Get.to(() => PlaceDetails());
          // Get.lazyPut(() => HotelSearchController());
          // Get.put(TripsController());
          // Get.to(() => PlaceDetails());
          // Get.put(FilterController());
          // Get.to(FiltersPage());
          // Get.to(() => Scaffold(
          //     appBar: AppBar(),
          //     drawer: HomeDrawer(),
          //     resizeToAvoidBottomInset: false,
          //     body: HotelSearchPage()));
          // Get.to(() => PlacesSearchPage());
          // Get.toNamed('/reviews');
          // Get.to(() => SavedPlaces());
          // Get.to(() => Scaffold(body: TripsPage()));
          // Get.put(HotelsViewController());
          // Get.to(() => HotelsView());
          // Get.put(BlogViewController());
          // Get.to(() => BlogView());
          // Get.to(() => EditProfileScreen());
          // Get.to(() => MainPage());
          // Get.to(() => SharedTripsPage());

          // Get.to(MapPage(points: points));
          Get.put(TripPlanningController(londonTrip['days']!.length));
          Get.to(() => TripPlan());
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
