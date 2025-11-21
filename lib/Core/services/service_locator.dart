import 'dart:async';
import 'package:daftarni/Core/services/hive_services.dart';
import 'package:get_it/get_it.dart';
import '../../Features/splash/data/models/data_model.dart';

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
    sl.unregister<DataModel>();
    sl.registerLazySingleton<DataModel>(() => dataModel);
    _controller.add(dataModel);
  }

  static void updateDataModel({String? name, int? value}) {
    final model = sl<DataModel>();
    _controller.add(model);
  }
}
