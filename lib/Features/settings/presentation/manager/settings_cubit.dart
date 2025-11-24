import 'settings_states.dart';
import 'package:flutter/material.dart';
import '../../data/repo/settings_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../splash/data/models/data_model.dart';
import '../../../splash/data/models/profile_model.dart';
import '../../../../core/services/service_locator.dart';

class SettingsCubit extends Cubit<SettingsStates> {
  final SettingsRepo settingsRepo;
  SettingsCubit({required this.settingsRepo}) : super(SettingsInitial()) {
    ServiceLocator.modelStream.listen((event) {
      emit(SetDataState());
    });
  }
  static SettingsCubit get(context) => BlocProvider.of(context);

  DataModel get dataModel => ServiceLocator.getDataModel();

  // General Data
  int salaryDay = 1;
  bool emptyAddData = true;
  var salaryController = TextEditingController();
  var userNameController = TextEditingController();
  var sideSalaryController = TextEditingController();
  var emailAddressController = TextEditingController();

  // General Methods

  void setUserInfoControllers() {
    var profile = dataModel.profile;
    salaryDay = profile.salaryDay;
    userNameController.text = profile.userName;
    salaryController.text = profile.salary.toString();
    sideSalaryController.text = profile.sideSalary.toString();
  }

  void setUserImage() {
    var userImage = ImagePicker().pickImage(source: ImageSource.gallery);
    userImage
        .then((value) {
          if (value != null) {
            emit(SettingsLoading());
            var data = settingsRepo.updateProfileImage(imagePath: value.path);
            data.fold((ifLeft) => emit(SettingsFailure(ifLeft.errMessage)), (
              ifRight,
            ) {
              ServiceLocator.updateDataModel(profile: ifRight.profile);
              emit(UserImagePickedSuccess());
            });
          }
        })
        .catchError((error) {
          emit(SettingsFailure(error.toString()));
        });
  }

  void addValidate() {
    var title = userNameController.text;
    var value = int.tryParse(salaryController.text) ?? 0;
    if (title.isEmpty && value == 0) {
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

  void setSalaryDay(int? value) {
    salaryDay = value ?? 1;
    addValidate();
  }

  void saveUserInfo() {
    emit(SettingsLoading());
    var prefile = setProfileData();
    var data = settingsRepo.updateProfileData(profile: prefile);
    data.fold((l) => emit(SettingsFailure(l.errMessage)), (r) {
      ServiceLocator.updateDataModel(profile: r.profile);
      emit(SettingsSuccess());
    });
  }

  ProfileModel setProfileData() {
    var dataModel = ServiceLocator.getDataModel();

    return dataModel.profile.copyWith(
      userName: userNameController.text,
      salary: double.parse(salaryController.text),
      sideSalary: double.parse(sideSalaryController.text),
      salaryDay: salaryDay,
    );
  }

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
    emit(SettingsLoading());
    final result = settingsRepo.changeLanguage(langI: langI, langC: langC);
    result.fold((failure) => emit(SettingsFailure(failure.errMessage)), (
      success,
    ) {
      ServiceLocator.updateDataModel(preferences: success.preferences);
      emit(SettingsSuccess());
    });
  }

  void changeTheme({required int themeI, required String theme}) async {
    emit(SettingsLoading());
    final result = settingsRepo.changeTheme(themeI: themeI, theme: theme);
    result.fold((failure) => emit(SettingsFailure(failure.errMessage)), (
      success,
    ) {
      ServiceLocator.updateDataModel(preferences: success.preferences);
      emit(SettingsSuccess());
    });
  }

  void changeNotificationsState({required bool notificationsEnabled}) async {
    emit(SettingsLoading());
    final result = settingsRepo.changeNotificationsStates(
      notificationsEnabled: notificationsEnabled,
    );
    result.fold((failure) => emit(SettingsFailure(failure.errMessage)), (
      success,
    ) {
      ServiceLocator.updateDataModel(preferences: success.preferences);
      emit(SettingsSuccess());
    });
  }
}
