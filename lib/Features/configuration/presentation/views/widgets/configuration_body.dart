import 'package:flutter/widgets.dart';
import '../../../../../generated/l10n.dart';
import 'configuration_body_app_settings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/configuration_cubit.dart';
import '../../manager/configuration_states.dart';
import '../../../../../Core/widgets/user_form.dart';
import '../../../../../Core/widgets/custom_text.dart';
import '../../../../../Core/widgets/custom_button.dart';

class ConfigurationBody extends StatelessWidget {
  const ConfigurationBody({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    var cubit = ConfigurationCubit.get(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(isHead: true, title: s.configureYourInfo),
        SizedBox(height: 20),
        UserForm(
          userNameController: cubit.userNameController,
          salaryController: cubit.salaryController,
          salaryDay: cubit.salaryDay,
          sideIncomeController: cubit.sideIncomeController,
          onChanged: () => cubit.validate(),
          onChangedDay: (p0) => cubit.changeSalaryDay(p0 ?? 1),
        ),
        SizedBox(height: 10),
        ConfigurationBodyAppSettings(),
        BlocBuilder<ConfigurationCubit, ConfigurationStates>(
          builder:
              (context, state) => CustomLoadingButton(
                isEnabled: !cubit.emptyAddData,
                isLoading: false,
                title: s.continueButton,
                onTap: () => cubit.configureInfo(),
              ),
        ),
      ],
    );
  }
}
