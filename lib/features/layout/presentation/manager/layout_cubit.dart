// ignore_for_file: deprecated_member_use
import 'layout_states.dart';
import 'package:intl/intl.dart';
import '../../../../const_data/data.dart';
import 'package:flutter/material.dart';
import '../../../../generated/l10n.dart';
import '../../data/repo/layout_repo.dart';
import '../../data/models/category_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/transaction_model.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../core/utils/dialog_services.dart';
import '../../../splash/data/models/data_model.dart';
import '../../../../core/utils/navigator_methods.dart';
import '../../../splash/data/models/balance_model.dart';
import '../../../../core/services/service_locator.dart';
import '../pages/views/add transaction/add_income_view.dart';
import '../pages/views/add transaction/add_expense_view.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  final LayoutRepo layoutRepo;
  LayoutCubit({required this.layoutRepo}) : super(LayoutInitialState()) {
    ServiceLocator.modelStream.listen((event) {
      emit(SetDataState());
    });
  }
  static LayoutCubit get(context) => BlocProvider.of(context);

  /// 1. General Variables ///
  /// 2. General Methods ///
  /// 3. Add Transaction Data ///
  /// 4. Add Transaction Methods ///
  /// 5. Edit Transaction Data ///
  /// 6. Edit Transaction Method ///
  /// 7. Delete Transaction Method ///
  /// 8. Add Category Data ///
  /// 9. Add Category Methods ///

  /// 1. General Variables ///

  DataModel get data => ServiceLocator.getDataModel();
  bool loadingCategories = true;
  bool loadingTransactions = true;

  List<CategoryModel> categories = [
    ...incomeCategoriesData,
    ...expenseCategoriesData,
  ];
  List<CategoryModel> incomeCategories = [...incomeCategoriesData];
  List<CategoryModel> expenseCategories = [...expenseCategoriesData];

  List<TransactionModel> transactions = [];
  List<TransactionModel> incomeTransactions = [];
  List<TransactionModel> expenseTransactions = [];

  /// 2. General Methods ///

  void setData() {
    setCategories();
    setTransactions();
  }

  void setCategories() {
    categories = [...categories, ...data.categories];
    for (var element in data.categories) {
      if (element.type == incomeType) {
        incomeCategories.add(element);
      } else {
        expenseCategories.add(element);
      }
    }
    loadingCategories = false;
    emit(SetState());
  }

  void setTransactions() {
    transactions = data.transactions.toList();
    transactions = transactions..sort((a, b) => b.time.compareTo(a.time));
    ServiceLocator.updateDataModel(transactions: transactions);
    incomeTransactions.clear();
    expenseTransactions.clear();

    for (var element in transactions) {
      if (element.type == incomeType) {
        incomeTransactions.add(element);
      } else {
        expenseTransactions.add(element);
      }
    }

    loadingTransactions = false;
    emit(SetState());
  }

  Widget setTransactionCardValue({
    required String type,
    required double value,
  }) {
    String valueText;
    MaterialColor color;
    if (type == incomeType) {
      valueText = "+\$$value";
      color = Colors.green;
    } else {
      valueText = "-\$$value";
      color = Colors.red;
    }
    return CustomText(
      isHead: true,
      title: valueText,
      fontColor: color,
      fontSize: 15,
    );
  }

  Widget setTransactionCardTime({required S s, required DateTime time}) {
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

    return CustomText(isHead: true, title: date, fontSize: 15);
  }

  bool isSameDay({required DateTime first, required DateTime secound}) {
    return first.year == secound.year &&
        first.month == secound.month &&
        first.day == secound.day;
  }

  /// 3. Add Transaction Data ///

  int transactionCategoryIndex = 0;
  bool loadingAddTransaction = false;
  bool addingTransactionEmpty = true;
  var transactionDate = DateTime.now();
  var addTransactionValue = TextEditingController();
  var addTransactionBrief = TextEditingController();

  /// 4. Add Transaction Methods ///

  void addTransactionValidate() {
    var value = double.tryParse(addTransactionValue.text) ?? 0;
    if (value == 0) {
      if (!addingTransactionEmpty) {
        addingTransactionEmpty = true;
        emit(SetState());
      }
    } else {
      if (addingTransactionEmpty) {
        addingTransactionEmpty = false;
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
    transactionCategoryIndex = index;
    addTransactionValidate();
    emit(SetState());
  }

  void setTransactionDate(DateTime date) {
    transactionDate = date;
    addTransactionValidate();

    emit(SetState());
  }

  void validateValue({required bool isExpense}) {
    var value = double.parse(addTransactionValue.text);
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
      addTransactionSorted(transaction);
      emit(AddDataState());
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

  TransactionModel setTransactionModel({required bool isIncome, String? id}) {
    final category =
        isIncome
            ? incomeCategories[transactionCategoryIndex]
            : expenseCategories[transactionCategoryIndex];

    return TransactionModel(
      id: id ?? transactions.length.toString(),
      userId: data.profile.id,
      type: isIncome ? incomeType : expenseType,
      value: double.parse(addTransactionValue.text),
      category: category,
      time: transactionDate,
      notes: addTransactionBrief.text,
    );
  }

  void addTransactionSorted(TransactionModel newTransaction) {
    int index = transactions.indexWhere(
      (t) => newTransaction.time.isAfter(t.time),
    );
    if (index == -1) {
      transactions.add(newTransaction);
    } else {
      transactions.insert(index, newTransaction);
    }
    if (newTransaction.type == incomeType) {
      incomeTransactions.insert(
        incomeTransactions
            .indexWhere((t) => newTransaction.time.isAfter(t.time))
            .clamp(0, incomeTransactions.length),
        newTransaction,
      );
    } else {
      expenseTransactions.insert(
        expenseTransactions
            .indexWhere((t) => newTransaction.time.isAfter(t.time))
            .clamp(0, expenseTransactions.length),
        newTransaction,
      );
    }
  }

  void clearTransactionData() {
    transactionCategoryIndex = 0;
    transactionDate = DateTime.now();
    addTransactionValue.clear();
    addTransactionBrief.clear();
    emit(SetState());
  }

  /// 5. Edit Transaction Data ///
  bool editingIncome = true;
  late TransactionModel oldEditingTransactionModel;

  /// 6. Edit Transaction Method ///

  void setEditViewData({
    required BuildContext context,
    required TransactionModel transaction,
  }) {
    loadingAddTransaction = false;
    addingTransactionEmpty = true;
    oldEditingTransactionModel = transaction;
    editingIncome = transaction.category.type == incomeType;
    var index = setEditTransactionCategoryIndex(category: transaction.category);
    transactionCategoryIndex = index;
    transactionDate = transaction.time;
    addTransactionValue = doubleToController(transaction.value);
    addTransactionBrief = TextEditingController(text: transaction.notes);
    if (editingIncome) {
      NavTo.push(context: context, nextPage: AddIncomeView(isEditing: true));
    } else {
      NavTo.push(context: context, nextPage: AddExpenseView(isEditing: true));
    }
  }

  int setEditTransactionCategoryIndex({required CategoryModel category}) {
    var index = 0;
    if (editingIncome) {
      index = incomeCategories.indexWhere(
        (element) => element.id == category.id,
      );
    } else {
      index = expenseCategories.indexWhere(
        (element) => element.id == category.id,
      );
    }
    return index;
  }

  TextEditingController doubleToController(double value) {
    final text =
        value % 1 == 0 ? value.toInt().toString() : value.toStringAsFixed(2);

    return TextEditingController(text: text);
  }

  void editTransactons() async {
    emit((LayoutLoading()));
    String oldId = oldEditingTransactionModel.id;
    setEditingTransactions(oldId: oldId);
    var newTransaction = setTransactionModel(
      isIncome: editingIncome,
      id: oldId,
    );
    var data = await layoutRepo.updateTransactions(
      balance: setNewEditingBalanceModel(),
      transactions: [...transactions, newTransaction],
    );
    data.fold(
      (l) {
        emit(LayoutFailure(l.errMessage));
      },
      (r) {
        ServiceLocator.updateDataModel(
          profile: r.profile,
          transactions: r.transactions,
        );
        addTransactionSorted(newTransaction);
        emit(EditSuccesState());
        if (filterOpening) {
          applyFilter(isSorting: true);
        }
        if (searchOpening) {
          search();
        }
      },
    );
  }

  void setEditingTransactions({required String oldId}) {
    transactions.removeWhere((element) => element.id == oldId);
    if (editingIncome) {
      incomeTransactions.removeWhere((element) => element.id == oldId);
    } else {
      expenseTransactions.removeWhere((element) => element.id == oldId);
    }
  }

  BalanceModel setNewEditingBalanceModel() {
    var balanceData = data.profile.balance;
    var value = double.parse(addTransactionValue.text);
    if (oldEditingTransactionModel.type == incomeType) {
      balanceData = balanceData.copyWith(
        income: (balanceData.income - oldEditingTransactionModel.value) + value,
      );
    } else {
      balanceData = balanceData.copyWith(
        expense:
            (balanceData.expense - oldEditingTransactionModel.value) + value,
      );
    }
    var newBalance = BalanceModel.setData(
      income: balanceData.income,
      expense: balanceData.expense,
    );
    return newBalance;
  }

  /// 7. Delete Transaction Method ///

  void deleteTransaction(TransactionModel transaction) async {
    emit((LayoutLoading()));
    transactions.removeWhere((t) => t.id == transaction.id);
    var data = await layoutRepo.updateTransactions(
      balance: setNewDeletingBalanceModel(transaction: transaction),
      transactions: transactions,
    );
    data.fold((l) => emit(LayoutFailure(l.errMessage)), (r) {
      ServiceLocator.updateDataModel(
        profile: r.profile,
        transactions: r.transactions,
      );
      transactions = r.transactions;
      setNewDeletingTransactions(transaction: transaction);
      emit(DeleteSuccessState());
    });
  }

  BalanceModel setNewDeletingBalanceModel({
    required TransactionModel transaction,
  }) {
    var balanceData = data.profile.balance;
    var value = transaction.value;
    if (transaction.type == incomeType) {
      balanceData = balanceData.copyWith(income: (balanceData.income - value));
    } else {
      balanceData = balanceData.copyWith(
        expense: (balanceData.expense - value),
      );
    }
    var newBalance = BalanceModel.setData(
      income: balanceData.income,
      expense: balanceData.expense,
    );
    return newBalance;
  }

  void setNewDeletingTransactions({required TransactionModel transaction}) {
    if (transaction.type == incomeType) {
      incomeTransactions.removeWhere((t) => t.id == transaction.id);
    } else {
      expenseTransactions.removeWhere((t) => t.id == transaction.id);
    }
    if (filterOpening) {
      filterTransactions.removeWhere((t) => t.id == transaction.id);
    }
    if (searchOpening) {
      searchTransactions.removeWhere((t) => t.id == transaction.id);
    }
  }

  /// 8. Add Category Data ///

  IconData? categoryIcon;
  String? categoryIconHint;
  bool loadingAddCategory = false;
  bool addingCategoryEmpty = false;
  int categoryColor = Colors.blue.value;
  var categoryTitle = TextEditingController();

  /// 9. Add Category Methods ///

  void addCategoryValidateFunc() {
    var title = categoryTitle.text;
    if (title.isEmpty || categoryIcon == null) {
      if (!addingCategoryEmpty) {
        addingCategoryEmpty = true;
        emit(SetState());
      }
    } else {
      if (addingCategoryEmpty) {
        addingCategoryEmpty = false;
        emit(SetState());
      }
    }
  }

  void changeCategoryIcon(IconData icon, String hint) {
    categoryIcon = icon;
    categoryIconHint = hint;
    addCategoryValidateFunc();
    emit(SetState());
  }

  void changeCategoryColor(int color) {
    categoryColor = color;
    addCategoryValidateFunc();
    emit(SetState());
  }

  void addCategory({required bool isIncome}) async {
    emit(LayoutLoading());
    var categoriesData = setCategoryModel(isIncome: isIncome);
    var data = await layoutRepo.updateCategories(categories: categoriesData);
    data.fold((l) => emit(LayoutFailure(l.errMessage)), (r) {
      ServiceLocator.updateDataModel(categories: r.categories);
      categories.add(r.categories.last);
      var index = 0;
      if (isIncome) {
        index = incomeCategories.length;
        incomeCategories.add(r.categories.last);
      } else {
        index = expenseCategories.length;
        expenseCategories.add(r.categories.last);
      }
      emit(AddCategorySuccesState(index: index));
    });
  }

  List<CategoryModel> setCategoryModel({required bool isIncome}) {
    String type = isIncome ? incomeType : expenseType;
    var category = CategoryModel.newCategory(
      icon: categoryIcon!,
      title: List.generate(2, (index) => categoryTitle.text),
      type: type,
      color: categoryColor,
      userId: data.profile.id,
    );
    return [...data.categories, category];
  }

  void clearAddCategoryData() {
    categoryTitle.clear();
    categoryIcon = null;
    categoryIconHint = null;
    addingCategoryEmpty = true;
    categoryColor = Colors.blue.value;
    emit(SetState());
  }

  /// 10. Search Data ///

  bool searchOpening = false;
  var searchController = TextEditingController();
  List<TransactionModel> searchTransactions = [];

  /// 11. Search Methods ///

  void searchChange({required String value}) {
    if (value.isEmpty) {
      if (searchOpening) {
        searchOpening = false;
        emit(SetState());
      }
    } else {
      if (!searchOpening) {
        searchOpening = true;
        emit(SetState());
      }
    }
  }

  void search() {
    String value = searchController.text.trim();
    searchChange(value: value);
    searchTransactions.clear();
    var ttransactions = filterOpening ? filterTransactions : transactions;
    for (var transaction in ttransactions) {
      if (transaction.category.title.any(
            (element) =>
                element.toLowerCase().trim().contains(value.toLowerCase()),
          ) ||
          transaction.notes.toLowerCase().trim().contains(
            value.toLowerCase(),
          )) {
        searchTransactions.add(transaction);
      }
    }
    emit(SetState());
  }

  void clearSearch() {
    searchOpening = false;
    searchController.clear();
    emit(SetState());
  }

  // 12. Filter Data

  bool filterOpening = false;
  int filterCategory = 0;

  DateTime generalStartFilterDate = DateTime.now();
  DateTime generalEndFilterDate = DateTime.now();

  DateTime startFilterDate = DateTime.now();
  DateTime endFilterDate = DateTime.now();
  List<TransactionModel> filterTransactions = [];

  // 13.Filter Methods

  void setFilterView() {
    filterCategory = 0;
    filterOpening = false;
    searchOpening = false;
    searchController.clear();
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

  void setFilterCategory({required int index}) {
    filterCategory = index;
    emit(SetState());
  }

  void setFilterDate({required int index, required DateTime date}) {
    if (index == 0) {
      startFilterDate = date;
    } else {
      endFilterDate = date;
    }
    emit(SetState());
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

  void applyFilter({bool isSorting = true}) {
    filterOpening = true;
    switch (filterCategory) {
      case 0:
        filterTransactions = transactions;
        break;
      case 1:
        filterTransactions = incomeTransactions;
        break;
      case 2:
        filterTransactions = expenseTransactions;
        break;
      default:
        filterTransactions = transactions;
    }
    filterTransactions =
        filterTransactions.where((element) {
          final date = element.time;

          final afterStart =
              isSameDay(first: date, secound: startFilterDate) ||
              date.isAfter(startFilterDate);

          final beforeEnd =
              isSameDay(first: date, secound: endFilterDate) ||
              date.isBefore(endFilterDate);

          return afterStart && beforeEnd;
        }).toList();
    if (!isSorting) {
      filterTransactions.sort((a, b) => b.time.compareTo(a.time));
    }
    emit(SetState());
  }

  void clearFilter() {
    setFilterView();
    filterOpening = false;
    filterCategory = 0;
    emit(SetState());
  }

  // 14. Start Current Balance Transaction Methods ///

  void showMonthlyRepeatTransactionsDialog({
    required BuildContext context,
    required Widget dialog,
  }) {
    if (data.isFirstOpen) {
      addTransactionBrief.clear();
      List<String> notes = ["Starting Current Balance", "الرصيد الابتدائي"];
      addTransactionBrief.text = notes[data.preferences.langI];
      DialogServices.showCleanDialog(context: context, child: dialog);
    }
    updateFirstOpenState();
  }

  void updateFirstOpenState() {
    if (!data.isFirstOpen) return;
    ServiceLocator.updateDataModel(isFirstOpen: false);
    layoutRepo.updateFirstOpen(isFirstOpen: false);
  }
}
