import 'custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomLoadingButton extends StatelessWidget {
  final bool isLoading;
  final bool isEnabled;
  final double? height;
  final Function()? onTap;
  final String? title;
  const CustomLoadingButton({
    super.key,
    this.height,
    this.isEnabled = true,
    required this.isLoading,
    this.onTap,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
          child: CircularProgressIndicator(
            color: Theme.of(context).primaryColor,
          ),
        )
        : IgnorePointer(
          ignoring: !isEnabled,
          child: Opacity(
            opacity: isEnabled ? 1 : 0.5,
            child: CustomButton(
              height: height,
              text: title ?? '',
              onPressed: onTap,
            ),
          ),
        );
  }
}

class CustomButton extends StatelessWidget {
  final double? width;
  final double? height;
  final bool borderColorOnly;
  final Color? backgroundColor;
  final String text;
  final IconData? icon;
  final double? iconSize;
  final Function()? onPressed;
  final Color? fontColor;
  final BorderRadiusGeometry borderRadius;

  const CustomButton({
    super.key,
    this.width,
    this.height,
    this.borderColorOnly = false,
    this.backgroundColor,
    required this.text,
    this.icon,
    this.iconSize,
    required this.onPressed,
    this.fontColor,
    this.borderRadius = const BorderRadius.all(Radius.circular(10)),
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      color: _setBgColor(context),
      minWidth: width ?? double.infinity,
      height: height?.h ?? 45.h,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius,
        side: BorderSide(
          color:
              borderColorOnly
                  ? _setColor(context)
                  : backgroundColor ?? Theme.of(context).primaryColor,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _setIcon(context),
          CustomText(
            isHead: true,
            title: text,
            fontColor: _setFontColor(context),
          ),
        ],
      ),
    );
  }

  _setBgColor(BuildContext context) {
    return borderColorOnly
        ? Colors.transparent
        : backgroundColor ?? Theme.of(context).primaryColor;
  }

  _setColor(BuildContext context) {
    return borderColorOnly
        ? backgroundColor ?? Theme.of(context).primaryColor
        : Theme.of(context).scaffoldBackgroundColor;
  }

  _setFontColor(BuildContext context) {
    return fontColor ??
        (borderColorOnly
            ? backgroundColor ?? Theme.of(context).primaryColor
            : Colors.white);
  }

  _setIcon(BuildContext context) {
    return icon != null
        ? Padding(
          padding: EdgeInsetsDirectional.only(end: 8.w),
          child: Icon(
            icon,
            size: iconSize ?? 20.sp,
            color: _setFontColor(context),
          ),
        )
        : const SizedBox();
  }
}
