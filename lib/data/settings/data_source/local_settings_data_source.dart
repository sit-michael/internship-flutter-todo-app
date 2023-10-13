import '../model/settings_model.dart';

abstract class LocalSettingsDataSource{
  Future<SettingsModel> getSettings();
  Future<void> updateSettings(SettingsModel settings);
}