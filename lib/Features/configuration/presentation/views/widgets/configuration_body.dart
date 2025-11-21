import 'package:daftarni/Core/widgets/custom_button.dart';
import 'package:flutter/widgets.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../Core/widgets/userForm.dart';
import '../../../../../Core/widgets/custom_text.dart';
import '../../../../../Core/widgets/lang_button.dart';
import '../../../../../Core/widgets/theme_button.dart';

class ConfigurationBody extends StatelessWidget {
  const ConfigurationBody({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(isHead: true, title: s.configureYourInfo),
        SizedBox(height: 20),
        UserForm(
          userNameController: TextEditingController(),
          salaryController: TextEditingController(),
          salaryDay: 1,
          sideIncomeController: TextEditingController(),
          onChanged: () {},
          onChangedDay: (value) {},
        ),
        SizedBox(height: 10),
        CustomText(isHead: true, title: s.appSettings),
        LangButton(),
        SizedBox(height: 5),
        ThemeButton(),
        SizedBox(height: 20),
        CustomLoadingButton(
          isEnabled: true,
          isLoading: false,
          title: s.continueButton,
          onTap: () {},
        ),
      ],
    );
  }
}
