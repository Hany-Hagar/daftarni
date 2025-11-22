// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../../../../../../core/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

var _boder = RoundedRectangleBorder(
  side: BorderSide.none,
  borderRadius: BorderRadius.circular(12.r),
);

class AnimatedSettingsItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final String? subTitle;
  final Widget child;
  final ExpansionTileController? controller;
  const AnimatedSettingsItem({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    this.subTitle,
    required this.child,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      shape: _boder,
      controller: controller,
      collapsedShape: _boder,
      leading: _LeadingIcon(icon: icon, color: color),
      title: CustomText(isHead: true, fontSize: 23, title: title, maxLines: 2),
      subtitle:
          subTitle != null
              ? CustomText(fontSize: 18, title: subTitle!, maxLines: 2)
              : null,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      collapsedBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
      children: [child],
    );
  }
}

class SettingsItem extends StatelessWidget {
  final String title;
  final IconData leadingIcon;
  final Color iconColor;
  final String? subTitle;
  final Widget? trailingIcon;
  final EdgeInsetsGeometry? contentPadding;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  const SettingsItem({
    super.key,
    this.onTap,
    this.subTitle,
    required this.title,
    required this.leadingIcon,
    required this.iconColor,
    this.trailingIcon,
    this.contentPadding,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding:
          contentPadding ?? EdgeInsetsDirectional.only(start: 14.w, end: 10.w),
      tileColor: backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      shape: _boder,
      leading: _LeadingIcon(icon: leadingIcon, color: iconColor),
      title: CustomText(isHead: true, fontSize: 25, title: title),
      subtitle:
          subTitle != null ? CustomText(fontSize: 18, title: subTitle!) : null,
      trailing: trailingIcon ?? Icon(Icons.arrow_forward_ios, size: 20.r),
      onTap: onTap,
    );
  }
}

class _LeadingIcon extends StatelessWidget {
  final IconData icon;
  final Color color;

  const _LeadingIcon({required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6.r),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Icon(icon, size: 30.r, color: color),
    );
  }
}
