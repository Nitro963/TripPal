// import 'package:location/location.dart';
// import 'package:geocoder/geocoder.dart';
//
//
//
// class LocationCustom {
//   LocationData locationData;
//   Address adress;
// //Currensey next
//   Future<void> init() async {
//     bool _serviceEnabled;
//     PermissionStatus _permissionGranted;
//     Location location = new Location();
//
//     _serviceEnabled = await location.serviceEnabled();
//     print(_serviceEnabled);
//
//     if (!_serviceEnabled) {
//       _serviceEnabled = await location.requestService();
//       if (!_serviceEnabled) {
//         print("no");
//         return;
//       }
//     }
//
//     _permissionGranted = await location.hasPermission();
//     if (_permissionGranted == PermissionStatus.denied) {
//       _permissionGranted = await location.requestPermission();
//       if (_permissionGranted != PermissionStatus.granted) {
//         return;
//       }
//     }
//     locationData = await location.getLocation();
//     final Coordinates coordinates = new Coordinates(locationData.latitude, locationData.longitude);
//     var list = await Geocoder.local.findAddressesFromCoordinates(coordinates);
//     // var list = await Geocoder.google('AIzaSyBX6KRWhp5dIIsDpQo5SLezaWUC4-CdLME').findAddressesFromCoordinates(coordinates);
//
//     adress=list.first;
//   }
// }
