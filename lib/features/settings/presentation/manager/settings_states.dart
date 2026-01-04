abstract class SettingsStates {}

class SettingsInitial extends SettingsStates {}

class SetState extends SettingsStates {}

class SetDataState extends SettingsStates {}

class UserImagePickedSuccess extends SettingsStates {}

class SettingsLoading extends SettingsStates {}

class SettingsSuccess extends SettingsStates {}

class SettingsFailure extends SettingsStates {
  final String error;

  SettingsFailure(this.error);
}
