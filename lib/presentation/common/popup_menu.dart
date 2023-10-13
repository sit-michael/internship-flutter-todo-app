import 'package:flutter/material.dart';
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
                    icon: const Icon(Icons.edit),
                    label: const Text('Edit'),
                  ),
                ),
                PopupMenuItem(
                  child: TextButton.icon(
                    onPressed: () {
                      Navigator.of(context).pop();
                      onLike();
                    },
                    icon: Icon(task.isFavorite
                        ? Icons.bookmark_remove
                        : Icons.bookmark_add_outlined),
                    label: Text(task.isFavorite
                        ? 'Remove from\nFavorite'
                        : 'Add to\nFavorite'),
                  ),
                ),
                PopupMenuItem(
                  child: TextButton.icon(
                    onPressed: () {
                      Navigator.of(context).pop();
                      onDelete();
                    },
                    icon: const Icon(Icons.delete),
                    label: const Text('Delete'),
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
                    icon: const Icon(Icons.restore_from_trash),
                    label: const Text('Restore'),
                  ),
                ),
                PopupMenuItem(
                  child: TextButton.icon(
                    onPressed: () {
                      Navigator.of(context).pop();
                      onDelete();
                    },
                    icon: const Icon(Icons.delete_forever),
                    label: const Text('Delete forever'),
                  ),
                ),
              ],
    );
  }
}
