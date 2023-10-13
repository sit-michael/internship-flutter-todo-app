import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'local_settings_data_source.dart';
import '../model/settings_model.dart';

class PreferencesSettingsDataSource extends LocalSettingsDataSource {
  final SharedPreferences _preferences;

  PreferencesSettingsDataSource(this._preferences);

  final String _settingsKey = '_settingsKey';
  @override
  Future<SettingsModel> getSettings() async {
    final jsonString = _preferences.getString(_settingsKey);
    if (jsonString == null) return SettingsModel.empty();
    final json = jsonDecode(jsonString);
    return SettingsModel.fromJson(json);
  }

  @override
  Future<void> updateSettings(SettingsModel settings) async {
    final json = settings.toJson();
    final jsonString = jsonEncode(json);
    await _preferences.setString(_settingsKey, jsonString);
  }
}
