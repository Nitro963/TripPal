mixin InAsyncCallMixin {
  set inAsyncCall(bool value);

  bool get inAsyncCall;

  void toggleAsync() {
    inAsyncCall = !inAsyncCall;
  }

  Future<T> execute<T>(Future<T> Function() callback) {
    inAsyncCall = true;
    return callback().whenComplete(() {
      inAsyncCall = false;
    });
  }
}
