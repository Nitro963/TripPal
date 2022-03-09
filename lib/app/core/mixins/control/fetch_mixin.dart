import 'dart:async';

mixin FetchMixin<T> {
  set model(T? model);

  Future<void> onReady() {
    model = null;
    return fetch().then((value) {
      model = value;
    });
  }

  Future<T> fetch();
}
