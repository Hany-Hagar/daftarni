import '../../../layout/data/models/category_model.dart';
import '../../../layout/data/models/transaction_model.dart';

class AnalysisCategoryModel {
  final double totalValue;
  final CategoryModel category;
  final List<TransactionModel> transactions;

  AnalysisCategoryModel({
    required this.totalValue,
    required this.category,
    required this.transactions,
  });

  AnalysisCategoryModel copyWith({
    double? totalValue,
    CategoryModel? category,
    List<TransactionModel>? transactions,
  }) {
    return AnalysisCategoryModel(
      totalValue: totalValue ?? this.totalValue,
      category: category ?? this.category,
      transactions: transactions ?? this.transactions,
    );
  }

  AnalysisCategoryModel addTransaction({
    required TransactionModel transaction,
  }) {
    var newTotal = totalValue + transaction.value;
    List<TransactionModel> newTransactions = [...transactions, transaction];
    return AnalysisCategoryModel(
      category: category,
      totalValue: newTotal,
      transactions: newTransactions,
    );
  }
}
