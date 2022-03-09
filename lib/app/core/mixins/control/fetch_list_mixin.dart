import '../repository/retrieve_elements_mixin.dart';

mixin FetchModelListMixin<T> {
  RetrieveElementsMixin<T> get repository;

  set isLoadingMore(bool value);

  set empty(bool value);

  void addAll(Iterable<T> iterable);

  void clear();

  Future<void> fetchNew(
      {Map<String, dynamic> queryParameters = const {}}) async {
    var res =
        await repository.retrieveAllElements(queryParameters: queryParameters);
    clear();
    empty = res.isEmpty;
    addAll(res);
  }

  Future<void> fetchMore(
      {Map<String, dynamic> queryParameters = const {}}) async {
    try {
      isLoadingMore = true;
      var res = await repository.retrieveAllElements(
          queryParameters: queryParameters);
      addAll(res);
    } finally {
      isLoadingMore = false;
    }
  }
}
