import 'package:dartz/dartz.dart';
import '../../../../core/failures/failure.dart';
import '../../../splash/data/models/data_model.dart';
import '../../../splash/data/models/profile_model.dart';

abstract class SettingsRepo {
  // Profile Functions
  Either<Failure, DataModel> updateProfileImage({required String imagePath});

  Either<Failure, DataModel> updateProfileData({required ProfileModel profile});
  //Preferences Functions
  Either<Failure, DataModel> changeLanguage({
    required String langC,
    required int langI,
  });
  Either<Failure, DataModel> changeTheme({
    required String theme,
    required int themeI,
  });
  Either<Failure, DataModel> changeNotificationsStates({
    required bool notificationsEnabled,
  });
}
