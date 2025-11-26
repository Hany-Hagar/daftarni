import 'package:lottie/lottie.dart';
import '../widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_iconpicker/Models/configuration.dart';

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
                maxHeight: MediaQuery.of(context).size.height * 0.9,
                maxWidth: MediaQuery.of(context).size.width,
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: child,
              ),
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

  static showIconPickerDialog({
    required BuildContext context,
    bool adaptiveDialog = true,
    bool barrierDismissible = true,
    String? title,
    String? searchHintText,
    required String closeText,
  }) async {
    var theme = Theme.of(context);
    return await showIconPicker(
      context,
      configuration: SinglePickerConfiguration(
        iconSize: 45.0.r,
        showTooltips: true,
        iconColor: Colors.blue,
        adaptiveDialog: adaptiveDialog,
        iconPackModes: [IconPack.allMaterial],
        barrierDismissible: barrierDismissible,
        backgroundColor: theme.scaffoldBackgroundColor,
        title: CustomText(
          isHead: false,
          title: title ?? "Pick an Icon",
          fontSize: 25,
        ),
        searchHintText: searchHintText ?? "Search Icon ....",
        closeChild: CustomText(isHead: false, title: closeText, fontSize: 18),
      ),
    );
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
