import 'package:dartz/dartz.dart';
import '../../../../core/failures/failure.dart';
import '../../../splash/data/models/data_model.dart';

abstract class ConfigurationRepo {
  Either<Failure, DataModel> changeThemeMode({
    required int themeI,
    required String themeMode,
  });

  Either<Failure, DataModel> changeLanguageCode({
    required int langI,
    required String languageCode,
  });

  Either<Failure, DataModel> configureInfo({required DataModel data});
}
