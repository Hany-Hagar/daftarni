import 'icon_picker_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/icon_picker_model.dart';

class IconPickerCubit extends Cubit<IconPickerStates> {
  IconPickerCubit() : super(IconPickerInitialState());

  static IconPickerCubit get(BuildContext context) => BlocProvider.of(context);

  // Generale Data
  bool isSearching = false;
  var searchController = TextEditingController();
  List<IconPickerModel> icons = [...financeIcons];
  List<IconPickerModel> searchIcons = [];

  /// General Methods

  Future<void> searchIconsFunc() async {
    searchState();

    searchIcons =
        financeIcons.where((icon) {
          final query = searchController.text.toLowerCase();
          return icon.titles.any(
            (title) => title.toLowerCase().contains(query),
          );
        }).toList();
    emit(SearchState());
  }

  void searchState() {
    searchIcons.clear();
    var value = searchController.text;
    if (value.isEmpty) {
      if (isSearching) {
        isSearching = false;
        emit(SetState());
      }
    } else {
      if (!isSearching) {
        isSearching = true;
        emit(SetState());
      }
    }
  }

  void clearSearch() {
    searchController.clear();
    isSearching = false;
    emit(SetState());
  }
}
