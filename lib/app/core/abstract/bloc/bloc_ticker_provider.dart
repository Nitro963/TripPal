import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

abstract class BlocSingleTickerProvider<T extends StateStreamable<S>, S>
    extends GetxController with GetSingleTickerProviderStateMixin {
  final T bloc;

  BlocSingleTickerProvider(this.bloc);
}

abstract class BlocTickerProvider<T extends StateStreamable<S>, S>
    extends GetxController with GetTickerProviderStateMixin {
  final T bloc;

  BlocTickerProvider(this.bloc);
}
