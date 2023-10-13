import 'dart:async';

import 'package:equatable/equatable.dart';
import '../entity/settings.dart';
import '../repository/settings_repository.dart';

import '../../bloc_exports.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final SettingsRepository _repo;
  SettingsBloc(this._repo)
      : super(SettingsState(settings: Settings(isDarkMode: false))) {
    on<SwitchToDarkMode>(_onSwichtToDarkMode);
    on<SwitchToLightMode>(_onSwitchToLightMode);
    _init();
  }

  void _init() async {
    final settings = await _repo.getSettings();

    // ignore: invalid_use_of_visible_for_testing_member
    emit(SettingsState(settings: settings));
  }

  FutureOr<void> _onSwichtToDarkMode(
      SwitchToDarkMode event, Emitter<SettingsState> emit) async {
    final newSettings = state.settings.copyWith(isDarkMode: true);
    await _repo.updateSettings(newSettings);
    emit(SettingsState(settings: newSettings));
  }

  FutureOr<void> _onSwitchToLightMode(
      SwitchToLightMode event, Emitter<SettingsState> emit) async {
    final newSettings = state.settings.copyWith(isDarkMode: false);
    await _repo.updateSettings(newSettings);
    emit(SettingsState(settings: newSettings));
  }
}
