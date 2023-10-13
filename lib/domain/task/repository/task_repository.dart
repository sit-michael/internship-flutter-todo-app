import '../entity/task.dart';

abstract class TaskRepository {
  Future<void> create(Task task);
  Future<List<Task>> get();
  Future<void> update(Task task);
  Future<void> delete(Task task);
}
