// ignore_for_file: deprecated_member_use

import 'styles.dart';
import 'navigator_methods.dart';
import '../../generated/l10n.dart';
import 'package:lottie/lottie.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../features/icon_picker/presentation/views/pages/custom_Icon_picker.dart';

class DialogServices {
  static showCleanDialog({
    required BuildContext context,
    required Widget child,
    bool barrierDismissible = true,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierColor: Colors.black.withOpacity(0.4),
      builder: (_) {
        return Center(
          child: Material(
            type: MaterialType.transparency,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.93,
                maxWidth: MediaQuery.of(context).size.width,
              ),
              child: Column(mainAxisSize: MainAxisSize.min, children: [child]),
            ),
          ),
        );
      },
    );
  }

  static showStateDialog({
    required BuildContext context,
    required DialogState state,
    required String message,
  }) async {
    return await showDialog(
      context: context,
      builder: (context) => _DialogStateBody(state: state, text: message),
    );
  }

  static void showDeleteDialog({
    required BuildContext context,
    required Function() onTap,
  }) {
    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.4),
      builder:
          (context) => Dialog(
            insetPadding: EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.all(12.r),
                  child: _DeleteBody(onPressed: onTap),
                ),
              ],
            ),
          ),
    );
    //  showCleanDialog(context: context, child: _DeleteBody(onPressed: onTap));
  }

  static iconPicker({required BuildContext context}) async {
    return await showDialog(
      context: context,
      builder:
          (context) => CustomIconPicker(
            onPressed: (p0) {
              Navigator.of(context).pop(p0);
            },
          ),
    );
  }

  static datePicker({
    required BuildContext context,
    required DateTime initialDate,
    required DateTime firstDate,
    required DateTime lastDate,
  }) async {
    return await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: lastDate,
      initialDate: initialDate,
      initialEntryMode: DatePickerEntryMode.calendar,
    );
  }

  static showColorDialog({
    required BuildContext context,
    required Color color,
  }) async {
    return await showColorPickerDialog(context, color);
  }
}

enum DialogState { alert, success, failure }

class _DialogStateBody extends StatelessWidget {
  final DialogState state;
  final String text;

  const _DialogStateBody({required this.state, required this.text});

  @override
  Widget build(BuildContext context) {
    String icon;
    Color color;

    switch (state) {
      case DialogState.success:
        icon = "assets/lotties/Success.json";
        color = Colors.green;
        break;
      case DialogState.failure:
        icon = "assets/lotties/Error.json";
        color = Colors.redAccent;

        break;
      case DialogState.alert:
        icon = "assets/lotties/Alert.json";
        color = Colors.grey;

        break;
    }

    return Center(
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            width: double.infinity,
            height: 80.h,
            margin: EdgeInsets.symmetric(horizontal: 12.sp),
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 22.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            child: Scaffold(
              body: Center(
                child: CustomText(
                  isHead: true,
                  title: text,
                  fontSize: 20,
                  fontColor: color,
                  maxLines: 3,
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(0, -60.r),
            child: LottieBuilder.asset(icon, width: 100.r),
          ),
        ],
      ),
    );
  }
}

class _DeleteBody extends StatelessWidget {
  final Function() onPressed;
  const _DeleteBody({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Column(
      children: [
        SizedBox(height: 8.h),
        Container(
          padding: EdgeInsets.all(10.r),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color.fromARGB(79, 255, 139, 128),
          ),
          child: Center(
            child: Icon(Icons.warning, color: Colors.redAccent, size: 30.r),
          ),
        ),
        SizedBox(height: 10.h),
        CustomText(isHead: true, title: s.deleteDialogTitle, fontSize: 17),
        SizedBox(height: 5.h),
        CustomText(isHead: true, title: s.deleteDialogContent, fontSize: 17),
        SizedBox(height: 20.h),
        Row(
          children: [
            Expanded(
              child: CustomButton(
                icon: Icons.delete,
                text: s.delete,
                onPressed: onPressed,
                backgroundColor: Styles.green,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: CustomButton(
                text: s.close,
                icon: Icons.close,
                backgroundColor: Styles.red,
                onPressed: () {
                  NavTo.pop(context);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
