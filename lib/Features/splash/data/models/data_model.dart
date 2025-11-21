import 'profile_model.dart';
import 'preferences_model.dart';
import 'package:hive/hive.dart';

part 'data_model.g.dart';

@HiveType(typeId: 1)
class DataModel extends HiveObject {
  @HiveField(0)
  final PreferencesModel preferences;

  @HiveField(1)
  final ProfileModel profile;

  @HiveField(2)
  final bool isFirstOpen;

  @HiveField(3)
  final bool isLoggedIn;

  DataModel({
    required this.preferences,
    required this.profile,
    required this.isFirstOpen,
    required this.isLoggedIn,
  });

  factory DataModel.defaultData() {
    return DataModel(
      preferences: PreferencesModel.defaultData(),
      profile: ProfileModel.defaultProfile(),
      isFirstOpen: true,
      isLoggedIn: false,
    );
  }

  DataModel copyWith({
    PreferencesModel? preferences,
    ProfileModel? profile,
    bool? isFirstOpen,
    bool? isLoggedIn,
  }) {
    return DataModel(
      preferences: preferences ?? this.preferences,
      profile: profile ?? this.profile,
      isFirstOpen: isFirstOpen ?? this.isFirstOpen,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
    );
  }
}
