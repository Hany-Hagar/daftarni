import '../../Const/data.dart';
import 'package:dartz/dartz.dart';
import '../Failures/failure.dart';
import '../Failures/hive_failure.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../Features/splash/data/models/data_model.dart';
import '../../Features/splash/data/models/preferences_model.dart';

class HiveServices {
  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(PreferencesModelAdapter());
    Hive.registerAdapter(DataModelAdapter());
    // Hive.registerAdapter(UserAdapter());
    // Hive.registerAdapter(BalanceAdapter());
    // Hive.registerAdapter(TransactionModelAdapter());
    // Hive.registerAdapter(CategoryModelAdapter());
    // Hive.registerAdapter(IconModelAdapter());
    // Hive.registerAdapter(PreferencesAdapter());
    await Hive.openBox<DataModel>(dataBoxName);
  }

  Either<Failure, Box<DataModel>> _getDataBox() {
    try {
      return Right(Hive.box<DataModel>(dataBoxName));
    } catch (e) {
      return Left(HiveFailure.fromException(e));
    }
  }

  Either<Failure, DataModel> getData() {
    final boxResult = _getDataBox();

    return boxResult.fold((failure) => Left(failure), (box) {
      try {
        final data = box.get(dataKey, defaultValue: DataModel.defaultData());
        return Right(data!);
      } catch (e) {
        return Left(HiveFailure.fromException(e));
      }
    });
  }

  Either<Failure, DataModel> addData(DataModel data) {
    final boxResult = _getDataBox();
    return boxResult.fold((failure) => Left(failure), (box) {
      try {
        box.put(dataKey, data);
        return Right(data);
      } catch (e) {
        return Left(HiveFailure.fromException(e));
      }
    });
  }
}
