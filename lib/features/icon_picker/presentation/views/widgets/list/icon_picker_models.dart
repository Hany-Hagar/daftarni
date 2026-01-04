import 'package:flutter/material.dart';
import 'package:daftarni/core/utils/empty.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../manager/icon_picker_cubit.dart';
import '../../../manager/icon_picker_states.dart';
import '../../../../data/model/icon_picker_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconPickerModels extends StatelessWidget {
  final void Function(IconPickerModel) onPressed;
  const IconPickerModels({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IconPickerCubit, IconPickerStates>(
      builder: (context, state) {
        var cubit = IconPickerCubit.get(context);
        List<IconPickerModel> icons =
            cubit.isSearching ? cubit.searchIcons : cubit.icons;
        return icons.isNotEmpty
            ? _Items(icons: icons, onPressed: onPressed)
            : Empty(state: EState.search);
      },
    );
  }
}

class _Items extends StatelessWidget {
  final List<IconPickerModel> icons;
  final void Function(IconPickerModel) onPressed;

  const _Items({required this.icons, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      addRepaintBoundaries: false,
      addSemanticIndexes: false,
      itemCount: icons.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 1,
      ),
      itemBuilder:
          (context, index) => IconButton(
            onPressed: () {
              onPressed(icons[index]);
            },
            icon: Icon(icons[index].icon, size: 25.sp, color: Colors.blue),
          ),
    );
  }
}
