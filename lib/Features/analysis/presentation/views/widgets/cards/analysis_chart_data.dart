import 'package:flutter/material.dart';
import '../../../manager/analysis_cubit.dart';
import '../../../../../../core/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/services/service_locator.dart';
import '../../../../data/models/analysis_category_model.dart';

class AnalysisChartData extends StatelessWidget {
  const AnalysisChartData({super.key});

  @override
  Widget build(BuildContext context) {
    var langId = ServiceLocator.getDataModel().preferences.langI;
    var analysisCubit = AnalysisCubit.get(context);
    List<AnalysisCategoryModel> transactions = [
      ...analysisCubit.analysisIncomes,
      ...analysisCubit.analysisExpenses,
    ];
    return GridView.builder(
      shrinkWrap: true,
      clipBehavior: Clip.none,
      padding: EdgeInsets.only(bottom: 10.h),
      itemCount: transactions.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 4.8,
        mainAxisSpacing: 5.h,
      ),
      itemBuilder:
          (context, index) => Row(
            children: [
              Container(
                width: 18.w,
                height: 15.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  color: Color(transactions[index].category.color),
                  border: Border.all(
                    width: 3,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              CustomText(
                isHead: true,
                fontSize:
                    transactions[index].category.title[langId].length > 9
                        ? 15
                        : 18,
                title: transactions[index].category.title[langId],
              ),
            ],
          ),
    );
  }
}
