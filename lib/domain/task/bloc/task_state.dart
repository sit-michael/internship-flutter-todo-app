part of 'task_bloc.dart';

class TaskState extends Equatable {
  final List<Task> allTasks;
  List<Task> get pendingTasks => allTasks
      .where((task) => !task.isDone && !removedTasks.contains(task))
      .toList();
  List<Task> get completedTasks => allTasks
      .where((task) => task.isDone && !removedTasks.contains(task))
      .toList();
  List<Task> get favoriteTasks => allTasks
      .where((task) => task.isFavorite && !removedTasks.contains(task))
      .toList();
  List<Task> get removedTasks =>
      allTasks.where((task) => task.isDeleted).toList();
  const TaskState({
    this.allTasks = const [],
  });

  @override
  List<Object> get props =>
      [allTasks, removedTasks, completedTasks, favoriteTasks];
}

class TaskInitial extends TaskState {}
