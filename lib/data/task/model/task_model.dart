// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../domain/task/entity/task.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel extends Equatable {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final DateTime date;
  @HiveField(4)
  final bool isDone;
  @HiveField(5)
  final bool isDeleted;
  @HiveField(6)
  final bool isFavorite;

  const TaskModel({
    required this.title,
    required this.description,
    required this.date,
    required this.id,
    this.isDeleted = false,
    this.isFavorite = false,
    this.isDone = false,
  });

  TaskModel.fromDomain(Task task)
      : id = task.id,
        title = task.title,
        description = task.description,
        date = task.date,
        isDone = task.isDone,
        isDeleted = task.isDeleted,
        isFavorite = task.isFavorite;

  Task toDomain() => Task(
        title: title,
        description: description,
        date: date,
        id: id,
        isDeleted: isDeleted,
        isFavorite: isFavorite,
        isDone: isDone,
      );

  @override
  List<Object?> get props => [
        id,
        title,
        date,
        description,
        isDone,
        isDeleted,
        isFavorite,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'date': date.toIso8601String(),
      'description': description,
      'isDone': isDone,
      'isDeleted': isDeleted,
      'isFavorite': isFavorite,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'] as String,
      title: map['title'] as String,
      date: DateTime.parse(map['date'] as String),
      description: map['description'] as String,
      isDone: map['isDone'] as bool,
      isDeleted: map['isDeleted'] as bool,
      isFavorite: map['isFavorite'] as bool,
    );
  }
}
