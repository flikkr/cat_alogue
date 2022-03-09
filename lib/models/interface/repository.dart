abstract class IRepository<T> {
  Future<void> save(T t);

  Future<void> update(T t) async {}

  Future<T?> get(String id);

  Future<void> delete(String id) async {}
}
