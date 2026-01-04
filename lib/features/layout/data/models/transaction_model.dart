import 'category_model.dart';
import 'package:hive/hive.dart';

part 'transaction_model.g.dart';

@HiveType(typeId: 6)
class TransactionModel {
  @HiveField(0)
  final String userId;
  @HiveField(1)
  final String id;
  @HiveField(2)
  final String type;
  @HiveField(3)
  final double value;
  @HiveField(4)
  final CategoryModel category;
  @HiveField(5)
  final DateTime time;
  @HiveField(6)
  final String notes;

  TransactionModel({
    required this.userId,
    required this.id,
    required this.type,
    required this.value,
    required this.category,
    required this.time,
    required this.notes,
  });

  /// تحويل من Map إلى Object
  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      userId: map['userId'],
      id: map['id'].toString(),
      type: map['type'],
      value: (map['value'] as num).toDouble(),
      category: CategoryModel.fromMap(map['category']),
      time: DateTime.parse(map['time']),
      notes: map['notes'],
    );
  }

  /// تحويل من Object إلى Map
  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'type': type,
      'value': value,
      'category': category.toMap(),
      'time': time.toIso8601String(),
      'notes': notes,
    };
  }

  /// copyWith لتعديل نسخة من الموديل
  TransactionModel copyWith({
    String? userId,
    String? id,
    String? type,
    double? value,
    CategoryModel? category,
    DateTime? time,
    String? notes,
  }) {
    return TransactionModel(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      type: type ?? this.type,
      value: value ?? this.value,
      category: category ?? this.category,
      time: time ?? this.time,
      notes: notes ?? this.notes,
    );
  }
}

// touched to trigger code generation
