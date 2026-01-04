import 'package:flutter/widgets.dart';
import '../../../../../generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/configuration_cubit.dart';
import '../../manager/configuration_states.dart';
import '../../../../../Core/widgets/lang_button.dart';
import '../../../../../Core/widgets/custom_text.dart';
import '../../../../../Core/widgets/theme_button.dart';

class ConfigurationBodyAppSettings extends StatelessWidget {
  const ConfigurationBodyAppSettings({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    var cubit = ConfigurationCubit.get(context);
    return BlocBuilder<ConfigurationCubit, ConfigurationStates>(
      builder: (context, state) {
        return Column(
          children: [
            CustomText(isHead: true, title: s.appSettings),
            LangButton(
              onPressed: (index, value) {
                cubit.changeLanguage(value, index);
              },
            ),
            SizedBox(height: 5),
            ThemeButton(
              onPressed: (index, value) {
                cubit.changeTheme(value, index);
              },
            ),
            SizedBox(height: 20),
          ],
        );
      },
    );
  }
}
