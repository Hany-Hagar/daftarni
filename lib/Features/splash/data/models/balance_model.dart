import 'package:hive/hive.dart';

part 'balance_model.g.dart';

@HiveType(typeId: 3)
class BalanceModel {
  @HiveField(0)
  final double income;

  @HiveField(1)
  final double expense;

  @HiveField(2)
  final double progress;

  @HiveField(3)
  final double currentBalance;

  BalanceModel({
    this.income = 0.0,
    this.expense = 0.0,
    this.progress = 0.0,
    this.currentBalance = 0.0,
  });

  factory BalanceModel.defaultBalance() {
    return BalanceModel(
      income: 0.0,
      expense: 0.0,
      progress: 0.0,
      currentBalance: 0.0,
    );
  }

  factory BalanceModel.setData({
    required double income,
    required double expense,
  }) {
    return BalanceModel(
      income: income,
      expense: expense,
      progress: income == 0 ? 0.0 : expense / income,
      currentBalance: income - expense,
    );
  }

  BalanceModel copyWith({
    double? income,
    double? expense,
    double? progress,
    double? currentBalance,
  }) {
    return BalanceModel(
      income: income ?? this.income,
      expense: expense ?? this.expense,
      progress: progress ?? this.progress,
      currentBalance: currentBalance ?? this.currentBalance,
    );
  }
}
