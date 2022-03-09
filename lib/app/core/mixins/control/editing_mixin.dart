import '../repository/partial_update_mixin.dart';
import '../repository/update_element_mixin.dart';

mixin EditMixin<T> {
  set inAsyncCall(bool value);

  UpdateElementMixin<T> get repository;

  Future<T> updateModel(T model, {bool chained = false}) async {
    try {
      inAsyncCall = true;
      return await repository.updateElement(model);
    } finally {
      if (!chained) inAsyncCall = false;
    }
  }
}

mixin PartialEditMixin<T> {
  set inAsyncCall(bool value);

  PartialUpdateMixin<T> get repository;

  Future<T> partialUpdateModel(int id, Map<String, dynamic> updatedFields,
      {bool chained = false}) async {
    try {
      inAsyncCall = true;
      return await repository.partiallyUpdateElement(id, updatedFields);
    } finally {
      if (!chained) inAsyncCall = false;
    }
  }
}
