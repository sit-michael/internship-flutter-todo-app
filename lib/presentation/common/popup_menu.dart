import 'package:flutter/material.dart';
import 'package:sit_todos/core/app/styles/app_color.dart';
import '../../domain/task/entity/task.dart';

class PopupMenu extends StatelessWidget {
  final Task task;
  final VoidCallback onDelete;
  final VoidCallback onLike;
  final VoidCallback onEdit;
  final VoidCallback onRestore;
  const PopupMenu({
    super.key,
    required this.task,
    required this.onDelete,
    required this.onLike,
    required this.onEdit,
    required this.onRestore,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: !task.isDeleted
          ? (context) => [
                PopupMenuItem(
                  child: TextButton.icon(
                    onPressed: () {
                      Navigator.of(context).pop();
                      onEdit();
                    },
                    icon: const Icon(
                      Icons.edit,
                      color: AppColor.grey400,
                    ),
                    label: Text(
                      'Edit',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ),
                PopupMenuItem(
                  child: TextButton.icon(
                    onPressed: () {
                      Navigator.of(context).pop();
                      onLike();
                    },
                    icon: Icon(
                      task.isFavorite
                          ? Icons.bookmark_remove
                          : Icons.bookmark_add_outlined,
                      color: AppColor.highlight,
                    ),
                    label: FittedBox(
                      child: Text(
                        task.isFavorite
                            ? 'Remove from\nFavorite'
                            : 'Add to\nFavorite',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: AppColor.highlight),
                      ),
                    ),
                  ),
                ),
                PopupMenuItem(
                  child: TextButton.icon(
                    onPressed: () {
                      Navigator.of(context).pop();
                      onDelete();
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: AppColor.error,
                    ),
                    label: Text(
                      'Delete',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: AppColor.error),
                    ),
                  ),
                ),
              ]
          : (context) => [
                PopupMenuItem(
                  child: TextButton.icon(
                    onPressed: () {
                      Navigator.of(context).pop();
                      onRestore();
                    },
                    icon: const Icon(
                      Icons.restore_from_trash,
                      color: AppColor.primary,
                    ),
                    label: const Text(
                      'Restore',
                      style: TextStyle(color: AppColor.primary),
                    ),
                  ),
                ),
                PopupMenuItem(
                  child: TextButton.icon(
                    onPressed: () {
                      Navigator.of(context).pop();
                      onDelete();
                    },
                    icon: const Icon(
                      Icons.delete_forever,
                      color: AppColor.error,
                    ),
                    label: const Text(
                      'Delete forever',
                      style: TextStyle(color: AppColor.error),
                    ),
                  ),
                ),
              ],
    );
  }
}
