import 'package:glass/glass.dart';
import 'analysis_transactions.dart';
import 'package:flutter/material.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../../core/utils/empty.dart';
import '../../../../../../core/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../data/models/analysis_category_model.dart';
import '../../../../../../core/services/service_locator.dart';
import '../../../../../layout/presentation/pages/widgets/custom_icon.dart';

class AnalysisCategories extends StatelessWidget {
  final List<AnalysisCategoryModel> models;
  const AnalysisCategories({super.key, required this.models});

  @override
  Widget build(BuildContext context) {
    return models.isEmpty
        ? Padding(
          padding: EdgeInsets.all(10.r),
          child: SizedBox(
            height: 150.h,
            child: Empty(state: EState.home),
          ).asGlass(clipBorderRadius: BorderRadius.circular(8.r)),
        )
        : ListView.separated(
          itemCount: models.length,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          separatorBuilder:
              (context, index) =>
                  Divider(height: 0.0, color: Colors.blueGrey.shade100),
          itemBuilder:
              (context, index) => _ReportCategory(model: models[index]),
        );
  }
}

class _ReportCategory extends StatelessWidget {
  final AnalysisCategoryModel model;
  const _ReportCategory({required this.model});

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    var color = Theme.of(context).scaffoldBackgroundColor;
    var categoryTitle =
        model.category.title[ServiceLocator.getDataModel().preferences.langI];
    return ExpansionTile(
      backgroundColor: color,
      collapsedBackgroundColor: color,
      shape: Border.all(color: Colors.transparent),
      tilePadding: EdgeInsets.symmetric(horizontal: 9.r),
      collapsedShape: Border.all(color: Colors.transparent),
      childrenPadding: EdgeInsets.only(bottom: 10.h, left: 8.w, right: 8.w),
      leading: CustomIcon(
        color: model.category.color,
        icon: model.category.icon.toIconData(),
      ),
      title: CustomText(isHead: true, title: categoryTitle, fontSize: 18),
      subtitle: CustomText(
        isHead: false,
        title: "${s.amount}: \$ ${model.totalValue}",
        fontSize: 16,
      ),
      children: [
        AnalysisTransactions(
          categoryTitle: categoryTitle,
          categoryValue: model.totalValue,
          transactions: model.transactions,
        ).asGlass(clipBorderRadius: BorderRadius.circular(8.r)),
      ],
    );
  }
}
