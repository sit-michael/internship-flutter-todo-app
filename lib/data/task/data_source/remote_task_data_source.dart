import '../model/task_model.dart';

abstract class RemoteTaskDataSource {
  Future<void> create(TaskModel model);
  Future<List<TaskModel>> get();
  Future<void> update(TaskModel model);
  Future<void> delete(TaskModel model);
}
