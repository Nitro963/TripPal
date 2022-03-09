mixin PartialUpdateMixin<T> {
  Future<T> partiallyUpdateElement(int id, Map<String, dynamic> updatedFields);
}
