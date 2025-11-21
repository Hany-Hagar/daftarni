import 'package:flutter/material.dart';
import '../widgets/configuration_body.dart';
import '../../manager/configuration_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/configuration_states.dart';
import '../../../../../Core/widgets/back_ground.dart';
import '../../../data/repo/configuration_repo_impl.dart';
import '../../../../../Core/services/service_locator.dart';

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
          if (state is SuccessConfiguration) {}
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
