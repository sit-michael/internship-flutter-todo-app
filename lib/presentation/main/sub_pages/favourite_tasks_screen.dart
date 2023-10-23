import 'package:flutter/material.dart';
import 'package:sit_todos/core/app/styles/app_color.dart';

import '../../../domain/bloc_exports.dart';
import '../../common/task_list.dart';

class FavouriteTasksScreen extends StatelessWidget {
  const FavouriteTasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        final taskList = state.favoriteTasks;
        return Column(
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
        );
      },
    );
  }
}
