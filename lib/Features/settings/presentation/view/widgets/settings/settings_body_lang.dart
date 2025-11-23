import '../settings_item.dart';
import 'package:flutter/material.dart';
import '../../../manager/settings_cubit.dart';
import '../../../manager/settings_states.dart';
import '../../../../../../generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/widgets/lang_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/services/service_locator.dart';

class SettingsBodyLang extends StatelessWidget {
  const SettingsBodyLang({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsStates>(
      builder: (context, state) {
        var s = S.of(context);
        var cubit = SettingsCubit.get(context);
        final subTitles = [s.english, s.arabic];
        final subTitle =
            subTitles[ServiceLocator.getDataModel().preferences.langI];
        return AnimatedSettingsItem(
          title: s.Language,
          subTitle: subTitle,
          icon: Icons.language,
          color: Colors.blue,
          child: Padding(
            padding: EdgeInsets.only(
              top: 0,
              left: 10.w,
              right: 10.w,
              bottom: 12.h,
            ),
            child: LangButton(
              isInDropDown: true,
              onPressed: (int langI, String langC) {
                cubit.changeLanguage(langI: langI, langC: langC);
              },
              width: MediaQuery.sizeOf(context).width - 55.w,
            ),
          ),
        );
      },
    );
  }
}
