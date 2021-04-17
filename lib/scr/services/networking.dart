import 'dart:convert';
import 'package:http/http.dart' as http;

Future sendRequest(http.Request request) async {
  http.Response response = await http.Response.fromStream(await request.send());
  if (response.statusCode == 200) return jsonDecode(response.body);
  throw 'Request failed ${response.statusCode}';
}

abstract class RequestBuilder {
  String endpoint;
  String path;
  Map<String, String> queryParameters;
  Map<String, String> headers;
  Map<String, String> body;

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

class OpenWeatherMapRequestBuilder extends RequestBuilder {
  static const String _APIKEY = '';

  OpenWeatherMapRequestBuilder(String path) {
    this.endpoint = 'api.openweathermap.org';
    this.path = path;
    addQueryParameter('appid', _APIKEY);
  }

  @override
  void _clear() {
    queryParameters = {'appid': _APIKEY};
    headers = {};
    body = {};
  }
}

class OpenWeatherMapAPI {
  static final _weatherRequestBuilder =
      OpenWeatherMapRequestBuilder('/data/2.5/weather');

  static dynamic getWeatherByCityName(name) async {
    _weatherRequestBuilder.addQueryParameter('q', name);
    return await sendRequest(_weatherRequestBuilder.buildRequest('get'));
  }

  static dynamic getWeatherByGeographicCoordinates(lon, lat) async {
    _weatherRequestBuilder.addQueryParameter('lat', lat);
    _weatherRequestBuilder.addQueryParameter('lon', lon);
    return await sendRequest(_weatherRequestBuilder.buildRequest('get'));
  }
}
