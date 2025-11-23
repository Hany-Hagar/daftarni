import 'package:dartz/dartz.dart';
import '../../../../core/failures/failure.dart';
import '../../../splash/data/models/data_model.dart';

abstract class SettingsRepo {
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
