import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/user_model.dart';

part 'user_provider.g.dart';

@RestApi()
abstract class UserProvider {
  factory UserProvider(Dio dio, {String baseUrl}) = _UserProvider;

  @GET('/user/{id}')
  Future<User> getUserByID(@Path('id') String id);
}
