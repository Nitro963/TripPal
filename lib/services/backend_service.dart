import 'package:get/get.dart';
import 'package:trip_pal_null_safe/models/hotel.dart';
import 'package:trip_pal_null_safe/services/api_view.dart';

class BackendService extends GetxService {
  final baseUrl = '127.0.0.1:8000';
  final httpScheme = 'http';

  late final ApiView<Hotel> hotelsApi;

  void onInit() {
    hotelsApi = ApiView<Hotel>(baseUrl, '/api/hotels', Hotel.fromJson,
        httpScheme: httpScheme);
    super.onInit();
  }
}
