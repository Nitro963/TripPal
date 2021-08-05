import 'package:get/get.dart';
import 'package:trip_pal_null_safe/models/place.dart';
import 'package:trip_pal_null_safe/utilities/networking_utils.dart';

class PhotonApi {
  final _client = DioConnect(baseUrl: 'photon.komoot.io');
  final _path = '/api';

  PhotonApi() {
    _client.requestModifiers.add((options) {
      // TODO internationalization
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

class GeoCodingService extends GetxService {
  late final PhotonApi photon;

  @override
  void onInit() {
    photon = PhotonApi();
    super.onInit();
  }
}
