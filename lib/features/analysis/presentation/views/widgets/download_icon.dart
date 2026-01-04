import 'package:flutter/material.dart';
import '../../manager/analysis_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../views/pages/download_report_view.dart';
import '../../../../../core/utils/navigator_methods.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DownloadIcon extends StatelessWidget {
  final void Function()? onPressed;
  const DownloadIcon({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return FloatingActionButton(
      onPressed: () {
        NavTo.push(
          context: context,
          nextPage: BlocProvider.value(
            value: AnalysisCubit.get(context),
            child: const DownloadReportView(isMonthlyReport: false),
          ),
        );
      },
      heroTag: 'download_report',
      backgroundColor: theme.cardColor,
      child: Icon(Icons.download_outlined, size: 26.sp, color: theme.hintColor),
    );
  }
}
