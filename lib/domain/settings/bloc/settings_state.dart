// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  final Settings settings;
  const SettingsState({required this.settings});

  @override
  List<Object> get props => [settings];

  SettingsState copyWith({
    Settings? settings,
  }) {
    return SettingsState(
      settings: settings ?? this.settings,
    );
  }
}
