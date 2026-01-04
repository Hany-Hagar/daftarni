import 'package:dartz/dartz.dart';
import '../models/data_model.dart';
import '../../../../core/failures/failure.dart';

abstract class SplashRepo {
  Future<Either<Failure, DataModel>> getData();
}
