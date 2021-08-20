import 'dart:async';
import 'dart:convert';
import 'dart:developer' as developer;

import 'package:dio/dio.dart' as dio;

import 'constants.dart';

typedef Decoder<T> = T Function(dynamic data);
typedef Encoder = dynamic Function(dynamic data);
typedef RequestModifier = dio.RequestOptions Function(dio.RequestOptions);
typedef ResponseModifier = dio.Response Function(dio.Response);

dio.RequestOptions addJsonHeaders(dio.RequestOptions request) {
  JSON_HEADERS.entries.forEach((element) {
    request.headers
        .update(element.key, (value) => value, ifAbsent: () => element.value);
  });
  return request;
}

class Response<T> {
  final T decodedBody;
  final dio.Response response;
  Response(this.response, this.decodedBody);
}

enum HttpScheme { http, https }

class DioConnect {
  final String baseUrl;
  final HttpScheme _httpScheme;
  final dio.Dio client;
  final List<RequestModifier> requestModifiers = [];
  final List<ResponseModifier> responseModifiers = [];

  final int connectTimeout;
  final _watch = Stopwatch();

  Decoder defaultDecoder;
  Encoder defaultEncoder;

  DioConnect(
      {required this.baseUrl,
      this.connectTimeout = 8000,
      httpScheme = HttpScheme.https})
      : defaultDecoder = ((data) => data),
        defaultEncoder = json.encode,
        client = dio.Dio(
          dio.BaseOptions(baseUrl: baseUrl, connectTimeout: connectTimeout),
        ),
        _httpScheme = httpScheme;

  String get httpScheme => '${_httpScheme.toString().split('.')[1]}';

  Future<Response<T>> _performRequest<T>(
      dio.RequestOptions options, Decoder<T>? decoder) async {
    developer.log('${options.method.toUpperCase()} ${options.uri}',
        name: 'NETWORK');
    _watch.reset();

    try {
      _watch.start();

      var dioResponse = await client.request(
        '${options.baseUrl}' + options.path,
        data: options.data,
        options: dio.Options(method: options.method, headers: options.headers),
        queryParameters: options.queryParameters,
        cancelToken: options.cancelToken,
        onSendProgress: options.onSendProgress,
        onReceiveProgress: options.onReceiveProgress,
      );

      _watch.stop();

      developer.log(
          'OK successful HTTP request in ${_watch.elapsedMilliseconds}ms',
          name: 'NETWORK');

      var decodedData = decoder != null
          ? decoder(dioResponse.data)
          : defaultDecoder(dioResponse.data);

      return Response(dioResponse, decodedData);
    } finally {
      _watch.stop();
    }
  }

  Future<Response<T>> get<T>(String path,
      {Map<String, String?> queryParameters = const {},
      Map<String, String> headers = const {},
      Decoder<T>? decoder}) async {
    var request = dio.RequestOptions(
        method: 'get',
        baseUrl: '$httpScheme://$baseUrl',
        path: path,
        headers: headers,
        queryParameters: queryParameters);

    requestModifiers.forEach((modifier) {
      request = modifier(request);
    });

    return await _performRequest(request, decoder);
  }

  Future<Response<T>> post<T>(String path, dynamic data,
      {Map<String, String?> queryParameters = const {},
      Map<String, String> headers = const {},
      Decoder<T>? decoder,
      Encoder? encoder}) async {
    var request = dio.RequestOptions(
        method: 'post',
        baseUrl: '$httpScheme://$baseUrl',
        path: path,
        headers: headers,
        queryParameters: queryParameters,
        data: encoder != null ? encoder(data) : defaultEncoder(data));

    requestModifiers.forEach((modifier) {
      request = modifier(request);
    });

    return await _performRequest(request, decoder);
  }

  Future<Response<T>> delete<T>(String path, dynamic data,
      {Map<String, String?> queryParameters = const {},
      Map<String, String> headers = const {},
      Decoder<T>? decoder,
      Encoder? encoder}) async {
    var request = dio.RequestOptions(
        method: 'delete',
        baseUrl: '$httpScheme://$baseUrl',
        path: path,
        headers: headers,
        queryParameters: queryParameters,
        connectTimeout: connectTimeout,
        data: encoder != null ? encoder(data) : defaultEncoder(data));

    requestModifiers.forEach((modifier) {
      request = modifier(request);
    });

    return await _performRequest(request, decoder);
  }

  Future<Response<T>> put<T>(String path, dynamic data,
      {Map<String, String?> queryParameters = const {},
      Map<String, String> headers = const {},
      Decoder<T>? decoder,
      Encoder? encoder}) async {
    var request = dio.RequestOptions(
        method: 'put',
        baseUrl: '$httpScheme://$baseUrl',
        path: path,
        queryParameters: queryParameters,
        headers: headers,
        data: encoder != null ? encoder(data) : defaultEncoder(data));

    requestModifiers.forEach((modifier) {
      request = modifier(request);
    });

    return await _performRequest(request, decoder);
  }

  Future<Response<T>> patch<T>(String path, dynamic data,
      {Map<String, String?> queryParameters = const {},
      Map<String, String> headers = const {},
      Decoder<T>? decoder,
      Encoder? encoder}) async {
    var request = dio.RequestOptions(
        method: 'patch',
        baseUrl: '$httpScheme://$baseUrl',
        queryParameters: queryParameters,
        path: path,
        headers: headers,
        data: json.encode(data));

    requestModifiers.forEach((modifier) {
      request = modifier(request);
    });
    return await _performRequest(request, decoder);
  }
}
