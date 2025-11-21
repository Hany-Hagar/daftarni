// ignore_for_file: unused_element_parameter

import 'package:daftarni/Core/services/service_locator.dart';

import 'custom_text.dart';
import 'toggle_button.dart';
import '../../generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThemeButton extends StatelessWidget {
  final double? width;
  final bool isInDropDown;
  final dynamic Function(int)? onPressed;
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
        if (!isInDropDown) CustomText(isHead: true, title: s.theme),
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
  final dynamic Function(int)? onPressed;
  const _Button({this.width, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    List<String> data = [s.lightTheme, s.darkTheme, s.systemTheme];

    return MToggleButton(
      texts: data,
      width: width,
      currentSelect: ServiceLocator.getDataModel().preferences.themeI,
      fontSize:
          ServiceLocator.getDataModel().preferences.langI == 0 ? 19.sp : 25.sp,
      onPressed: onPressed,
    );
  }
}
