import '../repository/create_element_mixin.dart';

mixin CreateMixin<T> {
  set inAsyncCall(bool value);

  CreateElementMixin<T> get repository;

  Future<T> createModel(T model, {bool chained = false}) async {
    try {
      inAsyncCall = true;
      return await repository.createElement(model);
    } finally {
      if (!chained) inAsyncCall = false;
    }
  }
}
