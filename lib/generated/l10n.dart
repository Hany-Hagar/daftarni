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
