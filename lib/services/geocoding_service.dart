import 'package:get/get.dart';
import 'package:trip_pal_null_safe/models/place.dart';
import 'package:trip_pal_null_safe/services/network_service.dart';

class PhotonApi extends NetworkService {
  PhotonApi() : super(baseUrl: 'photon.komoot.io') {
    requestModifiers.add((options) {
      // TODO internationalization
      options.queryParameters
          .update('lang', (value) => 'en', ifAbsent: () => 'en');
      return options;
    });
  }

  final _path = '/api';

  Future<List<Place>> getQuery(String query, int limit) async {
    var res = await this.get<List<Place>>(_path,
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
