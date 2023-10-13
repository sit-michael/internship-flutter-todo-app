import '../../../domain/task/entity/task.dart';
import '../../../domain/task/repository/task_repository.dart';
import '../data_source/local_task_data_source.dart';
import '../data_source/remote_task_data_source.dart';
import '../model/task_model.dart';

class TaskRepositoryImpl extends TaskRepository {
  final LocalTaskDataSource _local;

  TaskRepositoryImpl(this._local);

  @override
  Future<void> create(Task task) async {
    final model = TaskModel.fromDomain(task);
    await _local.create(model);
  }

  @override
  Future<void> delete(Task task) async {
    final model = TaskModel.fromDomain(task);
    await _local.delete(model);
  }

  @override
  Future<List<Task>> get() async {
    List<TaskModel> models = await _local.get();
    return models.map((e) => e.toDomain()).toList();
  }

  @override
  Future<void> update(Task task) async {
    final model = TaskModel.fromDomain(task);
    await _local.update(model);
  }
}
