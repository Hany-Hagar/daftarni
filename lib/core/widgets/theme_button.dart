// ignore_for_file: unused_element_parameter

import 'custom_text.dart';
import 'toggle_button.dart';
import '../../const_data/data.dart';
import '../../generated/l10n.dart';
import 'package:flutter/material.dart';
import '../services/service_locator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThemeButton extends StatelessWidget {
  final double? width;
  final bool isInDropDown;
  final void Function(int index, String value)? onPressed;
  const ThemeButton({
    super.key,
    this.width,
    this.isInDropDown = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!isInDropDown) CustomText(isHead: true, title: s.Theme),
        if (!isInDropDown) SizedBox(height: 5.h),
        Align(
          alignment: Alignment.center,
          child: _Button(width: width, onPressed: onPressed),
        ),
      ],
    );
  }
}

class _Button extends StatelessWidget {
  final double? width;
  final void Function(int index, String value)? onPressed;
  const _Button({this.width, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    List<String> data = [s.lightTheme, s.darkTheme, s.systemTheme];
    List<String> codes = [lightTheme, darkTheme, systemTheme];

    return MToggleButton(
      texts: data,
      width: width,
      currentSelect: ServiceLocator.getDataModel().preferences.themeI,
      fontSize:
          ServiceLocator.getDataModel().preferences.langI == 0 ? 19.sp : 25.sp,
      onPressed: (index) {
        onPressed!(index, codes[index]);
      },
    );
  }
}
