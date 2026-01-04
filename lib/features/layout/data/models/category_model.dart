// ignore_for_file: deprecated_member_use
import 'icon_model.dart';
import 'package:hive/hive.dart';
import '../../../../const_data/data.dart';
import 'package:flutter/material.dart';

part 'category_model.g.dart';

@HiveType(typeId: 5)
class CategoryModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final IconModel icon;
  @HiveField(2)
  final List<String> title;
  @HiveField(3)
  final String type;
  @HiveField(4)
  final int color;
  @HiveField(5)
  final String? userId;

  CategoryModel({
    required this.id,
    required this.icon,
    required this.title,
    required this.type,
    required this.color,
    this.userId,
  });

  factory CategoryModel.newCategory({
    required IconData icon,
    required List<String> title,
    required String type,
    required int color,
    required String userId,
  }) {
    return CategoryModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      icon: IconModel.fromIconData(icon), // ← دلوقتي النوع متطابق
      title: title,
      type: type,
      color: color,
      userId: userId,
    );
  }

  /// Getter بيرجع IconData من IconModel
  IconData get iconData => icon.toIconData();

  /// Serialize CategoryModel to a Map (used by TransactionModel.toMap).
  Map<String, dynamic> toMap() => {
    'id': id,
    'icon': icon.toMap(),
    'title': title,
    'type': type,
    'color': color,
    'userId': userId,
  };

  /// Deserialize CategoryModel from a Map (used by TransactionModel.fromMap).
  factory CategoryModel.fromMap(Map<String, dynamic> map) => CategoryModel(
    id: map['id'].toString(),
    icon: IconModel.fromMap(Map<String, dynamic>.from(map['icon'])),
    title: List<String>.from(map['title'] as List),
    type: map['type'] as String,
    color: map['color'] as int,
    userId: map['userId'] as String?,
  );
}

List<CategoryModel> expenseCategoriesData = [
  CategoryModel(
    id: '1',
    icon: IconModel.fromIconData(Icons.restaurant),
    title: ['Food', "طعام"],
    type: expenseType,
    color: Colors.redAccent.value,
  ),
  CategoryModel(
    id: '2',
    icon: IconModel.fromIconData(Icons.home),
    title: ['Rent', "إيجار"],
    type: expenseType,
    color: Colors.deepPurple.value,
  ),
  CategoryModel(
    id: '3',
    icon: IconModel.fromIconData(Icons.local_gas_station),
    title: ['Transport', "النقل"],
    type: expenseType,
    color: Colors.orangeAccent.value,
  ),
  CategoryModel(
    id: '4',
    icon: IconModel.fromIconData(Icons.tv),
    title: ['Subscriptions', "الاشتراكات"],
    type: expenseType,
    color: Colors.teal.value,
  ),
  CategoryModel(
    id: '5',
    icon: IconModel.fromIconData(Icons.health_and_safety),
    title: ['Health', "الصحة"],
    type: expenseType,
    color: Colors.pinkAccent.value,
  ),
  CategoryModel(
    id: '6',
    icon: IconModel.fromIconData(Icons.school),
    title: ['Education', "تعليم"],
    type: expenseType,
    color: Colors.indigo.value,
  ),
  CategoryModel(
    id: '7',
    icon: IconModel.fromIconData(Icons.card_giftcard),
    title: ['Gifts', "هدايا"],
    type: expenseType,
    color: Colors.purpleAccent.value,
  ),
  CategoryModel(
    id: '8',
    icon: IconModel.fromIconData(Icons.flight),
    title: ['Travel', "السفر"],
    type: expenseType,
    color: Colors.lightBlueAccent.value,
  ),
  CategoryModel(
    id: '9',
    icon: IconModel.fromIconData(Icons.child_care),
    title: ['Kids', "أطفال"],
    type: expenseType,
    color: Colors.amber.value,
  ),
  CategoryModel(
    id: '10',
    icon: IconModel.fromIconData(Icons.elderly),
    title: ['Elderly', "كبار السن"],
    type: expenseType,
    color: Colors.brown.value,
  ),
];

List<CategoryModel> incomeCategoriesData = [
  CategoryModel(
    id: '11',
    icon: IconModel.fromIconData(Icons.attach_money),
    title: ['Salary', "راتب"],
    type: incomeType,
    color: Colors.green.value,
  ),
  CategoryModel(
    id: '12',
    icon: IconModel.fromIconData(Icons.money),
    title: ['Bonus', "مكافأة"],
    type: incomeType,
    color: Colors.greenAccent.value,
  ),
  CategoryModel(
    id: '13',
    icon: IconModel.fromIconData(Icons.business_center),
    title: ['Business', "عمل"],
    type: incomeType,
    color: Colors.blueAccent.value,
  ),
  CategoryModel(
    id: '14',
    icon: IconModel.fromIconData(Icons.trending_up),
    title: ['Investment', "استثمار"],
    type: incomeType,
    color: Colors.cyan.value,
  ),
  CategoryModel(
    id: '15',
    icon: IconModel.fromIconData(Icons.house),
    title: ['Rent Income', "دخل الإيجار"],
    type: incomeType,
    color: Colors.lightGreen.value,
  ),
  CategoryModel(
    id: '16',
    icon: IconModel.fromIconData(Icons.card_giftcard),
    title: ['Gift', "هدية"],
    type: incomeType,
    color: Colors.deepOrangeAccent.value,
  ),
  CategoryModel(
    id: '17',
    icon: IconModel.fromIconData(Icons.work),
    title: ['Freelance', "عمل حر"],
    type: incomeType,
    color: Colors.blueGrey.value,
  ),
  CategoryModel(
    id: '18',
    icon: IconModel.fromIconData(Icons.savings),
    title: ['Savings', "مدخرات"],
    type: incomeType,
    color: Colors.lime.value,
  ),
  CategoryModel(
    id: '19',
    icon: IconModel.fromIconData(Icons.sell),
    title: ['Selling', "بيع"],
    type: incomeType,
    color: Colors.yellow.shade700.value,
  ),
  CategoryModel(
    id: '20',
    icon: IconModel.fromIconData(Icons.assignment_return),
    title: ['Refund', "استرداد"],
    type: incomeType,
    color: Colors.grey.value,
  ),
];
