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
  List<User> _bloggerOfWeek = List<User>.empty(growable: true).obs;
  List<Blog> _freshBlog = List<Blog>.empty(growable: true).obs;
  List<Tag> _hotTags = List<Tag>.empty(growable: true).obs;

  UnmodifiableListView<User> get bloggerOfWeek =>
      UnmodifiableListView(_bloggerOfWeek);

  UnmodifiableListView<Blog> get freshBlog => UnmodifiableListView(_freshBlog);

  UnmodifiableListView<Tag> get hotTags => UnmodifiableListView(_hotTags);

  Future<void> _fetchBloggerOfWeek() async {
    var value = await Get.find<BackendService>()
        .getApiView<User>(name: 'blogger-of-week')
        .getAllElements(queryParameters: {'limit': '10'});
    _bloggerOfWeek
      ..clear()
      ..addAll(value.results);
  }

  final dateFormatter = intl.DateFormat('yyyy-MM-dd');

  Future<void> _fetchFreshBlog() async {
    var value = await Get.find<BackendService>()
        .getApiView<Blog>(name: 'blog')
        .getAllElements(queryParameters: {
      'date_after':
          dateFormatter.format(DateTime.now().subtract(Duration(days: 3))),
      'ordering': '-likes_count',
      'limit': '10',
    });
    _freshBlog
      ..clear()
      ..addAll(value.results);
  }

  Future<void> _fetchTags() async {
    var value = await Get.find<BackendService>()
        .getApiView<Tag>(name: 'tags')
        .getAllElements(queryParameters: {
      'limit': '8',
    });
    _hotTags
      ..clear()
      ..addAll(value.results);
  }

  Future<void> onRefresh() async {
    try {
      await Future.wait<void>(
          [_fetchBloggerOfWeek(), _fetchFreshBlog(), _fetchTags()]);
      hasData = true;
    } catch (error) {
      errorModel = ErrorHandlerModel.fromError(error, onReady);
      hasError = true;
      hasData = false;
    }
  }

  void onReady() {
    hasError = false;
    hasData = false;
    onRefresh();
  }

  bool get empty =>
      _hotTags.isEmpty && _freshBlog.isEmpty && _bloggerOfWeek.isEmpty;
}
