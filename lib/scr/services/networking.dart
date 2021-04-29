import 'dart:convert';
import 'package:http/http.dart' as http;

Future sendRequest(http.Request request) async {
  http.Response response = await http.Response.fromStream(await request.send());
  if (response.statusCode == 200) return jsonDecode(response.body);
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
  static const _API_KEY = '';

  static dynamic getWeatherByCityName(name) async {
    _weatherRequestBuilder.addQueryParameter('appid', _API_KEY);
    _weatherRequestBuilder.addQueryParameter('q', name);
    return await sendRequest(_weatherRequestBuilder.buildRequest('get'));
  }

  static dynamic getWeatherByGeographicCoordinates(lon, lat) async {
    _weatherRequestBuilder.addQueryParameter('appid', _API_KEY);
    _weatherRequestBuilder.addQueryParameter('lat', lat);
    _weatherRequestBuilder.addQueryParameter('lon', lon);
    return await sendRequest(_weatherRequestBuilder.buildRequest('get'));
  }
}

class PhotonAPI {
  static final _photonRequestBuilder =
      RequestBuilder('photon.komoot.io', '/api/');
  static dynamic getQuery(String query) async {
    _photonRequestBuilder.addQueryParameter('q', query);
    _photonRequestBuilder.addQueryParameter('lang', 'en');
    _photonRequestBuilder.addQueryParameter('limit', '6');
    return await sendRequest(_photonRequestBuilder.buildRequest('get'));
  }
}
