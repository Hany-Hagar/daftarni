import 'dart:developer';
import 'configuration_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repo/configuration_repo.dart';
import '../../../../../core/services/service_locator.dart';
import '../../../splash/data/models/data_model.dart';

class ConfigurationCubit extends Cubit<ConfigurationStates> {
  final ConfigurationRepo configurationRepo;

  ConfigurationCubit({required this.configurationRepo})
    : super(ConfigurationInitialState());

  static ConfigurationCubit get(context) => BlocProvider.of(context);

  DataModel get model => ServiceLocator.getDataModel();

  int salaryDay = 1;
  bool emptyAddData = true;
  var userNameController = TextEditingController();
  var salaryController = TextEditingController();
  var sideIncomeController = TextEditingController();

  void changeSalaryDay(int day) {
    salaryDay = day;
    emit(SetState());
  }

  void changeTheme(String themeMode, int themeI) {
    var data = configurationRepo.changeThemeMode(
      themeI: themeI,
      themeMode: themeMode,
    );

    data.fold(
      (failure) {
        emit(FailureChangeThemeState(errorMessage: failure.errMessage));
      },
      (success) {
        ServiceLocator.updateDataModel(preferences: success.preferences);
        emit(SuccessChangeThemeState());
      },
    );
  }

  void changeLanguage(String languageCode, int langI) {
    var data = configurationRepo.changeLanguageCode(
      langI: langI,
      languageCode: languageCode,
    );

    data.fold(
      (failure) {
        emit(FailureChangeLangState(errorMessage: failure.errMessage));
      },
      (success) {
        ServiceLocator.updateDataModel(preferences: success.preferences);
        log("Language changed to $languageCode successfully");
        emit(SuccessChangeLangState());
      },
    );
  }

  void validate() {
    var title = userNameController.text;
    var value = int.tryParse(salaryController.text) ?? 0;
    if (title.isEmpty || value == 0) {
      if (!emptyAddData) {
        emptyAddData = true;
        emit(SetState());
      }
    } else {
      if (emptyAddData) {
        emptyAddData = false;
        emit(SetState());
      }
    }
  }

  void configureInfo() {
    emit(LoadingCanfiguration());
    var nModel = setModel();
    var data = configurationRepo.configureInfo(data: nModel);
    data.fold(
      (failure) {
        emit(FailureConfiguration(errorMessage: failure.errMessage));
      },
      (success) {
        ServiceLocator.setDataModel(success);
        emit(SuccessConfiguration());
      },
    );
  }

  DataModel setModel() {
    var dataModel = ServiceLocator.getDataModel();
    var profile = dataModel.profile;
    var nProfile = profile.copyWith(
      userName: userNameController.text,
      salary: double.parse(salaryController.text),
      sideSalary: double.tryParse(sideIncomeController.text) ?? 0,
      salaryDay: salaryDay,
    );
    return dataModel.copyWith(profile: nProfile);

    // return dataModel.copyWith(profile: nProfile, isFirstOpen: false);
  }
}
