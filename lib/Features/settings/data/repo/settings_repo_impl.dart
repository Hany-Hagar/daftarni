import 'settings_repo.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/failures/failure.dart';
import '../../../splash/data/models/data_model.dart';
import '../../../../core/services/hive_services.dart';
import '../../../splash/data/models/profile_model.dart';

class SettingsRepoImpl implements SettingsRepo {
  final HiveServices hiveServices;
  SettingsRepoImpl({required this.hiveServices});

  @override
  Either<Failure, DataModel> updateProfileImage({required String imagePath}) {
    var data = hiveServices.updateProfileImage(imagePath: imagePath);
    return data;
  }

  @override
  Either<Failure, DataModel> updateProfileData({
    required ProfileModel profile,
  }) {
    var data = hiveServices.updateProfileData(profile: profile);
    return data;
  }

  // Preferences Functions
  @override
  Either<Failure, DataModel> changeLanguage({
    required String langC,
    required int langI,
  }) {
    var data = hiveServices.changeLanguage(language: langC, langI: langI);
    return data;
  }

  @override
  Either<Failure, DataModel> changeTheme({
    required String theme,
    required int themeI,
  }) {
    var data = hiveServices.changeTheme(theme: theme, themeI: themeI);
    return data;
  }

  @override
  Either<Failure, DataModel> changeNotificationsStates({
    required bool notificationsEnabled,
  }) {
    var data = hiveServices.changeNotificationsStates(
      notificationsEnabled: notificationsEnabled,
    );
    return data;
  }
}
