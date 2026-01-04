// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Pick an Icon`
  String get iconPickerTitle {
    return Intl.message(
      'Pick an Icon',
      name: 'iconPickerTitle',
      desc: 'Hint text for the icon search input field',
      args: [],
    );
  }

  /// `Search icon`
  String get searchIcon {
    return Intl.message(
      'Search icon',
      name: 'searchIcon',
      desc: 'Title of the icon picker dialog',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message(
      'Close',
      name: 'close',
      desc: 'Button text to close the dialog',
      args: [],
    );
  }

  /// `Amount`
  String get amount {
    return Intl.message(
      'Amount',
      name: 'amount',
      desc: 'Label for the amount input field',
      args: [],
    );
  }

  /// `Date`
  String get date {
    return Intl.message(
      'Date',
      name: 'date',
      desc: 'Label for date selection',
      args: [],
    );
  }

  /// `Select Date`
  String get selectDate {
    return Intl.message(
      'Select Date',
      name: 'selectDate',
      desc: 'Label for the date selection field',
      args: [],
    );
  }

  /// `Start Date`
  String get startDate {
    return Intl.message(
      'Start Date',
      name: 'startDate',
      desc: 'Label for start date selection',
      args: [],
    );
  }

  /// `End Date`
  String get endDate {
    return Intl.message(
      'End Date',
      name: 'endDate',
      desc: 'Label for end date selection',
      args: [],
    );
  }

  /// `Today`
  String get today {
    return Intl.message(
      'Today',
      name: 'today',
      desc: 'Label for the today button',
      args: [],
    );
  }

  /// `Yesterday`
  String get yesterday {
    return Intl.message(
      'Yesterday',
      name: 'yesterday',
      desc: 'Label for the yesterday button',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: 'Button text to delete an item',
      args: [],
    );
  }

  /// `Delete Confirmation`
  String get deleteDialogTitle {
    return Intl.message(
      'Delete Confirmation',
      name: 'deleteDialogTitle',
      desc: 'Title of the delete confirmation dialog',
      args: [],
    );
  }

  /// `Are you sure you want to delete this item?`
  String get deleteDialogContent {
    return Intl.message(
      'Are you sure you want to delete this item?',
      name: 'deleteDialogContent',
      desc: 'Content of the delete confirmation dialog',
      args: [],
    );
  }

  /// `Delete Success`
  String get deleteStateSuccess {
    return Intl.message(
      'Delete Success',
      name: 'deleteStateSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Delete Failure`
  String get deleteStateFailure {
    return Intl.message(
      'Delete Failure',
      name: 'deleteStateFailure',
      desc: '',
      args: [],
    );
  }

  /// `Editing Success`
  String get editStateSuccess {
    return Intl.message(
      'Editing Success',
      name: 'editStateSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Search Options`
  String get searchOptions {
    return Intl.message(
      'Search Options',
      name: 'searchOptions',
      desc: 'Title of the search options screen',
      args: [],
    );
  }

  /// `Clear Filter Data`
  String get clearFilterData {
    return Intl.message(
      'Clear Filter Data',
      name: 'clearFilterData',
      desc: 'Button text to clear all filter data',
      args: [],
    );
  }

  /// `Category Type`
  String get categoryType {
    return Intl.message(
      'Category Type',
      name: 'categoryType',
      desc: 'Label for the category type selection',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: 'Label for the all items filter',
      args: [],
    );
  }

  /// `Income`
  String get income {
    return Intl.message(
      'Income',
      name: 'income',
      desc: 'Label for the income section',
      args: [],
    );
  }

  /// `Expense`
  String get expense {
    return Intl.message(
      'Expense',
      name: 'expense',
      desc: 'Label for the expense section',
      args: [],
    );
  }

  /// `No items available`
  String get emptyList {
    return Intl.message(
      'No items available',
      name: 'emptyList',
      desc: 'Text displayed when a list is empty',
      args: [],
    );
  }

  /// `Apply`
  String get apply {
    return Intl.message(
      'Apply',
      name: 'apply',
      desc: 'Button text to apply filters or changes',
      args: [],
    );
  }

  /// `Cancel`
  String get cancle {
    return Intl.message(
      'Cancel',
      name: 'cancle',
      desc: 'Button text to cancel an action',
      args: [],
    );
  }

  /// `Save Changes`
  String get saveChanges {
    return Intl.message(
      'Save Changes',
      name: 'saveChanges',
      desc: 'Button text to save changes',
      args: [],
    );
  }

  /// `Tap to Change Profile Image`
  String get pickImageTitle {
    return Intl.message(
      'Tap to Change Profile Image',
      name: 'pickImageTitle',
      desc: 'Title for the image picker dialog',
      args: [],
    );
  }

  /// `Image changed successfully`
  String get changeImageSuccess {
    return Intl.message(
      'Image changed successfully',
      name: 'changeImageSuccess',
      desc: 'Success message when the image is changed',
      args: [],
    );
  }

  /// `Changes saved successfully`
  String get saveChangesSuccess {
    return Intl.message(
      'Changes saved successfully',
      name: 'saveChangesSuccess',
      desc: 'Success message when changes are saved',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: 'Button text to save an item',
      args: [],
    );
  }

  /// `Your Current Balance`
  String get addStartCurrentBalanceTitle {
    return Intl.message(
      'Your Current Balance',
      name: 'addStartCurrentBalanceTitle',
      desc: 'Title of the add current balance dialog',
      args: [],
    );
  }

  /// `Before you start, would you like to add the money you currently have?`
  String get addStartCurrentBalanceSubtitle {
    return Intl.message(
      'Before you start, would you like to add the money you currently have?',
      name: 'addStartCurrentBalanceSubtitle',
      desc: 'Subtitle of the add current balance dialog',
      args: [],
    );
  }

  /// `Enter your current balance`
  String get addStartCurrentBalanceHint {
    return Intl.message(
      'Enter your current balance',
      name: 'addStartCurrentBalanceHint',
      desc: 'Placeholder text for the current balance input field',
      args: [],
    );
  }

  /// `Daftarni`
  String get appTitle {
    return Intl.message(
      'Daftarni',
      name: 'appTitle',
      desc: 'Title of the application',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: 'Text for the skip button on the onboarding screen',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: 'Text for the next button on the onboarding screen',
      args: [],
    );
  }

  /// `Welcome to Budget Planner`
  String get onBoardingTitle1 {
    return Intl.message(
      'Welcome to Budget Planner',
      name: 'onBoardingTitle1',
      desc: 'Title of the first onboarding screen',
      args: [],
    );
  }

  /// `Take control of your money and save by tracking your expenses`
  String get onBoardingSubTitle1 {
    return Intl.message(
      'Take control of your money and save by tracking your expenses',
      name: 'onBoardingSubTitle1',
      desc: 'Subtitle of the first onboarding screen',
      args: [],
    );
  }

  /// `Save money easily`
  String get onBoardingTitle2 {
    return Intl.message(
      'Save money easily',
      name: 'onBoardingTitle2',
      desc: 'Title of the second onboarding screen',
      args: [],
    );
  }

  /// `Create budgets easily and see our suggestions based on your spending`
  String get onBoardingSubTitle2 {
    return Intl.message(
      'Create budgets easily and see our suggestions based on your spending',
      name: 'onBoardingSubTitle2',
      desc: 'Subtitle of the second onboarding screen',
      args: [],
    );
  }

  /// `Track your bills like never before`
  String get onBoardingTitle3 {
    return Intl.message(
      'Track your bills like never before',
      name: 'onBoardingTitle3',
      desc: 'Title of the third onboarding screen',
      args: [],
    );
  }

  /// `Build a custom budget based on your income, bills, and goals`
  String get onBoardingSubTitle3 {
    return Intl.message(
      'Build a custom budget based on your income, bills, and goals',
      name: 'onBoardingSubTitle3',
      desc: 'Subtitle of the third onboarding screen',
      args: [],
    );
  }

  /// `Get Started`
  String get getStarted {
    return Intl.message(
      'Get Started',
      name: 'getStarted',
      desc: 'Text for the get started button on the onboarding screen',
      args: [],
    );
  }

  /// `Configure your information`
  String get configureYourInfo {
    return Intl.message(
      'Configure your information',
      name: 'configureYourInfo',
      desc: 'Title of the configure your information screen',
      args: [],
    );
  }

  /// `User Name`
  String get userName {
    return Intl.message(
      'User Name',
      name: 'userName',
      desc: 'Label for the user name input field',
      args: [],
    );
  }

  /// `Enter your user name`
  String get userNameHint {
    return Intl.message(
      'Enter your user name',
      name: 'userNameHint',
      desc: 'Placeholder text for the user name input field',
      args: [],
    );
  }

  /// `Salary`
  String get salary {
    return Intl.message(
      'Salary',
      name: 'salary',
      desc: 'Label for the salary input field',
      args: [],
    );
  }

  /// `Enter your monthly salary`
  String get salaryHint {
    return Intl.message(
      'Enter your monthly salary',
      name: 'salaryHint',
      desc: 'Placeholder text for the salary input field',
      args: [],
    );
  }

  /// `Salary Day`
  String get SalaryDay {
    return Intl.message(
      'Salary Day',
      name: 'SalaryDay',
      desc: 'Label for the salary day input field',
      args: [],
    );
  }

  /// `Enter your salary day`
  String get salaryDayHint {
    return Intl.message(
      'Enter your salary day',
      name: 'salaryDayHint',
      desc: 'Placeholder text for the salary day input field',
      args: [],
    );
  }

  /// `Side Income`
  String get SideIncome {
    return Intl.message(
      'Side Income',
      name: 'SideIncome',
      desc: 'Label for the side income input field',
      args: [],
    );
  }

  /// `Optional`
  String get Optional {
    return Intl.message(
      'Optional',
      name: 'Optional',
      desc: 'Label for the optional field',
      args: [],
    );
  }

  /// `Enter your side income`
  String get sideIncomeHint {
    return Intl.message(
      'Enter your side income',
      name: 'sideIncomeHint',
      desc: 'Placeholder text for the side income input field',
      args: [],
    );
  }

  /// ` --- App Settings --- `
  String get appSettings {
    return Intl.message(
      ' --- App Settings --- ',
      name: 'appSettings',
      desc: 'Title of the app settings screen',
      args: [],
    );
  }

  /// `Theme`
  String get Theme {
    return Intl.message(
      'Theme',
      name: 'Theme',
      desc: 'Label for the theme selection section',
      args: [],
    );
  }

  /// `Light Theme`
  String get lightTheme {
    return Intl.message(
      'Light Theme',
      name: 'lightTheme',
      desc:
          'Label for the light theme option in appearance customization settings',
      args: [],
    );
  }

  /// `Dark Theme`
  String get darkTheme {
    return Intl.message(
      'Dark Theme',
      name: 'darkTheme',
      desc:
          'Label for the dark theme option in appearance customization settings',
      args: [],
    );
  }

  /// `System Theme`
  String get systemTheme {
    return Intl.message(
      'System Theme',
      name: 'systemTheme',
      desc:
          'Label for the system theme option in appearance customization settings',
      args: [],
    );
  }

  /// `Language`
  String get Language {
    return Intl.message(
      'Language',
      name: 'Language',
      desc: 'Label for the language selection section',
      args: [],
    );
  }

  /// `Arabic`
  String get arabic {
    return Intl.message(
      'Arabic',
      name: 'arabic',
      desc: 'Text for the Arabic language option in language settings',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: 'Text for the English language option in language settings',
      args: [],
    );
  }

  /// `Continue`
  String get continueButton {
    return Intl.message(
      'Continue',
      name: 'continueButton',
      desc: 'Text for the continue button on the onboarding screen',
      args: [],
    );
  }

  /// `Hi`
  String get hi {
    return Intl.message(
      'Hi',
      name: 'hi',
      desc: 'Greeting text',
      args: [],
    );
  }

  /// `Welcome Back`
  String get welcomeBack {
    return Intl.message(
      'Welcome Back',
      name: 'welcomeBack',
      desc: 'Welcome back text for returning users',
      args: [],
    );
  }

  /// `Current Balance`
  String get currentBalance {
    return Intl.message(
      'Current Balance',
      name: 'currentBalance',
      desc: 'Label for the current balance on the home screen',
      args: [],
    );
  }

  /// `View Monthly Report`
  String get viewDetailedReport {
    return Intl.message(
      'View Monthly Report',
      name: 'viewDetailedReport',
      desc: 'Text for the button to view monthly report on the home screen',
      args: [],
    );
  }

  /// `Quick Actions`
  String get quickActions {
    return Intl.message(
      'Quick Actions',
      name: 'quickActions',
      desc: 'Title for the quick actions section on the home screen',
      args: [],
    );
  }

  /// `Add New Expense`
  String get addNewExpense {
    return Intl.message(
      'Add New Expense',
      name: 'addNewExpense',
      desc: 'Label for the add new expense quick action',
      args: [],
    );
  }

  /// `Record Income`
  String get recordIncome {
    return Intl.message(
      'Record Income',
      name: 'recordIncome',
      desc: 'Label for the add new income quick action',
      args: [],
    );
  }

  /// `Transactions Analysis`
  String get transactionsAnalysis {
    return Intl.message(
      'Transactions Analysis',
      name: 'transactionsAnalysis',
      desc: 'Label for the transactions analysis quick action',
      args: [],
    );
  }

  /// `Manage Categories`
  String get manageCategories {
    return Intl.message(
      'Manage Categories',
      name: 'manageCategories',
      desc: 'Label for the manage categories quick action',
      args: [],
    );
  }

  /// `Recent Transactions`
  String get recentTransactions {
    return Intl.message(
      'Recent Transactions',
      name: 'recentTransactions',
      desc: 'Title for the recent transactions section on the home screen',
      args: [],
    );
  }

  /// `View All`
  String get viewAll {
    return Intl.message(
      'View All',
      name: 'viewAll',
      desc: 'Text for the button to view all transactions',
      args: [],
    );
  }

  /// `Category`
  String get category {
    return Intl.message(
      'Category',
      name: 'category',
      desc: 'Label for the category selection',
      args: [],
    );
  }

  /// `Choose Category`
  String get chooseCategory {
    return Intl.message(
      'Choose Category',
      name: 'chooseCategory',
      desc: 'Title of the category selection screen',
      args: [],
    );
  }

  /// `Notes (Optional)`
  String get notesOptional {
    return Intl.message(
      'Notes (Optional)',
      name: 'notesOptional',
      desc: 'Label for the optional notes input field',
      args: [],
    );
  }

  /// `Add Expense`
  String get addExpenseTitle {
    return Intl.message(
      'Add Expense',
      name: 'addExpenseTitle',
      desc: 'Button text to add a new expense',
      args: [],
    );
  }

  /// `Manage your spendings smartly`
  String get addExpenseSubTitle {
    return Intl.message(
      'Manage your spendings smartly',
      name: 'addExpenseSubTitle',
      desc: 'Subtitle for the add expense screen',
      args: [],
    );
  }

  /// `Enter Expense Amount`
  String get enterExpenseAmount {
    return Intl.message(
      'Enter Expense Amount',
      name: 'enterExpenseAmount',
      desc: 'Placeholder text for the expense amount input field',
      args: [],
    );
  }

  /// `Add a brief description or note about this expense ...`
  String get notesExpenseBrief {
    return Intl.message(
      'Add a brief description or note about this expense ...',
      name: 'notesExpenseBrief',
      desc:
          'Placeholder text for the notes input field on the add expense screen',
      args: [],
    );
  }

  /// `✨ Add Expense`
  String get addExpenseButton {
    return Intl.message(
      '✨ Add Expense',
      name: 'addExpenseButton',
      desc: 'Button text to confirm adding a new expense',
      args: [],
    );
  }

  /// `Add Income`
  String get addIncomeTitle {
    return Intl.message(
      'Add Income',
      name: 'addIncomeTitle',
      desc: 'Title for the add income screen',
      args: [],
    );
  }

  /// `Track your earnings efficiently`
  String get addIncomeSubTitle {
    return Intl.message(
      'Track your earnings efficiently',
      name: 'addIncomeSubTitle',
      desc: 'Subtitle for the add income screen',
      args: [],
    );
  }

  /// `Enter Income Amount`
  String get enterIncomeAmount {
    return Intl.message(
      'Enter Income Amount',
      name: 'enterIncomeAmount',
      desc: 'Placeholder text for the income amount input field',
      args: [],
    );
  }

  /// `Add a brief description or note about this income ...`
  String get notesIncomeBrief {
    return Intl.message(
      'Add a brief description or note about this income ...',
      name: 'notesIncomeBrief',
      desc:
          'Placeholder text for the notes input field on the add income screen',
      args: [],
    );
  }

  /// `✨ Add Income`
  String get addIncomeButton {
    return Intl.message(
      '✨ Add Income',
      name: 'addIncomeButton',
      desc: 'Button text to confirm adding a new income',
      args: [],
    );
  }

  /// `Transaction added successfully`
  String get addTransactionSuccess {
    return Intl.message(
      'Transaction added successfully',
      name: 'addTransactionSuccess',
      desc: 'Success message when a transaction is added',
      args: [],
    );
  }

  /// `Insufficient Funds for this expense`
  String get addExpenseTransactionLowValue {
    return Intl.message(
      'Insufficient Funds for this expense',
      name: 'addExpenseTransactionLowValue',
      desc:
          'Error message when trying to add an expense that exceeds the current balance',
      args: [],
    );
  }

  /// `Edit Income`
  String get editIncomeTitle {
    return Intl.message(
      'Edit Income',
      name: 'editIncomeTitle',
      desc: 'Title for the add income screen',
      args: [],
    );
  }

  /// `✨ Edit Income`
  String get editIncomeButton {
    return Intl.message(
      '✨ Edit Income',
      name: 'editIncomeButton',
      desc: 'Button text to confirm edit income',
      args: [],
    );
  }

  /// `Edit Expense`
  String get editExpenseTitle {
    return Intl.message(
      'Edit Expense',
      name: 'editExpenseTitle',
      desc: 'Title for the add income screen',
      args: [],
    );
  }

  /// `✨ Edit Expense`
  String get editExpenseButton {
    return Intl.message(
      '✨ Edit Expense',
      name: 'editExpenseButton',
      desc: 'Button text to confirm edit expense',
      args: [],
    );
  }

  /// `Categories`
  String get categories {
    return Intl.message(
      'Categories',
      name: 'categories',
      desc: 'Title of the categories screen',
      args: [],
    );
  }

  /// `Search Categories ...`
  String get categoriesSearchHint {
    return Intl.message(
      'Search Categories ...',
      name: 'categoriesSearchHint',
      desc: 'Placeholder text for the category search input field',
      args: [],
    );
  }

  /// `Add New Category`
  String get addNewCategory {
    return Intl.message(
      'Add New Category',
      name: 'addNewCategory',
      desc: 'Title of the add new category screen',
      args: [],
    );
  }

  /// `Create a custom category for better expense tracking`
  String get addNewCategorySubtitle {
    return Intl.message(
      'Create a custom category for better expense tracking',
      name: 'addNewCategorySubtitle',
      desc: 'Subtitle of the add new category screen',
      args: [],
    );
  }

  /// `Category Name`
  String get categoryName {
    return Intl.message(
      'Category Name',
      name: 'categoryName',
      desc: 'Label for the category name input field',
      args: [],
    );
  }

  /// `e.g., Groceries, Transport, Rent ...`
  String get categoryNameHint {
    return Intl.message(
      'e.g., Groceries, Transport, Rent ...',
      name: 'categoryNameHint',
      desc: 'Placeholder text for the category name input field',
      args: [],
    );
  }

  /// `Category Icon`
  String get categoryIcon {
    return Intl.message(
      'Category Icon',
      name: 'categoryIcon',
      desc: 'Label for the category icon selection',
      args: [],
    );
  }

  /// `Selected Icon : `
  String get selectedIcon {
    return Intl.message(
      'Selected Icon : ',
      name: 'selectedIcon',
      desc: 'Label for displaying the selected category icon',
      args: [],
    );
  }

  /// `Tap to select an icon`
  String get categoryIconHint {
    return Intl.message(
      'Tap to select an icon',
      name: 'categoryIconHint',
      desc: 'Hint text for selecting a category icon',
      args: [],
    );
  }

  /// `Category Color`
  String get categoryColor {
    return Intl.message(
      'Category Color',
      name: 'categoryColor',
      desc: 'Label for the category color selection',
      args: [],
    );
  }

  /// `Tap to choose a color`
  String get categoryColorHint {
    return Intl.message(
      'Tap to choose a color',
      name: 'categoryColorHint',
      desc: 'Hint text for selecting a category color',
      args: [],
    );
  }

  /// `✨ Create Category`
  String get createCategoryButton {
    return Intl.message(
      '✨ Create Category',
      name: 'createCategoryButton',
      desc: 'Button text to create a new category',
      args: [],
    );
  }

  /// `Category added successfully`
  String get addCategorySuccess {
    return Intl.message(
      'Category added successfully',
      name: 'addCategorySuccess',
      desc: 'Success message when a new category is added',
      args: [],
    );
  }

  /// `Transactions`
  String get transactions {
    return Intl.message(
      'Transactions',
      name: 'transactions',
      desc: 'Title of the transactions screen',
      args: [],
    );
  }

  /// `Search Transactions ...`
  String get transactionsSearchHint {
    return Intl.message(
      'Search Transactions ...',
      name: 'transactionsSearchHint',
      desc: 'Placeholder text for the transaction search input field',
      args: [],
    );
  }

  /// `Balance Analysis`
  String get balanceAnalysis {
    return Intl.message(
      'Balance Analysis',
      name: 'balanceAnalysis',
      desc: 'Title for the balance analysis section',
      args: [],
    );
  }

  /// `Notes`
  String get notes {
    return Intl.message(
      'Notes',
      name: 'notes',
      desc: 'Label for the notes section in reports',
      args: [],
    );
  }

  /// `Total`
  String get total {
    return Intl.message(
      'Total',
      name: 'total',
      desc: 'Label for the total field in reports',
      args: [],
    );
  }

  /// `No data available`
  String get noDataAvailable {
    return Intl.message(
      'No data available',
      name: 'noDataAvailable',
      desc: 'Text displayed when no data is available in reports',
      args: [],
    );
  }

  /// `View Monthly Report`
  String get monthlyReportButton {
    return Intl.message(
      'View Monthly Report',
      name: 'monthlyReportButton',
      desc: 'Text for the button to view monthly report',
      args: [],
    );
  }

  /// `Monthly Transactions Report`
  String get monthlyReportViewTitle {
    return Intl.message(
      'Monthly Transactions Report',
      name: 'monthlyReportViewTitle',
      desc: 'Title for the monthly report screen',
      args: [],
    );
  }

  /// `Monthly Transactions Report for `
  String get monthlyReportTitle {
    return Intl.message(
      'Monthly Transactions Report for ',
      name: 'monthlyReportTitle',
      desc: 'Title for the monthly report screen',
      args: [],
    );
  }

  /// `Transactions Report`
  String get analysisReportViewTitle {
    return Intl.message(
      'Transactions Report',
      name: 'analysisReportViewTitle',
      desc: 'Title for the transactions analysis report screen',
      args: [],
    );
  }

  /// `Transactions Analysis Report`
  String get analysisReportTitle {
    return Intl.message(
      'Transactions Analysis Report',
      name: 'analysisReportTitle',
      desc: 'Title for the transactions analysis report screen',
      args: [],
    );
  }

  /// `From`
  String get from {
    return Intl.message(
      'From',
      name: 'from',
      desc: 'Label for the start date in reports',
      args: [],
    );
  }

  /// `To`
  String get to {
    return Intl.message(
      'To',
      name: 'to',
      desc: 'Label for the end date in reports',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: 'Title of the settings screen',
      args: [],
    );
  }

  /// `Not Signed In`
  String get notSignedIn {
    return Intl.message(
      'Not Signed In',
      name: 'notSignedIn',
      desc: 'Text displayed when the user is not signed in',
      args: [],
    );
  }

  /// `Personal`
  String get personal {
    return Intl.message(
      'Personal',
      name: 'personal',
      desc: 'Label for the personal section in settings',
      args: [],
    );
  }

  /// `Personal Information`
  String get personalInfo {
    return Intl.message(
      'Personal Information',
      name: 'personalInfo',
      desc: 'Label for the personal information section in settings',
      args: [],
    );
  }

  /// `General`
  String get general {
    return Intl.message(
      'General',
      name: 'general',
      desc: 'Label for the general section in settings',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: 'Label for the notifications section in settings',
      args: [],
    );
  }

  /// `Manage your notification`
  String get notificationsHint {
    return Intl.message(
      'Manage your notification',
      name: 'notificationsHint',
      desc: 'Subtitle for the notifications section in settings',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: 'Label for the privacy policy section in settings',
      args: [],
    );
  }

  /// `Review our privacy practices`
  String get privacyPolicyHint {
    return Intl.message(
      'Review our privacy practices',
      name: 'privacyPolicyHint',
      desc: 'Subtitle for the privacy policy section in settings',
      args: [],
    );
  }

  /// `Support`
  String get support {
    return Intl.message(
      'Support',
      name: 'support',
      desc: 'Label for the support section in settings',
      args: [],
    );
  }

  /// `Get help and support`
  String get supportHint {
    return Intl.message(
      'Get help and support',
      name: 'supportHint',
      desc: 'Subtitle for the support section in settings',
      args: [],
    );
  }

  /// `Privacy and Security`
  String get privacySecurityTitle {
    return Intl.message(
      'Privacy and Security',
      name: 'privacySecurityTitle',
      desc: 'Title for the privacy and security screen',
      args: [],
    );
  }

  /// `Read our privacy policy`
  String get privacyPolicySubtitle {
    return Intl.message(
      'Read our privacy policy',
      name: 'privacyPolicySubtitle',
      desc: 'Subtitle for the privacy policy section in settings',
      args: [],
    );
  }

  /// `We at the Expense Manager app value your privacy and the security of your financial and personal data. By using the app, you agree to the following privacy policy:`
  String get privacySecurityIntro {
    return Intl.message(
      'We at the Expense Manager app value your privacy and the security of your financial and personal data. By using the app, you agree to the following privacy policy:',
      name: 'privacySecurityIntro',
      desc: 'Introduction text for the privacy and security screen',
      args: [],
    );
  }

  /// `1. Data We Collect`
  String get privacySecurityFirstTitle {
    return Intl.message(
      '1. Data We Collect',
      name: 'privacySecurityFirstTitle',
      desc: 'Title for the first section of the privacy and security screen',
      args: [],
    );
  }

  /// `• Information you manually enter into the app (such as expenses, categories, income...)\n• User account information (name, email, password) if you create an account.\n• We do not collect any other data without your knowledge or consent.`
  String get privacySecurityFirstText {
    return Intl.message(
      '• Information you manually enter into the app (such as expenses, categories, income...)\n• User account information (name, email, password) if you create an account.\n• We do not collect any other data without your knowledge or consent.',
      name: 'privacySecurityFirstText',
      desc: 'Text for the first section of the privacy and security screen',
      args: [],
    );
  }

  /// `2. Data Storage Location`
  String get privacySecuritySecondTitle {
    return Intl.message(
      '2. Data Storage Location',
      name: 'privacySecuritySecondTitle',
      desc: 'Title for the second section of the privacy and security screen',
      args: [],
    );
  }

  /// `• If you don’t have an account: your data is stored locally on your device only.\n• If you create an account: a secure copy of your data is stored online to enable synchronization and recovery from other devices.\n• Data is encrypted during transfer and storage for your safety.`
  String get privacySecuritySecondText {
    return Intl.message(
      '• If you don’t have an account: your data is stored locally on your device only.\n• If you create an account: a secure copy of your data is stored online to enable synchronization and recovery from other devices.\n• Data is encrypted during transfer and storage for your safety.',
      name: 'privacySecuritySecondText',
      desc: 'Text for the second section of the privacy and security screen',
      args: [],
    );
  }

  /// `3. How We Use Data`
  String get privacySecurityThirdTitle {
    return Intl.message(
      '3. How We Use Data',
      name: 'privacySecurityThirdTitle',
      desc: 'Title for the third section of the privacy and security screen',
      args: [],
    );
  }

  /// `• Your data is only used to display and manage your personal expenses.\n• We do not share your data with third parties.\n• We do not use your data for advertising or marketing purposes.`
  String get privacySecurityThirdText {
    return Intl.message(
      '• Your data is only used to display and manage your personal expenses.\n• We do not share your data with third parties.\n• We do not use your data for advertising or marketing purposes.',
      name: 'privacySecurityThirdText',
      desc: 'Text for the third section of the privacy and security screen',
      args: [],
    );
  }

  /// `4. Security`
  String get privacySecurityFourthTitle {
    return Intl.message(
      '4. Security',
      name: 'privacySecurityFourthTitle',
      desc: 'Title for the fourth section of the privacy and security screen',
      args: [],
    );
  }

  /// `• All stored data, locally or on the server, is protected using encryption technologies.\n• You can change your password anytime from account settings.\n• You can permanently delete your account and all related data.\n• App access can be protected using a PIN or fingerprint (if supported).`
  String get privacySecurityFourthText {
    return Intl.message(
      '• All stored data, locally or on the server, is protected using encryption technologies.\n• You can change your password anytime from account settings.\n• You can permanently delete your account and all related data.\n• App access can be protected using a PIN or fingerprint (if supported).',
      name: 'privacySecurityFourthText',
      desc: 'Text for the fourth section of the privacy and security screen',
      args: [],
    );
  }

  /// `5. User Rights`
  String get privacySecurityFifthTitle {
    return Intl.message(
      '5. User Rights',
      name: 'privacySecurityFifthTitle',
      desc: 'Title for the fifth section of the privacy and security screen',
      args: [],
    );
  }

  /// `• You have full rights to access, modify, or delete your data.\n• You can use the 'Delete Account' feature to permanently erase all data from the app and the server.`
  String get privacySecurityFifthText {
    return Intl.message(
      '• You have full rights to access, modify, or delete your data.\n• You can use the \'Delete Account\' feature to permanently erase all data from the app and the server.',
      name: 'privacySecurityFifthText',
      desc: 'Text for the fifth section of the privacy and security screen',
      args: [],
    );
  }

  /// `Contact`
  String get privacySecurityContactTitle {
    return Intl.message(
      'Contact',
      name: 'privacySecurityContactTitle',
      desc: 'Title for the contact section of the privacy and security screen',
      args: [],
    );
  }

  /// `If you have any questions regarding privacy or security, you can contact us via email:\nsupport@yourapp.com`
  String get privacySecurityContactText {
    return Intl.message(
      'If you have any questions regarding privacy or security, you can contact us via email:\nsupport@yourapp.com',
      name: 'privacySecurityContactText',
      desc: 'Text for the contact section of the privacy and security screen',
      args: [],
    );
  }

  /// `Daftarny Expense Manager. All rights reserved`
  String get privacySecurityFooter {
    return Intl.message(
      'Daftarny Expense Manager. All rights reserved',
      name: 'privacySecurityFooter',
      desc: 'Footer text for the privacy and security screen',
      args: [],
    );
  }

  /// `Contact Us`
  String get contactUsTitle {
    return Intl.message(
      'Contact Us',
      name: 'contactUsTitle',
      desc: 'Title for the contact us section in support',
      args: [],
    );
  }

  /// `For assistance, please reach out to our support team`
  String get contactUsHint {
    return Intl.message(
      'For assistance, please reach out to our support team',
      name: 'contactUsHint',
      desc: 'Subtitle for the contact us section in support',
      args: [],
    );
  }

  /// `Phone Call`
  String get supportPhoneTitle {
    return Intl.message(
      'Phone Call',
      name: 'supportPhoneTitle',
      desc: 'Title for the phone call option',
      args: [],
    );
  }

  /// `Press to call the support team`
  String get supportPhoneHint {
    return Intl.message(
      'Press to call the support team',
      name: 'supportPhoneHint',
      desc: 'Subtitle for the phone call option',
      args: [],
    );
  }

  /// `WhatsApp`
  String get supportWhatsappTitle {
    return Intl.message(
      'WhatsApp',
      name: 'supportWhatsappTitle',
      desc: 'Title for the WhatsApp contact option',
      args: [],
    );
  }

  /// `Press to chat with the support team on WhatsApp`
  String get supportWhatsappHint {
    return Intl.message(
      'Press to chat with the support team on WhatsApp',
      name: 'supportWhatsappHint',
      desc: 'Subtitle for the WhatsApp contact option',
      args: [],
    );
  }

  /// `Email Support`
  String get supportEmailTitle {
    return Intl.message(
      'Email Support',
      name: 'supportEmailTitle',
      desc: 'Title for the email contact option',
      args: [],
    );
  }

  /// `Press to send an email to the support team`
  String get supportEmailHint {
    return Intl.message(
      'Press to send an email to the support team',
      name: 'supportEmailHint',
      desc: 'Subtitle for the email contact option',
      args: [],
    );
  }

  /// `----- Frequently Asked Questions -----`
  String get faqTitle {
    return Intl.message(
      '----- Frequently Asked Questions -----',
      name: 'faqTitle',
      desc: 'Title for the FAQ section in the support page',
      args: [],
    );
  }

  /// `How can I restore my data after deleting the app?`
  String get faqQuestion1 {
    return Intl.message(
      'How can I restore my data after deleting the app?',
      name: 'faqQuestion1',
      desc: 'The first question and answer pair in the FAQ section',
      args: [],
    );
  }

  /// `You can restore your data by logging back into your account using the same email and password.`
  String get faqAnswer1 {
    return Intl.message(
      'You can restore your data by logging back into your account using the same email and password.',
      name: 'faqAnswer1',
      desc: 'The answer to the first question in the FAQ section',
      args: [],
    );
  }

  /// `Can I use the app without creating an account?`
  String get faqQuestion2 {
    return Intl.message(
      'Can I use the app without creating an account?',
      name: 'faqQuestion2',
      desc: 'The second question and answer pair in the FAQ section',
      args: [],
    );
  }

  /// `Yes, you can use the app without an account, but your data will be saved only on your device.`
  String get faqAnswer2 {
    return Intl.message(
      'Yes, you can use the app without an account, but your data will be saved only on your device.',
      name: 'faqAnswer2',
      desc: 'The answer to the second question in the FAQ section',
      args: [],
    );
  }

  /// `Can I permanently delete my account?`
  String get faqQuestion3 {
    return Intl.message(
      'Can I permanently delete my account?',
      name: 'faqQuestion3',
      desc: 'The third question in the FAQ section',
      args: [],
    );
  }

  /// `Yes, you can delete your account and all your data from Settings > Delete Account.`
  String get faqAnswer3 {
    return Intl.message(
      'Yes, you can delete your account and all your data from Settings > Delete Account.',
      name: 'faqAnswer3',
      desc: 'The answer to the third question in the FAQ section',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
