import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip_pal_null_safe/controllers/model_list_view_controller.dart';
import 'package:trip_pal_null_safe/models/abstract_model.dart';
import 'package:trip_pal_null_safe/models/blog.dart';
import 'package:trip_pal_null_safe/services/api_view.dart';
import 'package:trip_pal_null_safe/services/backend_service.dart';
import 'package:trip_pal_null_safe/widgets/extendable/model_view.dart';
import 'package:trip_pal_null_safe/widgets/simple/titled_image.dart';

class BlogListController extends IModelViewController<Blog> {
  @override
  ApiView<Blog> get api => Get.find<BackendService>().getApiView(name: 'blogs');
}

class BlogGridView extends IModelGridView {
  @override
  IModelViewController<Blog> get controller => Get.find<BlogListController>();

  @override
  Widget buildViewTile(int index, IModel model, BuildContext context) {
    final blog = model as Blog;
    return GestureDetector(
      onTap: () {
        // TODO navigate to blog view
        Get.toNamed('/home/apps/blog?blog_id=${blog.id}');
      },
      child: TitledImage(imageUrl: blog.image!, title: blog.title!),
    );
  }

  @override
  IconData get tileIcon => Icons.text_snippet_outlined;

  @override
  String get title => 'Blogs';
}
