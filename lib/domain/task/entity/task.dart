// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final String id;
  final String title;
  final String description;
  final DateTime date;
  final bool isDone;
  final bool isDeleted;
  final bool isFavorite;

  const Task({
    required this.title,
    required this.description,
    required this.date,
    required this.id,
    this.isDeleted = false,
    this.isFavorite = false,
    this.isDone = false,
  });

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

  Task copyWith({
    String? title,
    String? description,
    DateTime? date,
    String? id,
    bool? isDone,
    bool? isDeleted,
    bool? isFavorite,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      date: date ?? this.date,
      description: description ?? this.description,
      isDone: isDone ?? this.isDone,
      isFavorite: isFavorite ?? this.isFavorite,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }
}
