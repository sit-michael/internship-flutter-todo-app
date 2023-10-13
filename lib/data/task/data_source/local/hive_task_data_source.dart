import 'package:hive_flutter/hive_flutter.dart';

import '../local_task_data_source.dart';
import '../../model/task_model.dart';

class HiveTaskDataSource extends LocalTaskDataSource {
  HiveTaskDataSource(this._hive);
  late final Box<TaskModel> _tBox;
  final HiveInterface _hive;

  Future<void> init() async {
    if (!_hive.isAdapterRegistered(TaskModelAdapter().typeId)) {
      _hive.registerAdapter(TaskModelAdapter());
    }
    _tBox = await _hive.openBox<TaskModel>('_taskBox');
  }

  @override
  Future<void> create(TaskModel model) async => _tBox.put(model.id, model);

  @override
  Future<void> delete(TaskModel model) async => _tBox.delete(model.id);

  @override
  Future<List<TaskModel>> get() async => _tBox.values.toList();

  @override
  Future<void> update(TaskModel model) async => _tBox.put(model.id, model);
}
