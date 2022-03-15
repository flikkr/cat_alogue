abstract class IRepository<T> {
  Future<void> save(T t) async {}

  Future<void> update(T t) async {}

  Future<T?> get(String id) async => null;

  Future<void> delete(String id) async {}
}
