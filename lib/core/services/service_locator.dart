import 'dart:async';
import 'hive_services.dart';
import 'package:get_it/get_it.dart';
import '../../features/splash/data/models/data_model.dart';
import '../../features/splash/data/models/profile_model.dart';
import '../../features/layout/data/models/category_model.dart';
import '../../features/splash/data/models/preferences_model.dart';
import '../../features/layout/data/models/transaction_model.dart';

class ServiceLocator {
  static final sl = GetIt.instance;

  static final _controller = StreamController<DataModel>.broadcast();

  static Future<void> init() async {
    sl.registerLazySingleton<DataModel>(() => DataModel.defaultData());
    sl.registerLazySingleton<HiveServices>(() => HiveServices());
  }

  static DataModel getDataModel() => sl<DataModel>();
  static HiveServices getHiveServices() => sl<HiveServices>();

  static Stream<DataModel> modelStream = _controller.stream;

  static void setDataModel(DataModel dataModel) {
    if (sl.isRegistered<DataModel>()) {
      sl.unregister<DataModel>();
    }

    sl.registerSingleton<DataModel>(dataModel);

    _controller.add(dataModel);
  }

  static void updateDataModel({
    PreferencesModel? preferences,
    ProfileModel? profile,
    List<CategoryModel>? categories,
    List<TransactionModel>? transactions,
    bool? isFirstOpen,
  }) {
    final oldModel = sl<DataModel>();

    final newModel = oldModel.copyWith(
      preferences: preferences,
      profile: profile,
      categories: categories,
      transactions: transactions,
      isFirstOpen: isFirstOpen,
    );

    if (sl.isRegistered<DataModel>()) {
      sl.unregister<DataModel>();
    }

    sl.registerSingleton<DataModel>(newModel);

    _controller.add(newModel);
  }
}
