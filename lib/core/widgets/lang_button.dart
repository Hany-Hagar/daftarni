import 'custom_text.dart';
import 'toggle_button.dart';
import '../../const_data/data.dart';
import '../../generated/l10n.dart';
import 'package:flutter/material.dart';
import '../services/service_locator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LangButton extends StatelessWidget {
  final double? width;
  final bool isInDropDown;
  final void Function(int index, String value)? onPressed;
  const LangButton({
    super.key,
    this.isInDropDown = false,
    this.width,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!isInDropDown) CustomText(isHead: true, title: s.Language),
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

  const _Button({required this.width, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    List<String> data = [s.english, s.arabic];
    List<String> codes = [enCode, arCode];

    return MToggleButton(
      width: width,
      texts: data,
      currentSelect: ServiceLocator.getDataModel().preferences.langI,
      onPressed: (index) {
        onPressed!(index, codes[index]);
      },
    );
  }
}
