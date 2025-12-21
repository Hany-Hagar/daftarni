import '../list/transactions.dart';
import 'package:flutter/material.dart';
import '../../../manager/layout_cubit.dart';
import '../../../../../../../generated/l10n.dart';
import '../../views/recent_transactions_view.dart';
import '../../../../../../../core/widgets/custom_text.dart';
import '../../../../../../core/utils/navigator_methods.dart';

class LayoutRecentTransactions extends StatelessWidget {
  const LayoutRecentTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    var cubit = LayoutCubit.get(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(isHead: true, title: s.recentTransactions, fontSize: 22),
            GestureDetector(
              onTap: () {
                cubit.setFilterView();
                NavTo.push(
                  context: context,
                  nextPage: RecentTransactionsView(),
                );
              },
              child: CustomText(
                isHead: true,
                title: "${s.viewAll} >",
                fontColor: Theme.of(context).primaryColor,
                fontSize: 14,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Transactions(recentTransaction: true),
      ],
    );
  }
}
