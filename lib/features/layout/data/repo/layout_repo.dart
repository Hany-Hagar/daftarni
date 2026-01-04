import 'package:dartz/dartz.dart';
import '../models/category_model.dart';
import '../models/transaction_model.dart';
import '../../../../core/failures/failure.dart';
import '../../../splash/data/models/data_model.dart';
import '../../../splash/data/models/balance_model.dart';

abstract class LayoutRepo {
  Future<Either<Failure, DataModel>> updateFirstOpen({
    required bool isFirstOpen,
  });

  Future<Either<Failure, DataModel>> updateTransactions({
    required BalanceModel balance,
    required List<TransactionModel> transactions,
  });
  Future<Either<Failure, DataModel>> updateCategories({
    required List<CategoryModel> categories,
  });
}
