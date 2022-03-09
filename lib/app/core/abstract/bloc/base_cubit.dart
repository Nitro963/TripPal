import 'package:flutter/foundation.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../mixins/get/get_life_cycle_mixin.dart';

class BaseCubit<T> extends Cubit<T> with GetLifeCycleBase, GetLifeCycleMixin {
  BaseCubit(T initialState) : super(initialState) {
    $configureLifeCycle();
  }

  @override
  @mustCallSuper
  void onClose() {
    close();
  }
}
