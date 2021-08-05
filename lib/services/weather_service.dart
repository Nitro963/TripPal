import 'dart:async';

import 'package:get/get.dart';
import 'package:trip_pal_null_safe/models/weather_info.dart';
import 'package:trip_pal_null_safe/models/place.dart';
import 'package:trip_pal_null_safe/utilities/networking_utils.dart';

class WeatherInfoService {
  final _client = DioConnect(baseUrl: 'api.openweathermap.org');
  final weatherPath = '/data/2.5/weather';
  final String apiKey;

  WeatherInfoService({this.apiKey = 'd136f87331b0bd808daa2fe6de21e662'}) {
    _client.defaultDecoder = WeatherInfo.fromOpenWeatherMapJson;
    _client.requestModifiers.add((request) {
      request.queryParameters
          .update('appid', (value) => apiKey, ifAbsent: () => apiKey);
      request.queryParameters
          .update('units', (value) => 'metric', ifAbsent: () => 'metric');
      return request;
    });
  }

  Future<WeatherInfo> getWeatherByCityName(String name) async {
    final response = await _client
        .get<WeatherInfo>(weatherPath, queryParameters: {'q': name});
    return response.decodedBody;
  }

  Future<WeatherInfo> getWeatherByGeographicCoordinates(
      double lon, double lat) async {
    final response = await _client.get<WeatherInfo>(weatherPath,
        queryParameters: {'lat': lat.toString(), 'lon': lon.toString()});
    return response.decodedBody;
  }

  Future<WeatherInfo> getWeatherByPlace(Place place) async {
    if (place.lon != null && place.lat != null) {
      return await getWeatherByGeographicCoordinates(place.lon!, place.lat!);
    }
    return await getWeatherByCityName(place.name);
  }
}

class OpenWeatherMap extends GetxService {
  late final WeatherInfoService weather;

  void onInit() {
    super.onInit();
    weather = WeatherInfoService();
  }
}
