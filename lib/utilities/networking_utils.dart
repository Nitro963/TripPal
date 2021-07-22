import 'package:dio/dio.dart' as dio;

typedef Decoder<T> = T Function(dynamic data);
typedef Encoder = String Function(dynamic data);
typedef RequestModifier = dio.RequestOptions Function(dio.RequestOptions);

class Response<T> {
  final T decodedBody;
  final dio.Response response;
  Response(this.response, this.decodedBody);
}
