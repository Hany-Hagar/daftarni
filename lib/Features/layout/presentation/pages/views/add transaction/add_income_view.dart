import 'add_transactions_view.dart';
import 'package:flutter/material.dart';
import '../../../manager/layout_cubit.dart';
import '../../../../../../generated/l10n.dart';

class AddIncomeView extends StatelessWidget {
  final bool isEditing;
  const AddIncomeView({super.key, this.isEditing = false});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    var cubit = LayoutCubit.get(context);
    return AddTransactionsView(
      isIncome: true,
      title: isEditing ? s.editIncomeTitle : s.addIncomeTitle,
      subTitle: s.addIncomeSubTitle,
      brief: s.notesIncomeBrief,
      amountTitle: s.enterIncomeAmount,
      categories: cubit.incomeCategories,
      buttonTitle: isEditing ? s.editIncomeButton : s.addIncomeButton,
      isEditing: isEditing,
    );
  }
}
