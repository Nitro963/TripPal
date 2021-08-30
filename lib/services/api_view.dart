import 'dart:math';

import 'package:trip_pal_null_safe/models/abstract_model.dart';
import 'package:trip_pal_null_safe/utilities/constants.dart';
import 'package:trip_pal_null_safe/utilities/networking_utils.dart';

class PaginationInfo<T> {
  final int? count;
  final String? next;
  final String? prv;
  final List<T> results;

  PaginationInfo(
      {this.count = 0, this.next, this.prv, this.results = const []});

  static PaginationInfo<T> fromJson<T>(dynamic json, Decoder itemBuilder) {
    return PaginationInfo(
        count: json['count'],
        next: json['next'],
        prv: json['previous'],
        results: List<T>.from(json['results'].map(itemBuilder)));
  }
}

abstract class ApiView<T extends IModel> {
  Future<PaginationInfo<T>> getAllElements(
      {Map<String, String?> queryParameters = const {}});

  Future<T> getItem(int id);

  Future<T> patchItem(int id, Map<String, dynamic> json);

  Future<T> putItem(int id, T item);

  Future<E> postItem<E>(Map<String, dynamic> json, Decoder<E> decoder,
      {String pathSuffix = ''});
}

class DummyApiView<T extends IModel> implements ApiView<T> {
  final List<Map<String, dynamic>> data;
  final Decoder<T> decoder;

  DummyApiView({required this.data, required this.decoder});

  @override
  Future<PaginationInfo<T>> getAllElements(
      {Map<String, String?> queryParameters = const {}}) async {
    return await Future.delayed(Duration(seconds: 2), () {
      String? take = queryParameters['take'];
      var parsedTake = take == null ? 10 : int.parse(take);
      String? skip = queryParameters['skip'];
      var parsedSkip = skip == null ? 0 : int.parse(skip);

      if (parsedSkip > data.length) return PaginationInfo<T>();

      if (parsedSkip + parsedTake > data.length)
        parsedTake = max(data.length - parsedSkip, 0);
      return PaginationInfo<T>(
          count: 1000,
          next: null,
          prv: null,
          results: Iterable.generate(
                  parsedTake, (index) => decoder(data[index + parsedSkip]))
              .toList());
    });
  }

  @override
  Future<T> getItem(int id) async {
    return await Future.delayed(Duration(seconds: 2), () {
      return decoder(data.firstWhere((element) => decoder(element).id == id));
    });
  }

  @override
  Future<T> patchItem(int id, Map<String, dynamic> json) async {
    return await Future.delayed(Duration(seconds: 2), () {
      var element = data.firstWhere((element) => decoder(element).id == id);
      json.entries.forEach((e) {
        element[e.key] = e.value;
      });
      return decoder(element);
    });
  }

  @override
  Future<E> postItem<E>(Map<String, dynamic> json, Decoder<E> decoder,
      {String pathSuffix = ''}) {
    // TODO: implement postItem
    throw UnimplementedError();
  }

  @override
  Future<T> putItem(int id, T item) {
    // TODO: implement putItem
    throw UnimplementedError();
  }
}

class NetworkApiView<T extends IModel> implements ApiView<T> {
  final String _path;
  final DioConnect _client;
  NetworkApiView(String baseUrl, String path, Decoder<T> itemBuilder,
      {HttpScheme httpScheme = DEFAULT_CONNECTION_PROTOCOL,
      int connectTimeout = 8000})
      : _path = path,
        _client = DioConnect(
            baseUrl: baseUrl,
            httpScheme: httpScheme,
            connectTimeout: connectTimeout) {
    _client.defaultDecoder = itemBuilder;
  }

  Future<PaginationInfo<T>> getAllElements(
      {Map<String, String?> queryParameters = const {}}) async {
    final response = await _client.get<PaginationInfo<T>>(_path,
        queryParameters: queryParameters, decoder: (data) {
      return PaginationInfo.fromJson<T>(data, _client.defaultDecoder);
    });
    return response.decodedBody;
  }

  Future<T> getItem(int id) async {
    final response = await _client.get<T>(_path + '$id/');
    return response.decodedBody;
  }

  Future<T> patchItem(int id, Map<String, dynamic> json) async {
    final response = await _client.patch<T>(_path + '$id/', json);
    return response.decodedBody;
  }

  @override
  Future<T> putItem(int id, T item) async {
    final response = await _client.put<T>(_path + '/$id', item);
    return response.decodedBody;
  }

  void addRequestModifier(RequestModifier modifier) {
    _client.requestModifiers.add(modifier);
  }

  @override
  Future<E> postItem<E>(Map<String, dynamic> json, Decoder<E> decoder,
      {String pathSuffix = ''}) async {
    final response =
        await _client.post(_path + pathSuffix, json, decoder: decoder);
    return response.decodedBody;
  }
}
