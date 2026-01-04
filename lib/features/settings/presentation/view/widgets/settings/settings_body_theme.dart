import '../settings_item.dart';
import 'package:flutter/material.dart';
import '../../../manager/settings_cubit.dart';
import '../../../manager/settings_states.dart';
import '../../../../../../generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/widgets/theme_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/services/service_locator.dart';

class SettingsBodyTheme extends StatelessWidget {
  const SettingsBodyTheme({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsStates>(
      builder: (context, state) {
        var s = S.of(context);
        final subTitles = [s.lightTheme, s.darkTheme, s.systemTheme];
        final subTitle =
            subTitles[ServiceLocator.getDataModel().preferences.themeI];
        return AnimatedSettingsItem(
          title: s.Theme,
          subTitle: subTitle,
          icon: Icons.brightness_4_outlined,
          color: Color(0xffa57bf9),
          child: Padding(
            padding: EdgeInsets.only(
              top: 0,
              left: 10.w,
              right: 10.w,
              bottom: 12.h,
            ),
            child: ThemeButton(
              isInDropDown: true,
              width: MediaQuery.sizeOf(context).width - 55.w,
              onPressed: (int themeI, String theme) {
                SettingsCubit.get(
                  context,
                ).changeTheme(themeI: themeI, theme: theme);
              },
            ),
          ),
        );
      },
    );
  }
}
