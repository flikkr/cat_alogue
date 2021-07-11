abstract class IDatabaseModel {
  int? id;

  Future<void> initModel();

  Future<IDatabaseModel> query(int id);
  Future<int> create(IDatabaseModel model);
  Future<void> update(IDatabaseModel model);
  Future<void> delete(int id);
}
