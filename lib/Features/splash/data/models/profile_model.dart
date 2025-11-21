import 'package:hive/hive.dart';

import 'balance_model.dart';

part 'profile_model.g.dart';

@HiveType(typeId: 2)
class ProfileModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String imageUrl;

  @HiveField(2)
  final String imagePath;

  @HiveField(3)
  final String userName;

  @HiveField(4)
  final String emailAddress;

  @HiveField(5)
  final double salary;

  @HiveField(6)
  final int salaryDay;

  @HiveField(7)
  final double sideSalary;

  @HiveField(8)
  final BalanceModel balance;

  ProfileModel({
    required this.id,
    required this.imageUrl,
    required this.imagePath,
    required this.userName,
    required this.emailAddress,
    required this.salary,
    required this.salaryDay,
    required this.sideSalary,
    required this.balance,
  });

  factory ProfileModel.defaultProfile() {
    return ProfileModel(
      id: '',
      imageUrl: '',
      imagePath: '',
      userName: 'User',
      emailAddress: '',
      salary: 0.0,
      salaryDay: 1,
      sideSalary: 0.0,
      balance: BalanceModel.defaultBalance(),
    );
  }

  ProfileModel copyWith({
    String? id,
    String? imageUrl,
    String? imagePath,
    String? userName,
    String? emailAddress,
    double? salary,
    int? salaryDay,
    double? sideSalary,
    BalanceModel? balance,
  }) {
    return ProfileModel(
      id: id ?? this.id,
      imageUrl: imageUrl ?? this.imageUrl,
      imagePath: imagePath ?? this.imagePath,
      userName: userName ?? this.userName,
      emailAddress: emailAddress ?? this.emailAddress,
      salary: salary ?? this.salary,
      salaryDay: salaryDay ?? this.salaryDay,
      sideSalary: sideSalary ?? this.sideSalary,
      balance: balance ?? this.balance,
    );
  }
}
