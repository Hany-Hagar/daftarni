// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../lists/analysis_categories.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../../core/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../data/models/analysis_category_model.dart';

class AnalysisBalanceCard extends StatelessWidget {
  final String emoji;
  final String title;
  final Color color;
  final double amount;
  final List<AnalysisCategoryModel> models;
  const AnalysisBalanceCard({
    super.key,
    required this.emoji,
    required this.title,
    required this.color,
    required this.amount,
    required this.models,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    var fColor = Theme.of(context).scaffoldBackgroundColor;
    return Padding(
      padding: EdgeInsets.all(10.w),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.r),
        child: Column(
          children: [
            ColoredBox(
              color: color,
              child: ListTile(
                leading: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: CustomText(
                    isHead: true,
                    title: emoji,
                    fontSize: 24,
                    fontColor: fColor,
                  ),
                ),
                title: CustomText(
                  title: title,
                  isHead: true,
                  fontColor: fColor,
                ),
                subtitle: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  spacing: 10.w,
                  children: [
                    CustomText(
                      isHead: true,
                      title: "${s.amount}:",
                      fontSize: 18,
                      fontColor: fColor,
                    ),
                    CustomText(
                      isHead: true,
                      title: "\$$amount",
                      fontColor: fColor,
                    ),
                  ],
                ),
              ),
            ),
            AnalysisCategories(models: models),
          ],
        ),
      ),
    );
  }
}
