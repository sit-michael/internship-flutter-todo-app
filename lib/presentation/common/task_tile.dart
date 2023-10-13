import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../domain/bloc_exports.dart';
import '../../domain/task/entity/task.dart';
import '../main/edit_task/edit_task_screen.dart';
import 'popup_menu.dart';

class TaskTile extends ExpansionPanelRadio {
  TaskTile({required Task task})
      : super(
          value: task.id,
          headerBuilder: (context, isExpanded) => Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(task.isFavorite ? Icons.star : Icons.star_outline),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              task.title,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                decoration: task.isDone
                                    ? TextDecoration.lineThrough
                                    : null,
                              ),
                            ),
                            Text(DateFormat()
                                .add_yMMMMd()
                                .format(DateTime.now()))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                      onChanged: !task.isDeleted
                          ? (_) => context
                              .read<TaskBloc>()
                              .add(UpdateTaskDoneStateEvent(task))
                          : null,
                      value: task.isDone,
                    ),
                    PopupMenu(
                      task: task,
                      onRestore: () =>
                          context.read<TaskBloc>().add(RestoreTaskEvent(task)),
                      onEdit: () => _editTask(context, task),
                      onDelete: () => _removeOrDeleteTask(context, task),
                      onLike: () => context
                          .read<TaskBloc>()
                          .add(UpdateTaskFavoriteStateEvent(task)),
                    ),
                  ],
                )
              ],
            ),
          ),
          body: Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.topLeft,
            child: SelectableText.rich(
              TextSpan(
                children: [
                  const TextSpan(
                    text: 'Text\n',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: task.title),
                  const TextSpan(text: '\n\n'),
                  const TextSpan(
                    text: 'Description\n',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: task.description),
                ],
              ),
            ),
          ),
        );

  static void _removeOrDeleteTask(BuildContext context, Task task) {
    final blocSink = context.read<TaskBloc>().add;
    if (task.isDeleted) {
      blocSink(DeleteTaskEvent(task));
    } else {
      blocSink(RemoveTaskEvent(task));
    }
  }

  static void _editTask(BuildContext context, Task task) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: EditTaskScreen(current: task),
        ),
      ),
    );
  }
}
