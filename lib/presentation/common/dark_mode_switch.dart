import 'package:flutter/material.dart';

import '../../domain/bloc_exports.dart';

class DarkModeSwitch extends StatelessWidget {
  const DarkModeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.light_mode),
        BlocBuilder<SettingsBloc, SettingsState>(builder: (context, state) {
          return Switch(
            value: state.settings.isDarkMode,
            onChanged: (newValue) {
              final blocSink = context.read<SettingsBloc>().add;
              if (newValue) {
                blocSink(SwitchToDarkMode());
              } else {
                blocSink(SwitchToLightMode());
              }
            },
          );
        }),
        const Icon(Icons.dark_mode),
      ],
    );
  }
}
