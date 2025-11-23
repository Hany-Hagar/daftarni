import 'splash_states.dart';
import '../../data/repo/splash_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/services/service_locator.dart';

class SplashCubit extends Cubit<SplashState> {
  final SplashRepo splashRepo;

  SplashCubit({required this.splashRepo}) : super(InitialSplashState());

  static SplashCubit get(context) => BlocProvider.of<SplashCubit>(context);

  Future<void> getData() async {
    emit(LoadingSplashState());
    final result = await splashRepo.getData();
    result.fold(
      (failure) {
        emit(FailureSplashState(message: failure.errMessage));
      },
      (dataModel) {
        ServiceLocator.setDataModel(dataModel);
        if (dataModel.isFirstOpen) {
          emit(FirstOpenSplashState());
        } else {
          emit(SuccessSplashState());
        }
      },
    );
  }
}
