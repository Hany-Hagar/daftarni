import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../../../../../core/utils/empty.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../data/models/analysis_category_model.dart';
import '../../../../../../core/services/service_locator.dart';

class AnalysisChart extends StatelessWidget {
  final String title;
  final List<AnalysisCategoryModel> transactions;
  const AnalysisChart({
    super.key,
    required this.title,
    required this.transactions,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        children: [
          SizedBox(height: 10.h),
          CustomText(isHead: true, title: title),
          SizedBox(height: 10.h),
          SizedBox(
            height: 100.h,
            child:
                transactions.isEmpty
                    ? Empty(state: EState.home)
                    : PieChart(
                      PieChartData(
                        sections: [
                          ...List.generate(
                            transactions.length,
                            (index) => _item(
                              context: context,
                              model: transactions[index],
                            ),
                          ),
                        ],
                        centerSpaceRadius: 20.r,
                      ),
                      duration: Duration(milliseconds: 150),
                      curve: Curves.linear,
                    ),
          ),
        ],
      ),
    );
  }
}

PieChartSectionData _item({
  required BuildContext context,
  required AnalysisCategoryModel model,
}) {
  int langId = ServiceLocator.getDataModel().preferences.langI;

  return PieChartSectionData(
    radius: 40,
    showTitle: false,
    title: model.category.title[langId],
    color: Color(model.category.color),
    titleStyle: Styles.textStyle600.copyWith(fontSize: 16.sp),
  );
}
