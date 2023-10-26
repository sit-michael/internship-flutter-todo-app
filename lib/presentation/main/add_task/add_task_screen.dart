import 'package:flutter/material.dart';
import '../../../domain/bloc_exports.dart';
import '../../../core/services/guid_gen.dart';

import '../../../domain/task/entity/task.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  @override
  void initState() {
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(children: [
        const Text('Add Task', style: TextStyle(fontSize: 24)),
        const SizedBox(height: 10),
        TextField(
          autofocus: true,
          controller: _titleController,
          decoration: const InputDecoration(
            labelText: 'Title',
            border: OutlineInputBorder(),
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
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                var task = Task(
                  id: GUIDGen.generate(),
                  date: DateTime.now(),
                  title: _titleController.text,
                  description: _descriptionController.text,
                );
                context.read<TaskBloc>().add(AddTaskEvent(task));
                Navigator.pop(context);
              },
              child: const Text('Add'),
            ),
          ],
        ),
      ]),
    );
  }
}
