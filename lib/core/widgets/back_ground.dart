import 'package:flutter/material.dart';
import 'package:glass/glass.dart';

class BackGround extends StatelessWidget {
  final Widget? top;
  final Widget body;
  final Widget? bottom;
  final Widget? floatingActionButton;
  const BackGround({
    super.key,
    this.top,
    required this.body,
    this.bottom,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          color: Theme.of(context).scaffoldBackgroundColor,
        ),

        // المحتوى الرئيسي
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [if (top != null) top!, Expanded(child: body)],
          ),
          bottomNavigationBar: bottom,
          floatingActionButton: floatingActionButton,
        ).asGlass(),
      ],
    );
  }
}
