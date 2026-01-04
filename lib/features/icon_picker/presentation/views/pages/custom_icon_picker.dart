// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../../manager/icon_picker_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/custom_icon_picker_body.dart';
import '../../../data/model/icon_picker_model.dart';

class CustomIconPicker extends StatelessWidget {
  final void Function(IconPickerModel) onPressed;

  const CustomIconPicker({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IconPickerCubit(),
      child: Center(
        child: Material(
          type: MaterialType.transparency,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.8,
              maxWidth: MediaQuery.of(context).size.width * 0.85,
            ),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: CustomIconPickerBody(onPressed: onPressed),
            ),
          ),
        ),
      ),
    );
  }
}
