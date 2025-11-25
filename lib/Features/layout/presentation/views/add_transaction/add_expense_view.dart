import 'add_transactions_view.dart';
import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/models/category_model.dart';

class AddExpenseView extends StatelessWidget {
  const AddExpenseView({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return AddTransactionsView(
      title: s.addExpenseTitle,
      subTitle: s.addExpenseSubTitle,
      brief: s.notesExpenseBrief,
      amountTitle: s.enterExpenseAmount,
      value: TextEditingController(),
      onChanged: (value) {},
      onTap: () {},
      dateController: TextEditingController(),
      briefController: TextEditingController(),
      categoryIndex: 0,
      categories: expenseCategoriesData,
    );
  }
}
