// ignore_for_file: public_member_api_docs, sort_constructors_first
class Settings {
  final bool isDarkMode;

  Settings({required this.isDarkMode});

  Settings copyWith({
    bool? isDarkMode,
  }) {
    return Settings(
      isDarkMode: isDarkMode ?? this.isDarkMode,
    );
  }
}
