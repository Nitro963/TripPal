import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:trip_pal_null_safe/controllers/search_bar_controller.dart';
import 'package:trip_pal_null_safe/pages.dart';
import 'package:trip_pal_null_safe/screens/details/place_details.dart';
import 'package:trip_pal_null_safe/screens/home/home_drawer.dart';
import 'package:trip_pal_null_safe/screens/home/home_page.dart';
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
import 'controllers/filters_controller.dart';
import 'controllers/hotel_search_controller.dart';
import 'dialogs/change_theme_dialog.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final boarding = await initServices();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(buildApp(boarding: boarding));
  });
}

Future<bool> initServices() async {
  // await PushNotificationService.init();
  await GetStorage.init();

  Get.lazyPut(() => OpenWeatherMap());
  Get.lazyPut(() => GeoCodingService());

  final box = GetStorage();

  box.writeIfNull('themeMode', 1);
  box.writeIfNull('language', 'en');
  box.writeIfNull('country', 'US');

  var boarding = box.read('boarding');

  if (boarding == null) {
    boarding = true;
    await box.write('boarding', false);
  }

  Get.lazyPut(() => BackendService());
  return boarding;
}

GetMaterialApp buildApp({required bool boarding}) {
  final box = GetStorage();
  final controller = Get.put(AppThemeController(box.read('themeMode')));
  final themeMode = controller.themeMode;
  final language = box.read('language')!;
  final country = box.read('country')!;

  return GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: Themes.fromThemeMode(themeMode),
    initialRoute: boarding ? '/boarding' : '/home',
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
          Get.toNamed('/reviews');
          // Get.toNamed('/weather-buddy');
          // Get.lazyPut(() => SearchBarController());
          // Get.to(() => Scaffold(body: HomePage()));
          // Get.to(() => PlaceDetails());
          // Get.put(HotelSearchController());
          // Get.put(FilterController());
          // Get.to(() => Scaffold(
          //     appBar: AppBar(),
          //     drawer: HomeDrawer(),
          //     resizeToAvoidBottomInset: false,
          //     body: HotelSearchPage()));
          // Get.to(() => PlacesSearchEngine());
          // Get.toNamed('/reviews');
          // Get.to(() => SavedPlaces());
          // Get.to(() => Scaffold(body: TripsPage()));
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
