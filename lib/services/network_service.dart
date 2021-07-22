import 'dart:async';
import 'dart:convert';
import 'dart:developer' as developer;

import 'package:dio/dio.dart' as dio;
import 'package:trip_pal_null_safe/utilities/networking_utils.dart';

abstract class NetworkService {
  Decoder defaultDecoder;
  Encoder defaultEncoder;

  final String baseUrl;
  final String httpScheme;
  final dio.Dio client;
  final List<RequestModifier> requestModifiers = [];
  final int connectTimeout;

  static const _HTTP_SCHEMES = ['http', 'https'];

  NetworkService(
      {required this.baseUrl,
      this.connectTimeout = 8000,
      this.httpScheme = 'https'})
      : assert(_HTTP_SCHEMES.contains(httpScheme)),
        defaultDecoder = ((data) => data),
        defaultEncoder = json.encode,
        client = dio.Dio();

  Future<Response<T>> _performRequest<T>(
      dio.RequestOptions request, Decoder<T>? decoder) async {
    developer.log('${request.method} ${request.uri}', name: 'NETWORK');

    Stopwatch stopwatch = new Stopwatch()..start();

    var dioResponse = await client.fetch(request);

    developer.log(
        'OK successful HTTP request in ${stopwatch.elapsedMilliseconds}ms',
        name: 'NETWORK');

    var decodedData = decoder != null
        ? decoder(dioResponse.data)
        : defaultDecoder(dioResponse.data);

    return Response(dioResponse, decodedData);
  }

  Future<Response<T>> get<T>(String path,
      {Map<String, String> queryParameters = const {},
      Map<String, String> headers = const {},
      Decoder<T>? decoder}) async {
    var request = dio.RequestOptions(
        method: 'GET',
        baseUrl: '$httpScheme://$baseUrl',
        path: path,
        headers: headers,
        connectTimeout: connectTimeout,
        queryParameters: queryParameters);
    requestModifiers.forEach((modifier) {
      request = modifier(request);
    });

    return await _performRequest(request, decoder);
  }

  Future<Response<T>> post<T>(String path, dynamic data,
      {Map<String, String> headers = const {},
      Decoder<T>? decoder,
      Encoder? encoder}) async {
    var request = dio.RequestOptions(
        method: 'POST',
        baseUrl: '$httpScheme://$baseUrl',
        path: path,
        headers: headers,
        connectTimeout: connectTimeout,
        data: encoder != null ? encoder(data) : defaultEncoder(data));

    requestModifiers.forEach((modifier) {
      request = modifier(request);
    });

    return await _performRequest(request, decoder);
  }

  Future<Response<T>> put<T>(String path, dynamic data,
      {Map<String, String> headers = const {},
      Decoder<T>? decoder,
      Encoder? encoder}) async {
    var request = dio.RequestOptions(
        method: 'PUT',
        baseUrl: '$httpScheme://$baseUrl',
        path: path,
        headers: headers,
        connectTimeout: connectTimeout,
        data: encoder != null ? encoder(data) : defaultEncoder(data));

    requestModifiers.forEach((modifier) {
      request = modifier(request);
    });

    return await _performRequest(request, decoder);
  }
}
