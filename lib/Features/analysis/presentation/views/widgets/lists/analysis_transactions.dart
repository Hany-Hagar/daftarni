// ignore_for_file: deprecated_member_use

import 'package:glass/glass.dart';
import 'package:flutter/material.dart';
import '../../../manager/analysis_cubit.dart';
import '../../../../../../core/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../layout/data/models/transaction_model.dart';

class AnalysisTransactions extends StatelessWidget {
  final String categoryTitle;

  final double categoryValue;
  final List<TransactionModel> transactions;
  const AnalysisTransactions({
    super.key,
    required this.categoryTitle,
    required this.transactions,
    required this.categoryValue,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: transactions.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: 10.h),
      separatorBuilder: (context, index) => SizedBox(height: 5.h),
      itemBuilder:
          (context, index) => _AnalysisTransaction(
            categoryTitle: categoryTitle,
            categoryValue: categoryValue,
            transaction: transactions[index],
          ),
    ).asGlass(clipBorderRadius: BorderRadius.circular(8.r));
  }
}

class _AnalysisTransaction extends StatelessWidget {
  final String categoryTitle;
  final double categoryValue;
  final TransactionModel transaction;
  const _AnalysisTransaction({
    required this.categoryTitle,
    required this.categoryValue,
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = AnalysisCubit.get(context);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      child: ListTile(
        tileColor: Theme.of(context).scaffoldBackgroundColor,
        contentPadding: EdgeInsetsDirectional.only(start: 10.w, end: 10.w),
        title: Row(
          children: [
            Expanded(
              child: CustomText(
                title:
                    transaction.notes.isEmpty
                        ? categoryTitle
                        : transaction.notes,
                isHead: true,
              ),
            ),
            CircleAvatar(
              radius: 20.r,
              backgroundColor: Color(
                transaction.category.color,
              ).withOpacity(0.2),
              child: Center(
                child: CustomText(
                  title: cubit.setAnalysisTransactionTime(
                    date: transaction.time,
                  ),
                  fontSize: 17,
                ),
              ),
            ),
          ],
        ),
        subtitle: Row(
          children: [
            Expanded(
              child: LinearProgressIndicator(
                value: transaction.value / categoryValue,
                backgroundColor: Theme.of(context).dividerColor,
                color: Color(transaction.category.color),
                minHeight: 10,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            SizedBox(width: 8.w),
            CustomText(
              title: "\$${transaction.value.toStringAsFixed(2)}",
              fontSize: 18,
            ),
          ],
        ),
      ),
    );
  }
}
