import 'package:flutter/material.dart';
import '../../../../../../core/utils/empty.dart';
import '../../../../../../../generated/l10n.dart';
import '../../../../../../../core/widgets/custom_text.dart';

class LayoutRecentTransactions extends StatelessWidget {
  const LayoutRecentTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(isHead: true, title: s.recentTransactions, fontSize: 22),
            GestureDetector(
              onTap: () {},
              child: CustomText(
                isHead: true,
                title: "${s.viewAll} >",
                fontColor: Theme.of(context).primaryColor,
                fontSize: 14,
              ),
            ),
          ],
        ),
        Empty(state: EState.home),
      ],
    );
  }
}
