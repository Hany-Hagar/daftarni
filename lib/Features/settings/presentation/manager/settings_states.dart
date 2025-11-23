abstract class SettingsState {}

class SettingsInitial extends SettingsState {}

class SetDataState extends SettingsState {}

class LoadingState extends SettingsState {}

class SuccessState extends SettingsState {}

class FailureState extends SettingsState {
  final String message;

  FailureState(this.message);
}
