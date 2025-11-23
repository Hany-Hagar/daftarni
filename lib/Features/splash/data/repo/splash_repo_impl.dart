import 'splash_repo.dart';
import 'package:dartz/dartz.dart';
import '../models/data_model.dart';
import '../../../../core/failures/failure.dart';
import '../../../../core/services/hive_services.dart';

class SplashRepoImpl implements SplashRepo {
  final HiveServices hiveServices;
  SplashRepoImpl(this.hiveServices);
  @override
  Future<Either<Failure, DataModel>> getData() async {
    var data = hiveServices.getData();
    return data;
  }
}
