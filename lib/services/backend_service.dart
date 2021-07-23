import 'package:get/get.dart';
import 'package:trip_pal_null_safe/models/hotel.dart';
import 'package:trip_pal_null_safe/services/api_view.dart';
import 'package:trip_pal_null_safe/models/review.dart';

class ReviewsApi extends ApiView<Review> {
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
  final baseUrl = '127.0.0.1:8000';
  final httpScheme = 'http';

  late final NetworkApiView<Hotel> hotelsApi;
  late final ApiView<Review> reviewsApi;

  void onInit() {
    hotelsApi = NetworkApiView<Hotel>(baseUrl, '/api/hotels', Hotel.fromJson,
        httpScheme: httpScheme);
    reviewsApi = ReviewsApi();
    super.onInit();
  }
}
