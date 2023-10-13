part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

class InitTaskEvent extends TaskEvent {
  const InitTaskEvent();
  @override
  List<Object> get props => [];
}

class AddTaskEvent extends TaskEvent {
  final Task task;

  const AddTaskEvent(this.task);
  @override
  List<Object> get props => [task];
}

class UpdateTaskDoneStateEvent extends TaskEvent {
  final Task task;

  const UpdateTaskDoneStateEvent(this.task);
  @override
  List<Object> get props => [task];
}

class UpdateTaskFavoriteStateEvent extends TaskEvent {
  final Task task;

  const UpdateTaskFavoriteStateEvent(this.task);
  @override
  List<Object> get props => [task];
}

class RemoveTaskEvent extends TaskEvent {
  final Task task;

  const RemoveTaskEvent(this.task);
  @override
  List<Object> get props => [task];
}

class RestoreTaskEvent extends TaskEvent {
  final Task task;

  const RestoreTaskEvent(this.task);
  @override
  List<Object> get props => [task];
}

class DeleteTaskEvent extends TaskEvent {
  final Task task;

  const DeleteTaskEvent(this.task);
  @override
  List<Object> get props => [task];
}

class DeleteAllTasksEvent extends TaskEvent {
  const DeleteAllTasksEvent();
  @override
  List<Object> get props => [];
}

class EditTaskEvent extends TaskEvent {
  final Task task;

  const EditTaskEvent(this.task);
  @override
  List<Object> get props => [task];
}
