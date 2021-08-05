import 'dart:math';

import 'package:trip_pal_null_safe/models/abstract_model.dart';
import 'package:trip_pal_null_safe/utilities/networking_utils.dart';

abstract class ApiView<T extends IModel> {
  Future<List<T>> getAllElements(
      {Map<String, String?> queryParameters = const {}});

  Future<T> getItem(int id);

  Future<T> patchItem(int id, Map<String, dynamic> json);
}

class DummyApiView<T extends IModel> implements ApiView<T> {
  final List<Map<String, dynamic>> data;
  final Decoder<T> decoder;

  DummyApiView({required this.data, required this.decoder});

  @override
  Future<List<T>> getAllElements(
      {Map<String, String?> queryParameters = const {}}) async {
    return await Future.delayed(Duration(seconds: 2), () {
      String? take = queryParameters['take'];
      var parsedTake = take == null ? 10 : int.parse(take);
      String? skip = queryParameters['skip'];
      var parsedSkip = skip == null ? 0 : int.parse(skip);

      if (parsedSkip > data.length) return [];

      if (parsedSkip + parsedTake > data.length)
        parsedTake = max(data.length - parsedSkip, 0);

      return Iterable.generate(
          parsedTake, (index) => decoder(data[index + parsedSkip])).toList();
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
}

class NetworkApiView<T extends IModel> implements ApiView<T> {
  final String _path;
  final DioConnect _client;

  NetworkApiView(String baseUrl, String path, Decoder<T> itemBuilder,
      {HttpScheme httpScheme = HttpScheme.https, int connectTimeout = 8000})
      : _path = path,
        _client = DioConnect(
            baseUrl: baseUrl,
            httpScheme: httpScheme,
            connectTimeout: connectTimeout) {
    _client.defaultDecoder = itemBuilder;
  }

  Future<List<T>> getAllElements(
      {Map<String, String?> queryParameters = const {}}) async {
    final response = await _client
        .get<List<T>>(_path, queryParameters: queryParameters, decoder: (data) {
      return List<T>.from(data.map((item) => _client.defaultDecoder(item)));
    });
    return response.decodedBody;
  }

  Future<T> getItem(int id) async {
    final response = await _client.get<T>(_path + '/$id');
    return response.decodedBody;
  }

  Future<T> patchItem(int id, Map<String, dynamic> json) async {
    final response = await _client.patch<T>(_path + '/$id', json);
    return response.decodedBody;
  }
}
