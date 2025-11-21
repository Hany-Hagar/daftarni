import '../widgets/splash_body.dart';
import 'package:flutter/material.dart';
import '../../manager/splash_cubit.dart';
import '../../manager/splash_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repo/splash_repo_impl.dart';
import 'package:daftarni/Core/widgets/back_ground.dart';
import '../../../../../Core/utils/navigator_methods.dart';
import '../../../../../Core/services/service_locator.dart';
import '../../../../onBoarding/presentation/pages/on_boarding_view.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => SplashCubit(
            splashRepo: SplashRepoImpl(ServiceLocator.getHiveServices()),
          )..getData(),
      child: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is FirstOpenSplashState) {
            NavTo.pushReplacement(context: context, nextPage: OnBoardingView());
          }
          if (state is SuccessSplashState) {}
          if (state is FailureSplashState) {}
        },
        child: const BackGround(body: SplashBody()),
      ),
    );
  }
}
