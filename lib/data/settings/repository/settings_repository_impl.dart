import '../data_source/local_settings_data_source.dart';
import '../../../domain/settings/entity/settings.dart';

import '../../../domain/settings/repository/settings_repository.dart';
import '../model/settings_model.dart';

class SettingsRepositoryImpl extends SettingsRepository {
  final LocalSettingsDataSource _local;

  SettingsRepositoryImpl(this._local);

  @override
  Future<Settings> getSettings() async =>
      (await _local.getSettings()).toDomain();

  @override
  Future<void> updateSettings(Settings settings) =>
      _local.updateSettings(SettingsModel.fromDomain(settings));
}
