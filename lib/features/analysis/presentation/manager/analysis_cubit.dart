import 'dart:typed_data';
import 'analysis_states.dart';
import 'package:intl/intl.dart';
import '../../../../const_data/data.dart';
import '../../../../generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/services/pdf_services.dart';
import '../../../../core/services/service_locator.dart';
import '../../data/models/analysis_category_model.dart';
import '../views/widgets/report/download_report_body.dart';
import '../../../layout/data/models/transaction_model.dart';

class AnalysisCubit extends Cubit<AnalysisStates> {
  AnalysisCubit() : super(AnalysisInitialState());
  static AnalysisCubit get(context) => BlocProvider.of<AnalysisCubit>(context);

  // General Data

  double totalIncome = 0;
  double totalExpense = 0;

  List<AnalysisCategoryModel> analysisIncomes = [];
  List<AnalysisCategoryModel> analysisExpenses = [];

  // General Methods

  bool _isSameDay({required DateTime first, required DateTime secound}) {
    return first.year == secound.year &&
        first.month == secound.month &&
        first.day == secound.day;
  }

  List<AnalysisCategoryModel> _convertTransactionsToAnalysisData({
    required bool isIncome,
    required List<TransactionModel> transactions,
  }) {
    final List<AnalysisCategoryModel> result = [];
    for (final transaction in transactions) {
      final index = result.indexWhere(
        (e) => e.category.id == transaction.category.id,
      );
      if (index == -1) {
        result.add(
          AnalysisCategoryModel(
            category: transaction.category,
            totalValue: transaction.value,
            transactions: [transaction],
          ),
        );
      } else {
        var existingModel = result[index];
        result[index] = result[index].copyWith(
          totalValue: existingModel.totalValue + transaction.value,
          transactions: [...existingModel.transactions, transaction],
        );
      }
      if (isIncome) {
        totalIncome += transaction.value;
      } else {
        totalExpense += transaction.value;
      }
    }
    return result;
  }

  // Monthly Report Data

  DateTime startReportDate = DateTime.now();
  DateTime endReportDate = DateTime.now();

  // Monthly Report

  List<TransactionModel> _setMonthlyTransactions() {
    var now = DateTime.now();
    var start = DateTime(now.year, now.month, 1);
    var transactions = ServiceLocator.getDataModel().transactions;
    if (transactions.isNotEmpty) {
      startReportDate = transactions.last.time;
      endReportDate = transactions.first.time;
    }
    return transactions.where((element) {
      final date = element.time;
      final afterStart =
          _isSameDay(first: date, secound: start) || date.isAfter(start);

      final beforeEnd =
          _isSameDay(first: date, secound: now) || date.isBefore(now);

      return afterStart && beforeEnd;
    }).toList();
  }

  void _setMonthlyReportData() {
    totalIncome = 0;
    totalExpense = 0;
    analysisIncomes.clear();
    analysisExpenses.clear();
    var data = _setMonthlyTransactions();
    var incomes = data.where((element) => element.type == incomeType).toList();
    var expenses =
        data.where((element) => element.type == expenseType).toList();
    analysisIncomes = _convertTransactionsToAnalysisData(
      isIncome: true,
      transactions: incomes,
    );
    analysisExpenses = _convertTransactionsToAnalysisData(
      isIncome: false,
      transactions: expenses,
    );
  }

  String _setMonthlyReportTitle() {
    var month = DateFormat('MMM  yyyy').format(DateTime.now());
    return "${S.current.monthlyReportTitle} $month";
  }

  Future<Uint8List> downloadMonthlyReport() async {
    try {
      _setMonthlyReportData();
      return await PdfServices.generatePdf(
        page: DownloadReportBody(
          font: PdfServices.font,
          incomeTotal: totalIncome,
          expenseTotal: totalExpense,
          title: _setMonthlyReportTitle(),
          incomeTransactions: analysisIncomes,
          expenseTransactions: analysisExpenses,
        ),
      );
    } catch (e) {
      emit(DownloadReportError('Failed to create PDF: $e'));
      rethrow;
    }
  }

  /// Analysis View Data

  bool filterOpening = false;
  bool analysisLoading = false;

  List<TransactionModel> transactions = [];
  List<TransactionModel> filterTransactions = [];

  DateTime generalStartFilterDate = DateTime.now();
  DateTime generalEndFilterDate = DateTime.now();
  DateTime startFilterDate = DateTime.now();
  DateTime endFilterDate = DateTime.now();

  /// 2.Analysis Methods

  void setData() {
    analysisLoading = true;
    emit(AnalysisLoadingState());
    transactions = ServiceLocator.getDataModel().transactions.toList();
    _setFilterTransactions(transactions: transactions);
    _setFilterView();
    analysisLoading = false;
    emit(AnalysisSuccessState());
  }

  void _setFilterTransactions({required List<TransactionModel> transactions}) {
    totalIncome = 0;
    totalExpense = 0;
    analysisIncomes.clear();
    analysisExpenses.clear();
    var incomes =
        transactions.where((element) => element.type == incomeType).toList();
    var expenses =
        transactions.where((element) => element.type == expenseType).toList();
    filterTransactions = transactions;
    analysisIncomes = _convertTransactionsToAnalysisData(
      isIncome: true,
      transactions: incomes,
    );
    analysisExpenses = _convertTransactionsToAnalysisData(
      isIncome: false,
      transactions: expenses,
    );
  }

  void _setFilterView() {
    filterOpening = false;
    if (transactions.isEmpty) {
      startFilterDate = DateTime.now();
      endFilterDate = DateTime.now();
      generalStartFilterDate = DateTime.now();
      generalEndFilterDate = DateTime.now();
    } else {
      var data = transactions;
      endFilterDate = data.first.time;
      startFilterDate = data.last.time;
      generalEndFilterDate = data.first.time;
      generalStartFilterDate = data.last.time;
    }
  }

  String setAnalysisTransactionTime({required DateTime date}) {
    return DateFormat('kk:mm').format(date).toString();
  }

  String setFilterDateTitle({required S s, required DateTime time}) {
    String date = '';
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final messageDate = DateTime(time.year, time.month, time.day);

    if (messageDate == today) {
      date = s.today;
    } else if (messageDate == yesterday) {
      date = s.yesterday;
    } else if (messageDate == yesterday) {
    } else {
      date = DateFormat('MMM d, yyyy').format(time);
    }

    return date;
  }

  void setFilterDate({required int index, required DateTime date}) {
    if (index == 0) {
      startFilterDate = date;
    } else {
      endFilterDate = date;
    }
    emit(SetState());
  }

  void applyFilter() {
    filterOpening = true;
    filterTransactions = transactions;
    filterTransactions =
        filterTransactions.where((element) {
          final date = element.time;
          final afterStart =
              _isSameDay(first: date, secound: startFilterDate) ||
              date.isAfter(startFilterDate);

          final beforeEnd =
              _isSameDay(first: date, secound: endFilterDate) ||
              date.isBefore(endFilterDate);

          return afterStart && beforeEnd;
        }).toList();
    _setFilterTransactions(transactions: filterTransactions);
    emit(ApplyFilterSuccess());
  }

  void clearFilter() {
    filterOpening = false;
    _setFilterView();
    _setFilterTransactions(transactions: transactions);
    emit(SetState());
  }

  /// Report Generation

  String _setReportTitle() {
    final S s = S.current;
    var format = DateFormat('d MMM, yyyy');
    var start = format.format(startFilterDate);
    var end = format.format(endFilterDate);
    return "${s.analysisReportTitle} ${s.from} $start ${s.to} $end";
  }

  Future<Uint8List> downloadAnalysisReport() async {
    try {
      return await PdfServices.generatePdf(
        page: DownloadReportBody(
          font: PdfServices.font,
          incomeTotal: totalIncome,
          expenseTotal: totalExpense,
          title: _setReportTitle(),
          incomeTransactions: analysisIncomes,
          expenseTransactions: analysisExpenses,
        ),
      );
    } catch (e) {
      emit(DownloadReportError('Failed to create PDF: $e'));
      rethrow;
    }
  }
}
