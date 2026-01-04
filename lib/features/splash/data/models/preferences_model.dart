import 'package:daftarni/const_data/data.dart';
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

  @HiveField(4)
  final bool enableNotifications;

  PreferencesModel({
    required this.themeMode,
    required this.languageCode,
    required this.themeI,
    required this.langI,
    required this.enableNotifications,
  });

  factory PreferencesModel.defaultData() {
    return PreferencesModel(
      enableNotifications: true,
      themeMode: darkTheme,
      languageCode: arCode,
      themeI: 1,
      langI: 1,
    );
  }

  PreferencesModel copyWith({
    String? themeMode,
    String? languageCode,
    int? themeI,
    int? langI,
    bool? enableNotifications,
  }) {
    return PreferencesModel(
      themeMode: themeMode ?? this.themeMode,
      languageCode: languageCode ?? this.languageCode,
      themeI: themeI ?? this.themeI,
      langI: langI ?? this.langI,
      enableNotifications: enableNotifications ?? this.enableNotifications,
    );
  }
}
