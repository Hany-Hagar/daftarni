import 'package:daftarni/Const/data.dart';
import 'package:hive/hive.dart';

part 'preferences_model.g.dart';

@HiveType(typeId: 0)
class PreferencesModel extends HiveObject {
  @HiveField(0)
  final String themeMode;

  @HiveField(1)
  final String languageCode;

  PreferencesModel({required this.themeMode, required this.languageCode});

  factory PreferencesModel.defaultData() {
    return PreferencesModel(themeMode: lightTheme, languageCode: enCode);
  }

  Map<String, dynamic> toMap() {
    return {'ThemeModeIndex': themeMode, 'LanguageCode': languageCode};
  }

  factory PreferencesModel.fromMap(Map<String, dynamic> map) {
    return PreferencesModel(
      themeMode: map['ThemeModeIndex'] ?? lightTheme,
      languageCode: map['LanguageCode'] ?? enCode,
    );
  }
}
