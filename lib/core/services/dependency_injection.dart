import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sit_todos/data/task/data_source/local/hive_task_data_source.dart';

import '../../data/task/repository/task_repository_impl.dart';
import '../../domain/task/repository/task_repository.dart';

GetIt get locator => GetIt.instance;

Future<void> setupLocator() async {
  await Hive.initFlutter();
  final local = HiveTaskDataSource(Hive);
  await local.init();
  TaskRepository taskRepo = TaskRepositoryImpl(local);
  locator.registerSingleton<TaskRepository>(taskRepo);
}
