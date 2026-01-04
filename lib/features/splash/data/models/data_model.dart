import 'profile_model.dart';
import 'preferences_model.dart';
import 'package:hive/hive.dart';
import '../../../layout/data/models/category_model.dart';
import '../../../layout/data/models/transaction_model.dart';

part 'data_model.g.dart';

@HiveType(typeId: 1)
class DataModel extends HiveObject {
  @HiveField(0)
  final PreferencesModel preferences;

  @HiveField(1)
  final ProfileModel profile;

  @HiveField(2)
  final List<CategoryModel> categories;

  @HiveField(3)
  final List<TransactionModel> transactions;

  @HiveField(4)
  final bool isFirstOpen;

  @HiveField(5)
  final bool isLoggedIn;

  DataModel({
    required this.preferences,
    required this.profile,
    required this.categories,
    required this.transactions,
    required this.isFirstOpen,
    required this.isLoggedIn,
  });

  factory DataModel.defaultData() {
    return DataModel(
      preferences: PreferencesModel.defaultData(),
      profile: ProfileModel.defaultProfile(),
      categories: [],
      transactions: [],
      isFirstOpen: true,
      isLoggedIn: false,
    );
  }

  DataModel copyWith({
    PreferencesModel? preferences,
    ProfileModel? profile,
    List<CategoryModel>? categories,
    List<TransactionModel>? transactions,
    bool? isFirstOpen,
    bool? isLoggedIn,
  }) {
    return DataModel(
      preferences: preferences ?? this.preferences,
      profile: profile ?? this.profile,
      categories: categories ?? this.categories,
      transactions: transactions ?? this.transactions,
      isFirstOpen: isFirstOpen ?? this.isFirstOpen,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
    );
  }
}
