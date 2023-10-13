import '../../../domain/settings/entity/settings.dart';

class SettingsModel {
  final bool isDarkMode;

  SettingsModel(this.isDarkMode);

  SettingsModel.empty() : isDarkMode = false;

  SettingsModel.fromDomain(Settings domain) : isDarkMode = domain.isDarkMode;
  Settings toDomain() => Settings(isDarkMode: isDarkMode);
  Map<String, dynamic> toJson() => {'isDarkMode': isDarkMode};

  SettingsModel.fromJson(Map<String, dynamic> json)
      : isDarkMode = json['isDarkMode'];
}
