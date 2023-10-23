import 'package:flutter/material.dart';
import 'package:sit_todos/core/app/styles/app_color.dart';

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
            backgroundColor: AppColor.background,
            foregroundColor: AppColor.white,
            title: Text(
              'Recycle Bin',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            actions: [
              PopupMenuButton(
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: TextButton.icon(
                      onPressed: () => context
                          .read<TaskBloc>()
                          .add(const DeleteAllTasksEvent()),
                      icon: const Icon(
                        Icons.delete_forever,
                        color: AppColor.error,
                      ),
                      label: Text(
                        'Delete all tasks',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: AppColor.error),
                      ),
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
                  backgroundColor: AppColor.grey300,
                  label: Text(
                    style: const TextStyle(color: AppColor.white),
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
