import '../repository/retrieve_element_mixin.dart';

mixin FetchModelMixin<T> {
  RetrieveElementMixin<T> get repository;

  int get id;

  Future<T> fetch() async {
    return repository.retrieveElementByID(id);
  }
}
