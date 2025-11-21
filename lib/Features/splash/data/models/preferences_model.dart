import 'package:daftarni/Const/data.dart';
import 'package:hive/hive.dart';

part 'preferences_model.g.dart';

@HiveType(typeId: 0)
class PreferencesModel extends HiveObject {
  @HiveField(0)
  final String themeMode;

  @HiveField(1)
  final String languageCode;

  @HiveField(2)
  final int themeI;

  @HiveField(3)
  final int langI;

  PreferencesModel({
    required this.themeMode,
    required this.languageCode,
    required this.themeI,
    required this.langI,
  });

  factory PreferencesModel.defaultData() {
    return PreferencesModel(
      themeMode: lightTheme,
      languageCode: enCode,
      themeI: 0,
      langI: 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'ThemeModeIndex': themeMode,
      'LanguageCode': languageCode,
      'ThemeModeIndexI': themeI,
      'LanguageIndexI': langI,
    };
  }

  factory PreferencesModel.fromMap(Map<String, dynamic> map) {
    return PreferencesModel(
      themeMode: map['ThemeModeIndex'] ?? lightTheme,
      languageCode: map['LanguageCode'] ?? enCode,
      themeI: map['ThemeModeIndexI'] ?? 0,
      langI: map['LanguageIndexI'] ?? 0,
    );
  }
}
