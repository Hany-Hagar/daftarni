import 'package:flutter/material.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});
  @override
  Widget build(BuildContext context) {
    final image = "assets/images/appLogo.png";
    final imageHeight = MediaQuery.sizeOf(context).height * 0.0016;
    final textHeight = MediaQuery.sizeOf(context).height * 0.005;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TweenAnimationBuilder<Offset>(
          tween: Tween(begin: Offset(0, 0), end: Offset(0, -imageHeight)),
          duration: Duration(seconds: 3),
          curve: Curves.easeOut,
          builder: (context, value, child) {
            return SlideTransition(
              position: AlwaysStoppedAnimation(value),
              child: Align(alignment: Alignment.center, child: child),
            );
          },
          child: Center(
            child: SizedBox(width: 175, height: 175, child: Image.asset(image)),
          ),
        ),
        TweenAnimationBuilder<Offset>(
          tween: Tween(begin: Offset(0, 0), end: Offset(0, textHeight)),
          duration: Duration(seconds: 3),
          curve: Curves.easeOut,
          builder: (context, value, child) {
            return SlideTransition(
              position: AlwaysStoppedAnimation(value),
              child: Align(alignment: Alignment.center, child: child),
            );
          },
          child: Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(color: Colors.green),
            ),
          ),
        ),
      ],
    );
  }
}
