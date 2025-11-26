// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomIcon extends StatelessWidget {
  final int color;
  final double readius;
  final IconData icon;
  final double iconSize;

  const CustomIcon({
    super.key,
    required this.color,
    this.readius = 8,
    required this.icon,
    this.iconSize = 22.0,
  });

  @override
  Widget build(BuildContext context) {
    return Skeleton.shade(
      child: Container(
        padding: EdgeInsets.all(8.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(readius.sp),
          gradient: LinearGradient(
            colors: [Color(color).withOpacity(0.3), Color(color)],
          ),
        ),
        child: Icon(icon, size: iconSize.sp, color: Colors.white),
      ),
    );
  }
}
