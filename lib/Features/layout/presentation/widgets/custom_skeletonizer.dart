import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomSkeletonizer extends StatelessWidget {
  final bool enable;
  final Widget child;
  const CustomSkeletonizer({
    super.key,
    required this.enable,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: enable,
      enableSwitchAnimation: true,
      switchAnimationConfig: SwitchAnimationConfig(
        duration: const Duration(milliseconds: 500),
        switchInCurve: Curves.easeIn,
        switchOutCurve: Curves.easeOut,
      ),
      child: child,
    );
  }
}