import 'dart:developer' as developer;

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
      httpScheme: DEFAULT_CONNECTION_PROTOCOL,
      connectTimeout: 8000);

  final _loginPath = BASE_URL + '/login/';

  final _registerPath = BASE_URL + '/register/';

  final _logoutPath = BASE_URL + '/users/logout/';

  final String _devicesPath = BASE_URL + '/devices/';

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
        _devicesPath + 'update/', await DeviceInfo.fromPlatform(),
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
    // forget the revoked token, otherwise every app start retries it
    box.remove('token');
    Get.offAllNamed('/home');
  }

  // Registering the device (FCM token) must not block signing in.
  Future<void> _tryUpdateUserDeviceInfo() async {
    try {
      await _updateUserDeviceInfo();
    } catch (e) {
      developer.log('device registration failed', name: 'AUTH', error: e);
    }
  }

  Future<User> login({required String email, required String password}) async {
    var res = await _client.post<User>(
        _loginPath, {'email': email, 'password': password}, decoder: (data) {
      _token = data['token'];
      return User.fromJson(data['user']);
    });
    await _tryUpdateUserDeviceInfo();
    currentUser = res.decodedBody;
    box.write('token', token);
    return res.decodedBody;
  }

  Future<User> register(User user) async {
    var res = await _client.post<User>(_registerPath, user, decoder: (data) {
      _token = data['token'];
      return User.fromJson(data['user']);
    });
    await _tryUpdateUserDeviceInfo();
    currentUser = res.decodedBody;
    box.write('token', token);
    return res.decodedBody;
  }

  Future<void> logout() async {
    if (!isGuest) {
      await _client
          .get(_logoutPath, headers: {'Authorization': 'Token $_token'});
      currentUser = null;
      box.remove('token');
      _token = null;
      Get.offAllNamed('/login');
    } else {
      Get.offAllNamed('/login');
      currentUser = null;
    }
  }

  bool get isGuest => _token == null;

  void activateGuestMode() {
    _token = null;
    Get.find<AuthControl>().currentUser = User(
        firstName: 'TripPal',
        lastName: 'Guest',
        email: 'guest@trippal.com',
        profilePicture: 'https://loremflickr.com/320/320/person?random=-1');
  }
}
