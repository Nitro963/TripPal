import 'dart:collection';

import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;
import 'package:trip_pal_null_safe/models/blog.dart';
import 'package:trip_pal_null_safe/models/tag.dart';
import 'package:trip_pal_null_safe/models/user.dart';
import 'package:trip_pal_null_safe/services/backend_service.dart';
import 'package:trip_pal_null_safe/utilities/utils.dart';

import 'details_controller.dart';

class BloggerPageController extends DetailsController {
  List<User>? _bloggerOfWeek;
  List<Blog>? _freshBlog;
  List<Tag>? _hotTags;

  UnmodifiableListView<User> get bloggerOfWeek =>
      UnmodifiableListView(_bloggerOfWeek ?? []);
  UnmodifiableListView<Blog> get freshBlog =>
      UnmodifiableListView(_freshBlog ?? []);
  UnmodifiableListView<Tag> get hotTags => UnmodifiableListView(_hotTags ?? []);

  void _fetchBloggerOfWeek() {
    Get.find<BackendService>()
        .getApiView<User>(name: 'blogger-of-week')
        .getAllElements(queryParameters: {'limit': '10'}).then((value) {
      _bloggerOfWeek = value.results;
      hasData =
          _bloggerOfWeek != null && _freshBlog != null && _hotTags != null;
    }).onError((error, stacktrace) {
      errorModel = ErrorHandlerModel.fromError(error, onReady);
      hasError = true;
    });
  }

  final dateFormatter = intl.DateFormat('yyyy-MM-dd');

  void _fetchFreshBlog() {
    Get.find<BackendService>()
        .getApiView<Blog>(name: 'blog')
        .getAllElements(queryParameters: {
      'date_after':
          dateFormatter.format(DateTime.now().subtract(Duration(days: 3))),
      'ordering': '-likes_count',
      'limit': '10',
    }).then((value) {
      _freshBlog = value.results;
      hasData =
          _bloggerOfWeek != null && _freshBlog != null && _hotTags != null;
    }).onError((error, stacktrace) {
      errorModel = ErrorHandlerModel.fromError(error, onReady);
      hasError = true;
    });
  }

  void _fetchTags() {
    Get.find<BackendService>()
        .getApiView<Tag>(name: 'tags')
        .getAllElements(queryParameters: {
      'limit': '8',
    }).then((value) {
      _hotTags = value.results;
      hasData =
          _bloggerOfWeek != null && _freshBlog != null && _hotTags != null;
    }).onError((error, stacktrace) {
      errorModel = ErrorHandlerModel.fromError(error, onReady);
      hasError = true;
    });
  }

  Future<void> fetch() async {
    _fetchBloggerOfWeek();
    _fetchFreshBlog();
    _fetchTags();
  }

  Future<void> onRefresh() async {
    _fetchBloggerOfWeek();
    _fetchFreshBlog();
    _fetchTags();
  }

  void onReady() {
    _bloggerOfWeek = null;
    _freshBlog = null;
    _hotTags = null;
    hasData = false;
    fetch();
  }

  bool get empty =>
      hasData &&
      _bloggerOfWeek!.isEmpty &&
      _freshBlog!.isEmpty &&
      _hotTags!.isEmpty;
}
