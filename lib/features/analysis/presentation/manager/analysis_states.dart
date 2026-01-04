abstract class AnalysisStates {}

class AnalysisInitialState extends AnalysisStates {}

class ApplyFilterLoading extends AnalysisStates {}

class ApplyFilterSuccess extends AnalysisStates {}

class SetState extends AnalysisStates {}

class DownloadReportLoading extends AnalysisStates {}

class DownloadReportSuccess extends AnalysisStates {}

class DownloadReportError extends AnalysisStates {
  final String error;
  DownloadReportError(this.error);
}

class AnalysisLoadingState extends AnalysisStates {}

class AnalysisSuccessState extends AnalysisStates {}

class AnalysisErrorState extends AnalysisStates {
  final String error;

  AnalysisErrorState(this.error);
}
