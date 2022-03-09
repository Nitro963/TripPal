import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';

import 'package:get/get.dart';

mixin GetLifeCycleMixin on GetLifeCycleBase {
  @override
  @mustCallSuper
  void onInit() {
    SchedulerBinding.instance?.addPostFrameCallback((_) => onReady());
  }

  /// Called 1 frame after onInit(). It is the perfect place to enter
  /// navigation events, like snackbar, dialogs, or a new route, or
  /// async request.
  @override
  void onReady() {}

  /// Called before [onDelete] method. [onClose] might be used to
  /// dispose resources used by the controller. Like closing events,
  /// or streams before the controller is destroyed.
  /// Or dispose objects that can potentially create some memory leaks,
  /// like TextEditingControllers, AnimationControllers.
  /// Might be useful as well to persist some data on disk.
  @override
  void onClose() {
    super.onClose();
  }
}
