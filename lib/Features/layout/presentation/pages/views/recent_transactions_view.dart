import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../core/widgets/back_ground.dart';
import '../widgets/recent transactions/search_bar.dart';
import '../widgets/recent transactions/recent_transactions_body.dart';

class RecentTransactionsView extends StatelessWidget {
  const RecentTransactionsView({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return BackGround(
      top: CustomSearchAppBar(
        title: s.transactions,
        searchHint: s.transactionsSearchHint,
        applyPressed: () {},
      ),
      body: RecentTransactionsBody(),
    );
  }
}
