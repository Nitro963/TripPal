import 'package:get/get.dart' hide Decoder;
import 'package:trip_pal_null_safe/models/PlacesSEData.dart';
import 'package:trip_pal_null_safe/models/hotel.dart';
import 'package:trip_pal_null_safe/services/api_view.dart';
import 'package:trip_pal_null_safe/models/review.dart';
import 'package:trip_pal_null_safe/utilities/constants.dart';

class ReviewsApi implements ApiView<Review> {
  @override
  Future<Review> getItem(int id) async {
    // TODO: implement getItem
    throw UnimplementedError();
  }

  @override
  Future<Review> patchItem(int id, Map<String, dynamic> json) async {
    // TODO: implement patchItem
    throw UnimplementedError();
  }

  @override
  Future<List<Review>> getAllElements(
      {Map<String, String?> queryParameters = const {}}) async {
    return await Future.delayed(Duration(seconds: 2), () {
      return Iterable.generate(
          10, (_) => Review(placeID: 1, text: '', userID: 1)).toList();
    });
  }
}

class BackendService extends GetxService {
  final backendServerEndPoint = LOCAL_SERVER_END_POINT;
  final basePath = BASE_URL;

  late final ApiView<Hotel> hotelsApi;
  late final ApiView<Review> reviewsApi;

  void onInit() {
    hotelsApi = DummyApiView<Hotel>(data: dummyHotels, decoder: Hotel.fromJson);
    reviewsApi = ReviewsApi();
    super.onInit();
  }
}
