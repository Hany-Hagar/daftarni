import 'package:flutter/material.dart';
import '../../../../../core/utils/navigator_methods.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavPopIcon extends StatelessWidget {
  final double? size;
  final Color? color;
  final bool? mini;
  final Function()? onPressed;
  const NavPopIcon({
    super.key,
    this.size,
    this.color,
    this.mini,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return FloatingActionButton(
      backgroundColor: theme.scaffoldBackgroundColor,
      mini: mini ?? true,
      onPressed: () {
        NavTo.pop(context);
        onPressed?.call();
      },
      child: Icon(
        Icons.arrow_back_ios_new,
        size: size ?? 20.sp,
        color: color ?? theme.hintColor,
      ),
    );
  }
}
