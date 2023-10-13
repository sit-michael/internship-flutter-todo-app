import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:udemy_flutter_bloc_tasks/data/task/data_source/local/hive_task_data_source.dart';

import '../../data/settings/data_source/local_settings_data_source.dart';
import '../../data/settings/data_source/preferences_settings_data_source.dart';
import '../../data/settings/repository/settings_repository_impl.dart';
import '../../data/task/repository/task_repository_impl.dart';
import '../../domain/settings/repository/settings_repository.dart';
import '../../domain/task/repository/task_repository.dart';

GetIt get locator => GetIt.instance;

Future<void> setupLocator() async {
  await Hive.initFlutter();
  final local = HiveTaskDataSource(Hive);
  await local.init();
  TaskRepository taskRepo = TaskRepositoryImpl(local);
  locator.registerSingleton<TaskRepository>(taskRepo);

  SharedPreferences prefs = await SharedPreferences.getInstance();
  LocalSettingsDataSource settingsLocal = PreferencesSettingsDataSource(prefs);
  SettingsRepository settingsRepo = SettingsRepositoryImpl(settingsLocal);
  locator.registerSingleton<SettingsRepository>(settingsRepo);
}
