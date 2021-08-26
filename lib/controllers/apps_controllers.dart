import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;

import 'package:trip_pal_null_safe/models/blog.dart';
import 'package:trip_pal_null_safe/models/filter.dart';
import 'package:trip_pal_null_safe/models/hotel.dart';
import 'package:trip_pal_null_safe/models/tag.dart';
import 'package:trip_pal_null_safe/models/trip.dart';
import 'package:trip_pal_null_safe/models/user.dart';
import 'package:trip_pal_null_safe/services/api_view.dart';
import 'package:trip_pal_null_safe/services/backend_service.dart';
import 'package:trip_pal_null_safe/models/sort_policy.dart';
import 'model_list_view_controller.dart';

class HotelsViewController extends IModelViewController {
  @override
  ApiView<Place> get api =>
      Get.find<BackendService>().getApiView(name: 'hotels');

  List<SortPolicy> get sortPolices => [
        SortPolicy('None', null, 0, 'null'),
        SortPolicy('Name', 'A to Z', 1, 'name'),
        SortPolicy('Name', 'Z to A', 2, '-name'),
        SortPolicy('Average rate', 'Low to High', 3, 'guest_rating'),
        SortPolicy('Average rate', 'High to Low', 4, '-guest_rating'),
        SortPolicy('Reviews count', 'Low to High', 5, 'reviews_count'),
        SortPolicy('Reviews count', 'High to Low', 6, '-reviews_count'),
        SortPolicy('Distance to city center', 'Low to High', 7, 'distance'),
        SortPolicy('Distance to city center', 'High to Low', 8, '-distance'),
      ];
}

class TagsListController extends IModelViewController<Tag> {
  @override
  ApiView<Tag> get api => Get.find<BackendService>().getApiView(name: 'tags');

  List<SortPolicy> get sortPolices => [
        SortPolicy('None', null, 0, 'null'),
        SortPolicy('Name', 'A to Z', 1, 'name'),
        SortPolicy('Name', 'Z to A', 2, '-name'),
        SortPolicy('Blog count', 'Low to High', 3, 'blog_count'),
        SortPolicy('Blog count', 'High to Low', 4, '-blog_count'),
      ];
}

class BlogListViewController extends IModelViewController<Blog> {
  @override
  ApiView<Blog> get api => Get.find<BackendService>().getApiView(name: 'blog');

  List<SortPolicy> get sortPolices => [
        SortPolicy('None', null, 0, 'null'),
        SortPolicy('Title', 'A to Z', 1, 'title'),
        SortPolicy('Title', 'Z to A', 2, '-title'),
        SortPolicy('Date', 'Most recent', 3, '-date'),
        SortPolicy('Date', 'Oldest first', 4, 'date'),
        SortPolicy('Likes', 'High to Low', 5, '-likes_count'),
        SortPolicy('Likes', 'Low to High', 6, 'likes_count'),
      ];
  @override
  List<Filter> get filteringPolices =>
      [DateFilter('date', intl.DateFormat('yyyy-MM-dd'))];

  void onInit() {
    super.onInit();
  }
}

class UsersListController extends IModelViewController<User> {
  @override
  ApiView<User> get api => Get.find<BackendService>().getApiView(name: 'users');
}
