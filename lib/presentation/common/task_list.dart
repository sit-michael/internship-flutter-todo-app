import 'package:flutter/material.dart';
import 'task_tile.dart';

import '../../domain/task/entity/task.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    Key? key,
    required this.taskList,
  }) : super(key: key);

  final List<Task> taskList;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ExpansionPanelList.radio(
        children: taskList.map((task) => TaskTile(task: task)).toList(),
      ),
    );
  }
}
