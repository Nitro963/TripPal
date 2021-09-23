import 'package:get/get.dart';
import 'package:trip_pal_null_safe/models/location.dart';
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

  Future<Location> getLocationId({
    required String cityName,
  }) async {
    var ret = await client.get<Map<String,dynamic>>('/0.1/en/places/geoname',
        queryParameters: {'name': cityName});
    return Location.fromJson(ret.decodedBody);
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
