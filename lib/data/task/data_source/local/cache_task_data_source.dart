import '../local_task_data_source.dart';
import '../../model/task_model.dart';

class CacheTaskDataSource extends LocalTaskDataSource {
  final List<TaskModel> _tasks = [];

  @override
  Future<void> create(TaskModel model) async => _tasks.add(model);

  @override
  Future<void> delete(TaskModel model) async => _tasks.remove(model);

  @override
  Future<List<TaskModel>> get() async => List.from(_tasks);

  @override
  Future<void> update(TaskModel model) async => _tasks
    ..removeWhere((task) => task.id == model.id)
    ..add(model);
}
