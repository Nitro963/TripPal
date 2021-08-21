import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:trip_pal_null_safe/models/device_info.dart';
import 'package:trip_pal_null_safe/utilities/constants.dart';
import 'package:trip_pal_null_safe/utilities/networking_utils.dart';
import 'package:trip_pal_null_safe/models/user.dart';

class AuthControl extends GetxService {
  final box = GetStorage();
  final _client = DioConnect(
      baseUrl: LOCAL_SERVER_END_POINT,
      httpScheme: HttpScheme.http,
      connectTimeout: 8000);

  final _loginPath = BASE_URL + '/login/';

  final _registerPath = BASE_URL + '/register/';

  final _logoutPath = BASE_URL + '/logout/';

  final _logoutAllPath = BASE_URL + '/logout-all';

  final String _devicesPath = BASE_URL + '/devices';

  User? currentUser;

  bool get isAuthenticated {
    return currentUser != null;
  }

  bool get freshStart => _freshStart;
  late final bool _freshStart;

  String get token => _token!;

  String? _token;

  void onInit() {
    _token = box.read<String>('token');
    _freshStart = _token == null;
    super.onInit();
  }

  Future<User> _updateUserDeviceInfo() async {
    var res = await _client.put<User>(
        _devicesPath + '/update/', await DeviceInfo.fromPlatform(),
        headers: {'Authorization': 'Token $token'}, decoder: (data) {
      return User.fromJson(data['user']);
    });
    return res.decodedBody;
  }

  Future<void> checkUserToken() async {
    if (_token != null) {
      currentUser = await _updateUserDeviceInfo();
    }
  }

  void onUnauthorizedError() {
    currentUser = null;
    _token = null;
    Get.offAllNamed('/home');
    // box.write('token', null);
  }

  Future<User> login({required String email, required String password}) async {
    var res = await _client.post<User>(
        _loginPath, {'email': email, 'password': password}, decoder: (data) {
      _token = data['token'];
      return User.fromJson(data['user']);
    });
    await _updateUserDeviceInfo();
    currentUser = res.decodedBody;
    box.write('token', token);
    return res.decodedBody;
  }

  Future<User> register(User user) async {
    var res = await _client.post<User>(_registerPath, user, decoder: (data) {
      _token = data['token'];
      return User.fromJson(data['user']);
    });
    currentUser = res.decodedBody;
    box.write('token', token);
    return res.decodedBody;
  }

  Future<void> logoutAll(User user) async {
    // var request =
    // http.Request('post', Uri.https(LOCAL_SERVER_END_POINT, _logoutAllPath));
    // request.headers.addAll(JSON_HEADERS);
    // request.headers
    //     .putIfAbsent('Authorization', () => 'Bearer ${user.authToken}');
    // // var responseBody = await sendRequest(request);
  }

  Future<void> logout(User user) async {
    // var request =
    // http.Request('post', Uri.https(LOCAL_SERVER_END_POINT, _logoutPath));
    // request.headers.addAll(JSON_HEADERS);
    // request.headers
    //     .putIfAbsent('Authorization', () => 'Bearer ${user.authToken}');
    // // var responseBody = await sendRequest(request);
  }

  bool get isGuest => _token == null;

  void activateGuestMode() {
    _token = null;
  }
}
