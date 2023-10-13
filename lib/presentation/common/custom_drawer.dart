import 'package:flutter/material.dart';

import '../../core/app/router/app_routes_export.dart';
import '../../domain/bloc_exports.dart';
import 'dark_mode_switch.dart';
import 'version_label.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
          child: Column(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.grey),
            child: SizedBox(
              width: double.infinity,
              child: Text(
                'Task Drawer',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),
          ListTile(
            onTap: () =>
                Navigator.of(context).pushReplacementNamed(TabsScreen.id),
            leading: const Icon(Icons.folder_special),
            title: const Text('My Tasks'),
            trailing: BlocBuilder<TaskBloc, TaskState>(
              builder: (context, state) {
                return Text(
                    '${state.pendingTasks.length} | ${state.completedTasks.length}');
              },
            ),
          ),
          const Divider(),
          ListTile(
            onTap: () =>
                Navigator.of(context).pushReplacementNamed(RecycleBinScreen.id),
            leading: const Icon(Icons.delete),
            title: const Text('Bin'),
            trailing: BlocBuilder<TaskBloc, TaskState>(
              builder: (context, state) {
                return Text('${state.removedTasks.length}');
              },
            ),
          ),
          const Divider(),
          const Spacer(flex: 3),
          const DarkModeSwitch(),
          const Spacer(flex: 1),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: VersionLabel(),
          )
        ],
      )),
    );
  }
}
