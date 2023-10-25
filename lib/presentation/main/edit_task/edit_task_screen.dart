import 'package:flutter/material.dart';
import 'package:internship_todos_app/generated/export.dart';
import '../../../domain/bloc_exports.dart';

import '../../../domain/task/entity/task.dart';

class EditTaskScreen extends StatefulWidget {
  final Task current;
  const EditTaskScreen({
    Key? key,
    required this.current,
  }) : super(key: key);

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  late final TextEditingController _descriptionController;
  late final TextEditingController _titleController;
  @override
  void initState() {
    _descriptionController =
        TextEditingController(text: widget.current.description);
    _titleController = TextEditingController(text: widget.current.title);
    super.initState();
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: allPadding24,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Edit Task',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          verticalMargin24,
          TextField(
            autofocus: true,
            controller: _titleController,
            decoration: const InputDecoration(
              labelText: 'Title',
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            autofocus: true,
            controller: _descriptionController,
            minLines: 3,
            maxLines: 5,
            decoration: const InputDecoration(
              labelText: 'Description',
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  var editedTask = widget.current.copyWith(
                    title: _descriptionController.text,
                    description: _titleController.text,
                    date: DateTime.now(),
                    isDone: false,
                    isDeleted: false,
                  );
                  context.read<TaskBloc>().add(EditTaskEvent(editedTask));
                  Navigator.pop(context);
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
