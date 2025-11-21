abstract class SplashState {}

class InitialSplashState extends SplashState {}

class LoadingSplashState extends SplashState {}

class FirstOpenSplashState extends SplashState {}

class SuccessSplashState extends SplashState {}

class FailureSplashState extends SplashState {
  final String message;

  FailureSplashState({required this.message});
}
