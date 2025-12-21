import '../list/transactions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecentTransactionsBody extends StatelessWidget {
  const RecentTransactionsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(12.w), child: Transactions());
  }
}
