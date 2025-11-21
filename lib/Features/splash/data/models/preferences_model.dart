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

  PreferencesModel copyWith({
    String? themeMode,
    String? languageCode,
    int? themeI,
    int? langI,
  }) {
    return PreferencesModel(
      themeMode: themeMode ?? this.themeMode,
      languageCode: languageCode ?? this.languageCode,
      themeI: themeI ?? this.themeI,
      langI: langI ?? this.langI,
    );
  }
}
