import 'dart:async';

import 'package:equatable/equatable.dart';
import '../repository/task_repository.dart';

import '../entity/task.dart';
import '../../bloc_exports.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepository _repo;

  TaskBloc(this._repo) : super(TaskInitial()) {
    on<AddTaskEvent>(_onAddTask);
    on<UpdateTaskDoneStateEvent>(_onUpdateTaskDoneState);
    on<UpdateTaskFavoriteStateEvent>(_onUpdateTaskFavoriteState);
    on<DeleteAllTasksEvent>(_onDeleteAllTasks);
    on<DeleteTaskEvent>(_onDeleteTask);
    on<RemoveTaskEvent>(_onRemoveTask);
    on<EditTaskEvent>(_onEditTask);
    on<RestoreTaskEvent>(_onRestoreTask);
    on<InitTaskEvent>(_onInit);

    add(const InitTaskEvent());
  }

  Future<void> _onAddTask(AddTaskEvent event, Emitter<TaskState> emit) async {
    final task = event.task;

    await _repo.create(task);
    final newList = await _repo.get();

    emit(TaskState(allTasks: newList));
  }

  Future<void> _onEditTask(EditTaskEvent event, Emitter<TaskState> emit) async {
    final task = event.task;

    await _repo.update(task);
    final newList = await _repo.get();

    emit(TaskState(allTasks: newList));
  }

  Future<void> _onUpdateTaskDoneState(
      UpdateTaskDoneStateEvent event, Emitter<TaskState> emit) async {
    final task = event.task.copyWith(isDone: !event.task.isDone);

    await _repo.update(task);
    final newList = await _repo.get();

    emit(TaskState(allTasks: newList));
  }

  Future<void> _onUpdateTaskFavoriteState(
      UpdateTaskFavoriteStateEvent event, Emitter<TaskState> emit) async {
    final task = event.task.copyWith(isFavorite: !event.task.isFavorite);

    await _repo.update(task);
    final newList = await _repo.get();

    emit(TaskState(allTasks: newList));
  }

  Future<void> _onRemoveTask(
      RemoveTaskEvent event, Emitter<TaskState> emit) async {
    final task = event.task.copyWith(isDeleted: true);

    await _repo.update(task);
    final newList = await _repo.get();

    emit(TaskState(allTasks: newList));
  }

  Future<void> _onRestoreTask(
      RestoreTaskEvent event, Emitter<TaskState> emit) async {
    final task = event.task.copyWith(
      isDeleted: false,
      isDone: false,
      isFavorite: false,
    );

    await _repo.update(task);
    final newList = await _repo.get();

    emit(TaskState(allTasks: newList));
  }

  Future<void> _onDeleteTask(
      DeleteTaskEvent event, Emitter<TaskState> emit) async {
    final task = event.task;

    await _repo.delete(task);
    final newList = await _repo.get();

    emit(TaskState(allTasks: newList));
  }

  Future<void> _onDeleteAllTasks(
      DeleteAllTasksEvent event, Emitter<TaskState> emit) async {
    await Future.wait(state.removedTasks.map((e) => _repo.delete(e)));
    final newList = await _repo.get();

    emit(TaskState(allTasks: newList));
  }

  Future<void> _onInit(event, Emitter<TaskState> emit) async {
    final tasks = await _repo.get();
    emit(TaskState(allTasks: tasks));
  }
}
