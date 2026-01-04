import 'layout_repo.dart';
import 'package:dartz/dartz.dart';
import '../models/category_model.dart';
import '../models/transaction_model.dart';
import '../../../../core/failures/failure.dart';
import '../../../splash/data/models/data_model.dart';
import '../../../../core/services/hive_services.dart';
import '../../../splash/data/models/balance_model.dart';

class LayoutRepoImpl extends LayoutRepo {
  final HiveServices hiveServices;
  LayoutRepoImpl({required this.hiveServices});
  @override
  Future<Either<Failure, DataModel>> updateTransactions({
    required BalanceModel balance,
    required List<TransactionModel> transactions,
  }) async {
    return hiveServices.updateTransactions(
      balance: balance,
      transactions: transactions,
    );
  }

  @override
  Future<Either<Failure, DataModel>> updateCategories({
    required List<CategoryModel> categories,
  }) async {
    return hiveServices.updateCategories(categories: categories);
  }

  @override
  Future<Either<Failure, DataModel>> updateFirstOpen({
    required bool isFirstOpen,
  }) async {
    return hiveServices.updateFirstOpen(isFirstOpen: isFirstOpen);
  }
}
