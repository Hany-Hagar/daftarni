import 'package:flutter/material.dart';
import '../widgets/configuration_body.dart';
import '../../manager/configuration_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/configuration_states.dart';
import '../../../../../core/widgets/back_ground.dart';
import '../../../data/repo/configuration_repo_impl.dart';
import '../../../../../core/utils/navigator_methods.dart';
import '../../../../../core/services/service_locator.dart';
import '../../../../layout/presentation/pages/views/layout_view.dart';

class ConfigurationView extends StatelessWidget {
  const ConfigurationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => ConfigurationCubit(
            configurationRepo: ConfigurationRepoImpl(
              hiveServices: ServiceLocator.getHiveServices(),
            ),
          ),
      child: BlocListener<ConfigurationCubit, ConfigurationStates>(
        listener: (context, state) {
          if (state is SuccessConfiguration) {
            NavTo.pushReplacement(context: context, nextPage: LayoutView());
          }
        },
        child: BackGround(
          top: SizedBox(height: MediaQuery.of(context).padding.top + 5),
          body: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(child: ConfigurationBody()),
          ),
        ),
      ),
    );
  }
}
