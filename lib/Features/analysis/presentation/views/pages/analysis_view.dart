import '../widgets/download_icon.dart';
import 'package:flutter/material.dart';
import '../../manager/analysis_cubit.dart';
import '../../manager/analysis_states.dart';
import '../widgets/analysis/analysis_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/analysis/analysis_app_bar.dart';
import '../../../../../core/widgets/back_ground.dart';

class AnalysisView extends StatelessWidget {
  const AnalysisView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AnalysisCubit()..setData(),
      child: BlocBuilder<AnalysisCubit, AnalysisStates>(
        builder:
            (context, state) => BackGround(
              top: AnalysisAppBar(),
              body: SingleChildScrollView(child: AnalysisBody()),
              floatingActionButton: DownloadIcon(),
            ),
      ),
    );
  }
}
