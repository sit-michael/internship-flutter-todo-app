import '../entity/settings.dart';

abstract class SettingsRepository {
  Future<Settings> getSettings();
  Future<void> updateSettings(Settings settings);
}
