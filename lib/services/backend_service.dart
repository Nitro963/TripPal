import 'package:get/get.dart' hide Decoder;
import 'package:trip_pal_null_safe/models/abstract_model.dart';
import 'package:trip_pal_null_safe/models/blog.dart';
import 'package:trip_pal_null_safe/models/hotel.dart';
import 'package:trip_pal_null_safe/models/review.dart';
import 'package:trip_pal_null_safe/models/tag.dart';
import 'package:trip_pal_null_safe/models/trip.dart';
import 'package:trip_pal_null_safe/models/user.dart';
import 'package:trip_pal_null_safe/services/api_view.dart';
import 'package:trip_pal_null_safe/services/auth_service.dart';
import 'package:trip_pal_null_safe/utilities/constants.dart';

class BackendService extends GetxService {
  final Map<String, NetworkApiView> _netViews = {};

  ApiView<T> getApiView<T extends IModel>({required String name}) {
    var api = _netViews[name];
    try {
      return api as ApiView<T>;
    } catch (e) {}
    throw UnimplementedError('$name ApiView<$T> does not exist yet!');
  }

  void onInit() {
    _netViews['users'] = NetworkApiView<User>(
        LOCAL_SERVER_END_POINT, BASE_URL + '/users/', User.fromJson);
    _netViews['tags'] = NetworkApiView<Tag>(
        LOCAL_SERVER_END_POINT, BASE_URL + '/tags/', Tag.fromJson);
    _netViews['blog'] = NetworkApiView<Blog>(
        LOCAL_SERVER_END_POINT, BASE_URL + '/blogs/', Blog.fromJson);
    _netViews['blogger-of-week'] = NetworkApiView<User>(LOCAL_SERVER_END_POINT,
        BASE_URL + '/blogs/blogger-of-week/', User.fromJson);
    _netViews['places'] = NetworkApiView<Place>(
        LOCAL_SERVER_END_POINT, BASE_URL + '/places-db/', Place.fromJson);
    _netViews['hotels'] = NetworkApiView<Place>(
        LOCAL_SERVER_END_POINT, BASE_URL + '/hotels-db/', Place.fromJson);
    _netViews['reviews'] = NetworkApiView<Review>(
        LOCAL_SERVER_END_POINT, BASE_URL + '/places-review/', Review.fromJson);
    // TODO update decoder to trip.fromJson
    _netViews['trips'] = NetworkApiView<Trip>(
        LOCAL_SERVER_END_POINT, BASE_URL + '/trips/', Trip.fromJson);

    _netViews.forEach((key, value) {
      value.addRequestModifier((request) {
        if (!Get.find<AuthControl>().isGuest)
          request.headers.addIf(!request.headers.containsKey('Authorization'),
              'Authorization', 'Token ${Get.find<AuthControl>().token}');
        return request;
      });
    });
    super.onInit();
  }
}
