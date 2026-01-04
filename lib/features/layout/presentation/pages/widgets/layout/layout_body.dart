import 'layout_quick_actions.dart';
import 'layout_current_balance.dart';
import 'package:flutter/material.dart';
import 'layout_recent_transactions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LayoutBody extends StatelessWidget {
  const LayoutBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
      child: Column(
        children: [
          SizedBox(height: 10),
          LayoutCurrentBalance(),
          SizedBox(height: 15),
          LayoutQuickActions(),
          SizedBox(height: 15),
          LayoutRecentTransactions(),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
