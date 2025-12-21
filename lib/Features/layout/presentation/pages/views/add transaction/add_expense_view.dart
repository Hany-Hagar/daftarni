import 'add_transactions_view.dart';
import 'package:flutter/material.dart';
import '../../../manager/layout_cubit.dart';
import '../../../../../../generated/l10n.dart';

class AddExpenseView extends StatelessWidget {
  final bool isEditing;
  const AddExpenseView({super.key, this.isEditing = false});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    var cubit = LayoutCubit.get(context);
    return AddTransactionsView(
      isIncome: false,
      title: isEditing ? s.editExpenseTitle : s.addExpenseTitle,
      subTitle: s.addExpenseSubTitle,
      brief: s.notesExpenseBrief,
      amountTitle: s.enterExpenseAmount,
      categories: cubit.expenseCategories,
      buttonTitle: isEditing ? s.editExpenseButton : s.addExpenseButton,
      isEditing: isEditing,
    );
  }
}
