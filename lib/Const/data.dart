// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../features/layout/data/models/icon_model.dart';
import '../features/layout/data/models/category_model.dart';
import '../features/layout/data/models/transaction_model.dart';

// App Info
const String appEMail = "daftarniapp@gmail.com";

// Preferences

/// Language Codes
const String enCode = 'en';
const String arCode = 'ar';

/// Theme Modes
const String lightTheme = 'light';
const String darkTheme = 'dark';
const String systemTheme = 'system';

// Data Keys

/// Hive
const String dataBoxName = 'data_box';
const String dataKey = 'data_key';

// Add Category Button

CategoryModel addCategoryButtonData = CategoryModel(
  id: 'cat1',
  icon: IconModel.fromIconData(Icons.fastfood),
  title: ['add', "أضف"],
  type: 'expense',
  color: Colors.transparent.value,
);

// Loading Models
CategoryModel loadingCategoryModel = CategoryModel(
  id: 'cat1',
  icon: IconModel.fromIconData(Icons.fastfood),
  title: ['Food', "طعام"],
  type: 'expense',
  color: Colors.red.value,
);

// Transaction Data
TransactionModel loadingTransactionModel = TransactionModel(
  id: 'txn1',
  category: loadingCategoryModel,
  type: incomeType,
  notes: 'Lunch at McDonald\'s',
  value: 12.50,
  time: DateTime.now(),
  userId: 'user123',
);

const String incomeType = 'income';
const String expenseType = 'expense';
const Color incomeColor = Color.fromARGB(255, 9, 190, 15);
const Color expenseColor = Colors.red;
