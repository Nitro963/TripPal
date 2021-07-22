import 'package:trip_pal_null_safe/models/abstract_model.dart';
import 'package:trip_pal_null_safe/services/network_service.dart';
import 'package:trip_pal_null_safe/utilities/networking_utils.dart';

class ApiView<T extends IModel> extends NetworkService {
  final String _path;

  ApiView(String baseUrl, String path, Decoder<T> itemBuilder,
      {String httpScheme = 'https', int connectTimeout = 8000})
      : _path = path,
        super(
            baseUrl: baseUrl,
            httpScheme: httpScheme,
            connectTimeout: connectTimeout) {
    defaultDecoder = itemBuilder;
  }

  Future<List<T>> getAllElements(
      {Map<String, String> queryParameters = const {}}) async {
    final response = await this
        .get<List<T>>(_path, queryParameters: queryParameters, decoder: (data) {
      return List<T>.from(data.map((item) => defaultDecoder(item)));
    });
    return response.decodedBody;
  }

  Future<T> getItem(int id) async {
    final response = await this.get<T>(_path + '/$id');
    return response.decodedBody;
  }

  Future<T> patchItem(int id, Map<String, dynamic> json) async {
    final response = await this.put<T>(_path + '$id', json);
    return response.decodedBody;
  }
}
