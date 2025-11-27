import 'layout_states.dart';
import 'package:intl/intl.dart';
import '../../../../const/data.dart';
import 'package:flutter/material.dart';
import '../../data/repo/layout_repo.dart';
import '../../data/models/category_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/transaction_model.dart';
import '../../../splash/data/models/data_model.dart';
import '../../../splash/data/models/balance_model.dart';
import '../../../../core/services/service_locator.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  final LayoutRepo layoutRepo;
  LayoutCubit({required this.layoutRepo}) : super(LayoutInitialState()) {
    ServiceLocator.modelStream.listen((event) {
      emit(SetDataState());
    });
  }
  static LayoutCubit get(context) => BlocProvider.of(context);

  // General Data
  DataModel get data => ServiceLocator.getDataModel();

  bool isLoadingCategory = true;
  bool isLoadingTransaction = true;

  // Category Data
  List<CategoryModel> categories = [
    ...incomeCategoriesData,
    ...expenseCategoriesData,
  ];
  List<CategoryModel> incomeCategories = [...incomeCategoriesData];
  List<CategoryModel> expenseCategories = [...expenseCategoriesData];

  // Transaction Data
  List<TransactionModel> transactions = [];
  List<TransactionModel> incomeTransactions = [];
  List<TransactionModel> expenseTransactions = [];

  // General Methods
  void setData() {
    setCategories();
    setTransactions();
  }

  void setCategories() {
    for (var element in data.categories) {
      categories.add(element);
      if (element.type == incomeType) {
        incomeCategories.add(element);
      } else {
        expenseCategories.add(element);
      }
    }
    isLoadingCategory = false;
    emit(SetState());
  }

  void setTransactions() {
    transactions = data.transactions;
    for (var element in data.transactions) {
      if (element.type == incomeType) {
        incomeTransactions.add(element);
      } else {
        expenseTransactions.add(element);
      }
    }
    isLoadingTransaction = false;
    emit(SetState());
  }
  //// Add Transaction Data ////

  bool emptyAddData = true;
  int transactionCategory = 0;
  var transactionDate = DateTime.now();
  var transactionValue = TextEditingController();
  var transactionBrief = TextEditingController();

  //// Transaction Methods ////

  void addValidate() {
    var value = double.tryParse(transactionValue.text) ?? 0;
    if (value == 0) {
      if (!emptyAddData) {
        emptyAddData = true;
        emit(SetState());
      }
    } else {
      if (emptyAddData) {
        emptyAddData = false;
        emit(SetState());
      }
    }
  }

  String formatDate() {
    return DateFormat('EEEE , MMM d').format(transactionDate);
  }

  DateTime setFirstData() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, 1);
  }

  void setTransactionCategory(int index) {
    transactionCategory = index;
    emit(SetState());
  }

  void setTransactionDate(DateTime date) {
    transactionDate = date;
    emit(SetState());
  }

  void validateValue({required bool isExpense}) {
    var value = double.parse(transactionValue.text);
    if (isExpense && value > data.profile.balance.currentBalance) {
      emit(LowValueState());
      return;
    } else {
      addTransaction(isIncome: !isExpense, value: value);
    }
  }

  void addTransaction({required bool isIncome, required double value}) async {
    emit((LayoutLoading()));
    var transaction = setTransactionModel(isIncome: isIncome);
    var data = await layoutRepo.updateTransactions(
      balance: setBalanceModel(isIncome: isIncome, value: value),
      transactions: [...transactions, transaction],
    );
    data.fold((l) => emit(LayoutFailure(l.errMessage)), (r) {
      ServiceLocator.updateDataModel(
        profile: r.profile,
        transactions: r.transactions,
      );
      incomeTransactions.add(transaction);
      emit(LayoutSuccess());
    });
  }

  BalanceModel setBalanceModel({
    required bool isIncome,
    required double value,
  }) {
    var income = data.profile.balance.income;
    var expense = data.profile.balance.expense;
    isIncome ? income += value : expense += value;
    return BalanceModel.setData(income: income, expense: expense);
  }

  TransactionModel setTransactionModel({required bool isIncome}) {
    final category =
        isIncome
            ? incomeCategories[transactionCategory]
            : expenseCategories[transactionCategory];

    return TransactionModel.withoutId(
      userId: data.profile.id,
      type: isIncome ? incomeType : expenseType,
      value: double.parse(transactionValue.text),
      category: category,
      time: transactionDate,
      notes: transactionBrief.text,
    );
  }

  void clearTransactionData() {
    transactionCategory = 1;
    transactionDate = DateTime.now();
    transactionValue.clear();
    transactionBrief.clear();
    emit(SetState());
  }

  /// Search Data ///
  String filterText = "";
  bool searchingOpen = false;
  bool filteringOpen = false;
  int filterCategoryType = 0;
  var searchText = TextEditingController();
  List<CategoryModel> searchCategories = [];
  List<CategoryModel> filterCategories = [];

  /// Categories Methods ///
  ///

  void serachCategoriesData() {
    searchState();
    searchCategories.clear();
    var langId = data.preferences.langI;
    var value = searchText.text.toLowerCase();
    var categoriesData = filteringOpen ? filterCategories : categories;
    searchCategories =
        categoriesData
            .where(
              (element) => element.title[langId].toLowerCase().contains(value),
            )
            .toList();
    emit(SetState());
  }

  void searchState() {
    var value = searchText.text;
    if (value.isEmpty) {
      if (searchingOpen) {
        searchingOpen = false;
        emit(SetState());
      }
    } else {
      if (!searchingOpen) {
        searchingOpen = true;
        emit(SetState());
      }
    }
  }

  void clearSearchData() {
    searchText.clear();
    searchCategories.clear();
    searchingOpen = false;
    emit(SetState());
  }

  /// Filter Methods ///
  void changeFilterType(int type) {
    filterCategoryType = type;
    emit(SetState());
  }

  void filterCategoriesFunc() {
    filteringOpen = true;
    filterCategories.clear();
    switch (filterCategoryType) {
      case 0:
        filterCategories = [...categories];
        break;
      case 1:
        filterCategories = [...incomeCategories];
        break;
      case 2:
        filterCategories = [...expenseCategories];
        break;
      default:
    }
    emit(FilterState());
  }

  void clearFilterData() {
    filterText = "";
    filteringOpen = false;
    filterCategoryType = 0;
    filterCategories.clear();
    emit(SetState());
  }
}
