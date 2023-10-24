import 'package:flutter/material.dart';
import 'package:sit_todos/core/app/styles/app_color.dart';
import 'sub_pages/pending_tasks_screen.dart';

import 'add_task/add_task_screen.dart';
import 'sub_pages/complete_tasks_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  static const id = 'tabs_screen';

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, dynamic>> _pageDetails = [
    {'pageName': const PendingTasksScreen(), 'title': 'Pending Tasks'},
    {'pageName': const CompleteTasksScreen(), 'title': 'Complete Tasks'},
    //TODO ML: (Ticket FXT-106) Add fav page
  ];

  var _selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    // TODO ML: Add drawer (Ticket FXT-4711)
    // TODO ML: Add AppBar title (Ticket FXT-5214)
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.background,
        foregroundColor: AppColor.white,
      ),
      floatingActionButton: _selectedPageIndex == 0
          // TODO ML: Adjust FAB colour (Ticket BUGT-1734)

          ? FloatingActionButton(
              onPressed: () => _addTask(context),
              tooltip: 'Add Task',
              child: const Icon(Icons.add),
            )
          : null,
      body: _pageDetails[_selectedPageIndex]['pageName'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColor.background,
        selectedItemColor: AppColor.primary,
        unselectedItemColor: AppColor.grey200,
        currentIndex: _selectedPageIndex,
        onTap: (value) => setState(() => _selectedPageIndex = value),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Pending Task',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done),
            label: 'Completed Task',
          ),
          //TODO ML: (Ticket FXT-106) Add fav bottombar icon
        ],
      ),
    );
  }

  void _addTask(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: const AddTaskScreen(),
        ),
      ),
    );
  }
}
