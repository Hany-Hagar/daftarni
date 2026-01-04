import '../settings_item.dart';
import 'package:flutter/material.dart';
import '../../../../../../const_data/data.dart';
import '../../../manager/settings_cubit.dart';
import '../../../manager/settings_states.dart';
import '../../../../../../generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/services/service_locator.dart';

class SettingsBodyNotifications extends StatelessWidget {
  const SettingsBodyNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsStates>(
      builder: (context, state) {
        var s = S.of(context);
        var enableNotifications =
            ServiceLocator.getDataModel().preferences.enableNotifications;
        return SettingsItem(
          contentPadding: EdgeInsetsDirectional.only(start: 14.w, end: 3.w),
          iconColor: const Color(0xfffbb122),
          title: s.notifications,
          subTitle: s.notificationsHint,
          leadingIcon: Icons.notifications_outlined,
          trailingIcon: Transform.scale(
            scale: 0.85,
            child: Switch(
              value: enableNotifications,
              onChanged: (value) {
                changeNotificationsState(context, value);
              },
              activeTrackColor: incomeColor,
              activeThumbColor: Colors.white,
              inactiveThumbColor: Colors.grey.shade300,
              inactiveTrackColor: Colors.grey.shade700,

              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
          onTap: () {
            changeNotificationsState(context, !enableNotifications);
          },
        );
      },
    );
  }

  void changeNotificationsState(BuildContext context, bool value) {
    SettingsCubit.get(
      context,
    ).changeNotificationsState(notificationsEnabled: value);
  }
}
