import 'package:flutter/material.dart';

import '../../domain/bloc_exports.dart';
import '../common/custom_drawer.dart';
import '../common/task_list.dart';

class RecycleBinScreen extends StatelessWidget {
  const RecycleBinScreen({super.key});

  static const id = 'recycle_bin_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        final taskList = state.removedTasks;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Tasks App'),
            actions: [
              PopupMenuButton(
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: TextButton.icon(
                      onPressed: () => context
                          .read<TaskBloc>()
                          .add(const DeleteAllTasksEvent()),
                      icon: const Icon(Icons.delete_forever),
                      label: const Text('Delete all tasks'),
                    ),
                  ),
                ],
              )
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Chip(
                  label: Text(
                    '${taskList.length} Tasks',
                  ),
                ),
              ),
              TaskList(taskList: taskList)
            ],
          ),
          drawer: const CustomDrawer(),
        );
      },
    );
  }
}
