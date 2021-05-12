import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:travel_app/scr/models/place.dart';
import 'package:travel_app/scr/models/weather_info.dart';
import 'package:travel_app/scr/screens/weather_buddy.dart';

Future<dynamic> sendRequest(http.Request request) async {
  http.Response response;
  try {
    response = await http.Response.fromStream(await request.send());
  } catch (e) {
    throw e;
  }
  if (response?.statusCode == 200) return jsonDecode(response.body);
  throw 'Request failed ${response.statusCode}';
}

class RequestBuilder {
  String endpoint;
  String path;
  Map<String, String> queryParameters = {};
  Map<String, String> headers = {};
  Map<String, String> body = {};

  RequestBuilder(this.endpoint, this.path);

  void addQueryParameter(String name, String value) {
    queryParameters[name] = value;
  }

  void addHeader(String name, String value) {
    headers[name] = value;
  }

  void addBodyField(String name, String value) {
    body[name] = value;
  }

  void _clear() {
    queryParameters = {};
    headers = {};
    body = {};
  }

  http.Request buildRequest(String method) {
    var request =
        http.Request(method, Uri.http(endpoint, path, queryParameters));
    request.bodyFields = body;
    request.headers.addAll(headers);
    _clear();
    return request;
  }
}

class OpenWeatherMapAPI {
  static final _weatherRequestBuilder =
      RequestBuilder('api.openweathermap.org', '/data/2.5/weather');
  static const _API_KEY = 'd136f87331b0bd808daa2fe6de21e662';

  static Future<WeatherInfo> getWeatherByCityName(name) async {
    _weatherRequestBuilder.addQueryParameter('appid', _API_KEY);
    _weatherRequestBuilder.addQueryParameter('q', name);
    _weatherRequestBuilder.addQueryParameter('units', 'metric');
    return WeatherInfo.fromOpenWeatherMapJson(
        await sendRequest(_weatherRequestBuilder.buildRequest('get')));
  }

  static Future<WeatherInfo> getWeatherByGeographicCoordinates(lon, lat) async {
    _weatherRequestBuilder.addQueryParameter('appid', _API_KEY);
    _weatherRequestBuilder.addQueryParameter('lat', lat);
    _weatherRequestBuilder.addQueryParameter('lon', lon);
    _weatherRequestBuilder.addQueryParameter('units', 'metric');
    return WeatherInfo.fromOpenWeatherMapJson(
        await sendRequest(_weatherRequestBuilder.buildRequest('get')));
  }
}

class PhotonAPI {
  static final _photonRequestBuilder =
      RequestBuilder('photon.komoot.io', '/api/');
  static Future<List<Place>> getQuery(String query) async {
    _photonRequestBuilder.addQueryParameter('q', query);
    _photonRequestBuilder.addQueryParameter('lang', 'en');
    _photonRequestBuilder.addQueryParameter('limit', '6');
    var res = await sendRequest(_photonRequestBuilder.buildRequest('get'));
    var features = res['features'] as List;
    return features.map((e) => Place.fromJson(e)).toSet().toList();
  }
}
