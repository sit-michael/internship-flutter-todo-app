import 'package:flutter/material.dart';
import 'package:udemy_flutter_bloc_tasks/core/app/assets/app_image.dart';
import 'package:udemy_flutter_bloc_tasks/core/app/styles/app_color.dart';

import '../../core/app/router/app_routes_export.dart';
import '../../domain/bloc_exports.dart';
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
            decoration: const BoxDecoration(color: AppColor.background),
            child: SizedBox(
                width: double.infinity, child: Image.asset(AppImage.logo)),
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
