import '../widgets/splash_body.dart';
import 'package:flutter/material.dart';
import 'package:daftarni/back_ground.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BackGround(body: SplashBody());
  }
}
