import 'package:get/get.dart';
import 'package:trip_pal_null_safe/models/map_place.dart';
import 'package:trip_pal_null_safe/models/place.dart';
import 'package:trip_pal_null_safe/utilities/networking_utils.dart';

class PhotonApi {
  final _client = DioConnect(baseUrl: 'photon.komoot.io');
  final _path = '/api';

  PhotonApi() {
    _client.requestModifiers.add((options) {
      options.queryParameters
          .update('lang', (value) => 'en', ifAbsent: () => 'en');
      return options;
    });
  }

  Future<List<Place>> getQuery(String query, int limit) async {
    var res = await _client.get<List<Place>>(_path,
        queryParameters: {'q': query, 'limit': limit.toString()},
        decoder: (dynamic data) {
      var features = data['features'] as List;
      return features
          .map((e) => Place.fromJson(e))
          .toSet()
          .toList(growable: false);
    });
    return res.decodedBody;
  }
}

class OpenTripMapApi {
  final String apiKey;
  final DioConnect client;

  OpenTripMapApi(
      {this.apiKey =
          '5ae2e3f221c38a28845f05b61f6983d09ef19a35837145ac8fbff9e7'})
      : client = DioConnect(baseUrl: 'api.opentripmap.com') {
    client.requestModifiers.add((request) {
      request.queryParameters
          .update('apikey', (value) => apiKey, ifAbsent: () => apiKey);
      return request;
    });
  }

  Future<MapPlace> getLocationId({
    required String cityName,
  }) async {
    var ret = await client.get<MapPlace>('/0.1/en/places/geoname',
        queryParameters: {'name': cityName}, decoder: MapPlace.fromJson);
    return ret.decodedBody;
  }

  Future<List<MapPlace>> getPlacesList({
    required double lat,
    required double lon,
    required int radius,
    required String kinds,
    int? rate,
    Function(dynamic error)? onError,
  }) async {
    var ret = await client.get<List<MapPlace>>('/0.1/en/places/radius',
        queryParameters: {
          'radius': radius.toString(),
          'lon': lon.toString(),
          'lat': lat.toString(),
          'kinds': kinds,
          if (rate != null) 'rate': rate.toString()
        },
        decoder: (data) => (data['features'] as List)
            .map((mapPlace) => MapPlace.fromJson(mapPlace))
            .toList());
    return ret.decodedBody;
  }

// void getHotelsList({
//   Function(List<Hotel> hotels)? onSuccess,
//   Function(dynamic error)? onError,
// }) {
//   ApiRequest(
//           url: "https://hotels4.p.rapidapi.com/properties/list",
//           data: {
//             "destinationId": _searchController.hotelCityId,
//             "pageNumber": "1",
//             "pageSize": "25",
//             "checkIn": _searchController.checkInDate,
//             "checkOut": _searchController.checkOutDate,
//             "adults1": _searchController.adultsCount,
//             "sortOrder": _searchController.sortOrder,
//             "locale": "en_US",
//             "currency": "USD"
//           },
//           header: headers1)
//       .get(
//     onSuccess: (data) {
//       onSuccess!((data['data']['body']['searchResults']['results'] as List)
//           .map((hotelJson) => Hotel.fromJson(hotelJson))
//           .toList());
//     },
//     onError: (error) => {if (onError != null) onError(error)},
//   );
// }

// void getHotelDetails({
//   Function(dynamic data)? onSuccess,
//   Function(dynamic error)? onError,
// }) {
//   ApiRequest(
//       header: headers1,
//       url: "https://hotels4.p.rapidapi.com/properties/get-details",
//       data: {
//         "id": _searchController.selectedHotelId,
//         "checkIn": "2020-01-08",
//         "checkOut": "2020-01-15",
//         "adults1": "1",
//         "currency": "USD",
//         "locale": "en_US"
//       }).get(
//     onSuccess: (data) {
//       onSuccess!(data['data']['body']);
//     },
//     onError: (error) => {if (onError != null) onError(error)},
//   );
// }

// void getHotelPhotos({
//   Function(dynamic data)? onSuccess,
//   Function(dynamic error)? onError,
// }) {
//   ApiRequest(
//       header: headers1,
//       url: "https://hotels4.p.rapidapi.com/properties/get-hotel-photos",
//       data: {"id": _searchController.selectedHotelId}).get(
//     onSuccess: (data) {
//       onSuccess!(data);
//     },
//     onError: (error) => {if (onError != null) onError(error)},
//   );
// }
}

class GeoCodingService extends GetxService {
  late final PhotonApi photon;
  late final OpenTripMapApi openTripMap;

  @override
  void onInit() {
    photon = PhotonApi();
    openTripMap = OpenTripMapApi();
    super.onInit();
  }
}
