import 'settings_states.dart';
import 'package:flutter/material.dart';
import '../../data/repo/settings_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../splash/data/models/data_model.dart';
import '../../../../core/services/service_locator.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final SettingsRepo settingsRepo;
  SettingsCubit({required this.settingsRepo}) : super(SettingsInitial()) {
    ServiceLocator.modelStream.listen((event) {
      emit(SetDataState());
    });
  }
  static SettingsCubit get(context) => BlocProvider.of(context);

  DataModel get dataModel => ServiceLocator.getDataModel();

  // Preferences Methods

  ThemeMode setThemeMode() {
    List<ThemeMode> themes = [
      ThemeMode.light,
      ThemeMode.dark,
      ThemeMode.system,
    ];
    return themes[dataModel.preferences.themeI];
  }
  

  void changeLanguage({required int langI, required String langC}) async {
    emit(LoadingState());
    final result = settingsRepo.changeLanguage(langI: langI, langC: langC);
    result.fold((failure) => emit(FailureState(failure.errMessage)), (success) {
      ServiceLocator.updateDataModel(success.preferences);
      emit(SuccessState());
    });
  }

  void changeTheme({required int themeI, required String theme}) async {
    emit(LoadingState());
    final result = settingsRepo.changeTheme(themeI: themeI, theme: theme);
    result.fold((failure) => emit(FailureState(failure.errMessage)), (success) {
      ServiceLocator.updateDataModel(success.preferences);
      emit(SuccessState());
    });
  }

  void changeNotificationsState({required bool notificationsEnabled}) async {
    emit(LoadingState());
    final result = settingsRepo.changeNotificationsStates(
      notificationsEnabled: notificationsEnabled,
    );
    result.fold((failure) => emit(FailureState(failure.errMessage)), (success) {
      ServiceLocator.updateDataModel(success.preferences);
      emit(SuccessState());
    });
  }
}
