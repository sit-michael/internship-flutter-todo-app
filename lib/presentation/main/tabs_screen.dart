import 'package:flutter/material.dart';
import 'package:internship_todos_app/core/app/styles/app_color.dart';
import 'package:internship_todos_app/presentation/common/custom_drawer.dart';
import 'package:internship_todos_app/presentation/main/sub_pages/favourite_tasks_screen.dart';
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
    {'pageName': const FavouriteTasksScreen(), 'title': 'Favourite Tasks'},
  ];

  var _selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pageDetails[_selectedPageIndex]['title'],
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        backgroundColor: AppColor.background,
        foregroundColor: AppColor.white,
      ),
      drawer: const CustomDrawer(),
      floatingActionButton: _selectedPageIndex == 0
          ? FloatingActionButton(
              backgroundColor: AppColor.primary,
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
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favourite Task',
          ),
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
