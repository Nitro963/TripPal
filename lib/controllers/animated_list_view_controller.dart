import 'package:get/get.dart';
import 'package:trip_pal_null_safe/models/abstract_model.dart';
import 'model_list_view_controller.dart';

abstract class AnimatedListViewController<T extends IModel> extends IModelViewController<T> {
  final _closeHeader = false.obs;
  final _topContainer = 0.0.obs;

  double get containerSize;
  double get closingThreshold;

  void onInit() {
    super.onInit();
    scrollController.addListener(() {
      var value = scrollController.offset / containerSize;
      _topContainer.value = value;
      _closeHeader.value = scrollController.offset > closingThreshold;
    });
  }

  bool get closeHeader => _closeHeader.value;
  double get topContainer => _topContainer.value;
}
