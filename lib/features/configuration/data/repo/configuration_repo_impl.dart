import 'configuration_repo.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/failures/failure.dart';
import '../../../splash/data/models/data_model.dart';
import '../../../../core/services/hive_services.dart';

class ConfigurationRepoImpl implements ConfigurationRepo {
  final HiveServices hiveServices;
  ConfigurationRepoImpl({required this.hiveServices});

  @override
  Either<Failure, DataModel> changeLanguageCode({
    required int langI,
    required String languageCode,
  }) {
    var data = hiveServices.changeLanguage(
      language: languageCode,
      langI: langI,
    );
    return data;
  }

  @override
  Either<Failure, DataModel> changeThemeMode({
    required int themeI,
    required String themeMode,
  }) {
    var data = hiveServices.changeTheme(theme: themeMode, themeI: themeI);
    return data;
  }

  @override
  Either<Failure, DataModel> configureInfo({required DataModel data}) {
    var nData = hiveServices.addData(data);
    return nData;
  }
}
