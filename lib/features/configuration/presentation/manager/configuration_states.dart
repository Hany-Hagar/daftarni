abstract class ConfigurationStates {}

class ConfigurationInitialState extends ConfigurationStates {}

class SetState extends ConfigurationStates {}

class ChangeModel extends ConfigurationStates {}

class SuccessChangeThemeState extends ConfigurationStates {}

class FailureChangeThemeState extends ConfigurationStates {
  final String errorMessage;
  FailureChangeThemeState({required this.errorMessage});
}

class SuccessChangeLangState extends ConfigurationStates {}

class FailureChangeLangState extends ConfigurationStates {
  final String errorMessage;
  FailureChangeLangState({required this.errorMessage});
}

class ConfigurationChangeLanguageState extends ConfigurationStates {}

class LoadingCanfiguration extends ConfigurationStates {}

class SuccessConfiguration extends ConfigurationStates {}

class FailureConfiguration extends ConfigurationStates {
  final String errorMessage;
  FailureConfiguration({required this.errorMessage});
}
