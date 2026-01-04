import 'package:pdf/pdf.dart';
import '../../../../../const_data/app.dart';
import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import '../../manager/analysis_cubit.dart';
import '../../manager/analysis_states.dart';
import '../../../../../generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/back_ground.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../core/widgets/nav_pop_icon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DownloadReportView extends StatelessWidget {
  final bool isMonthlyReport;
  const DownloadReportView({super.key, this.isMonthlyReport = true});

  @override
  Widget build(BuildContext context) {
    return isMonthlyReport
        ? BlocProvider(
          create: (context) => AnalysisCubit(),
          child: _Body(isMonthlyReport: isMonthlyReport),
        )
        : _Body(isMonthlyReport: isMonthlyReport);
  }
}

class _Body extends StatelessWidget {
  final bool isMonthlyReport;
  const _Body({required this.isMonthlyReport});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnalysisCubit, AnalysisStates>(
      builder: (context, state) {
        final cubit = AnalysisCubit.get(context);
        return BackGround(
          top: _Top(isMonthlyReport: isMonthlyReport),
          body: PdfPreview(
            initialPageFormat: PdfPageFormat.a4,
            build:
                (format) =>
                    isMonthlyReport
                        ? cubit.downloadMonthlyReport()
                        : cubit.downloadAnalysisReport(),
          ),
        );
      },
    );
  }
}

class _Top extends StatelessWidget {
  final bool isMonthlyReport;

  const _Top({required this.isMonthlyReport});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: defaultAppBarPadding,
      color: Theme.of(context).primaryColor,
      child: Row(
        children: [
          NavPopIcon(color: Colors.white),
          Spacer(flex: 2),
          CustomText(
            isHead: true,
            fontSize: 24.sp,
            title:
                isMonthlyReport
                    ? S.current.monthlyReportViewTitle
                    : S.current.analysisReportViewTitle,
          ),
          Spacer(flex: 3),
        ],
      ),
    );
  }
}
