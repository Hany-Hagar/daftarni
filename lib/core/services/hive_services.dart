import '../../const_data/data.dart';
import 'package:dartz/dartz.dart';
import '../failures/failure.dart';
import '../failures/hive_failure.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../features/layout/data/models/icon_model.dart';
import '../../features/splash/data/models/data_model.dart';
import '../../features/splash/data/models/profile_model.dart';
import '../../features/splash/data/models/balance_model.dart';
import '../../features/layout/data/models/category_model.dart';
import '../../features/layout/data/models/transaction_model.dart';
import '../../features/splash/data/models/preferences_model.dart';

class HiveServices {
  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(PreferencesModelAdapter());
    Hive.registerAdapter(DataModelAdapter());
    Hive.registerAdapter(ProfileModelAdapter());
    Hive.registerAdapter(BalanceModelAdapter());
    Hive.registerAdapter(IconModelAdapter());
    Hive.registerAdapter(CategoryModelAdapter());
    Hive.registerAdapter(TransactionModelAdapter());
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

  Either<Failure, DataModel> updateProfileImage({required String imagePath}) {
    final boxResult = _getDataBox();
    return boxResult.fold((failure) => Left(failure), (box) {
      try {
        final data = box.get(dataKey, defaultValue: DataModel.defaultData());
        final uProfile = data!.profile.copyWith(imagePath: imagePath);
        final uData = data.copyWith(profile: uProfile);
        box.put(dataKey, uData);
        return Right(uData);
      } catch (e) {
        return Left(HiveFailure.fromException(e));
      }
    });
  }

  Either<Failure, DataModel> updateProfileData({
    required ProfileModel profile,
  }) {
    final boxResult = _getDataBox();
    return boxResult.fold((failure) => Left(failure), (box) {
      try {
        final data = box.get(dataKey, defaultValue: DataModel.defaultData());
        final uData = data!.copyWith(profile: profile);
        box.put(dataKey, uData);
        return Right(uData);
      } catch (e) {
        return Left(HiveFailure.fromException(e));
      }
    });
  }

  // Prefernces Functions

  Either<Failure, DataModel> changeTheme({
    required String theme,
    required int themeI,
  }) {
    final boxResult = _getDataBox();
    return boxResult.fold((failure) => Left(failure), (box) {
      try {
        final data = box.get(dataKey, defaultValue: DataModel.defaultData());
        final uPreferences = data!.preferences.copyWith(
          themeMode: theme,
          themeI: themeI,
        );
        final uData = data.copyWith(preferences: uPreferences);
        box.put(dataKey, uData);
        return Right(uData);
      } catch (e) {
        return Left(HiveFailure.fromException(e));
      }
    });
  }

  Either<Failure, DataModel> changeLanguage({
    required String language,
    required int langI,
  }) {
    final boxResult = _getDataBox();
    return boxResult.fold((failure) => Left(failure), (box) {
      try {
        final data = box.get(dataKey, defaultValue: DataModel.defaultData());
        final uPreferences = data!.preferences.copyWith(
          languageCode: language,
          langI: langI,
        );
        final uData = data.copyWith(preferences: uPreferences);
        box.put(dataKey, uData);
        return Right(uData);
      } catch (e) {
        return Left(HiveFailure.fromException(e));
      }
    });
  }

  Either<Failure, DataModel> changeNotificationsStates({
    required bool notificationsEnabled,
  }) {
    final boxResult = _getDataBox();
    return boxResult.fold((failure) => Left(failure), (box) {
      try {
        final data = box.get(dataKey, defaultValue: DataModel.defaultData());
        final uPreferences = data!.preferences.copyWith(
          enableNotifications: notificationsEnabled,
        );
        final uData = data.copyWith(preferences: uPreferences);
        box.put(dataKey, uData);
        return Right(uData);
      } catch (e) {
        return Left(HiveFailure.fromException(e));
      }
    });
  }

  // Categories Functions

  Either<Failure, DataModel> updateCategories({
    required List<CategoryModel> categories,
  }) {
    final boxResult = _getDataBox();
    return boxResult.fold((failure) => Left(failure), (box) {
      try {
        final data = box.get(dataKey, defaultValue: DataModel.defaultData());
        final uData = data!.copyWith(categories: categories);
        box.put(dataKey, uData);
        return Right(uData);
      } catch (e) {
        return Left(HiveFailure.fromException(e));
      }
    });
  }

  // Transactions Functions

  Either<Failure, DataModel> updateTransactions({
    required BalanceModel balance,
    required List<TransactionModel> transactions,
  }) {
    final boxResult = _getDataBox();
    return boxResult.fold((failure) => Left(failure), (box) {
      try {
        final data = box.get(dataKey, defaultValue: DataModel.defaultData());
        final profile = data!.profile.copyWith(balance: balance);
        final uData = data.copyWith(
          profile: profile,
          transactions: transactions,
        );
        box.put(dataKey, uData);
        return Right(uData);
      } catch (e) {
        return Left(HiveFailure.fromException(e));
      }
    });
  }

  // First Open Functions

  Either<Failure, DataModel> updateFirstOpen({required bool isFirstOpen}) {
    final boxResult = _getDataBox();
    return boxResult.fold((failure) => Left(failure), (box) {
      try {
        final data = box.get(dataKey, defaultValue: DataModel.defaultData());
        final uData = data!.copyWith(isFirstOpen: isFirstOpen);
        box.put(dataKey, uData);
        return Right(uData);
      } catch (e) {
        return Left(HiveFailure.fromException(e));
      }
    });
  }
}
