import '../settings_item.dart';
import 'package:flutter/material.dart';
import '../../../../../../Const/data.dart';
import '../../../../../../generated/l10n.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../Core/services/service_locator.dart';

class SettingsBodyNotifications extends StatelessWidget {
  const SettingsBodyNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return SettingsItem(
      contentPadding: EdgeInsetsDirectional.only(start: 14.w, end: 3.w),
      iconColor: const Color(0xfffbb122),
      title: s.Notifications,
      subTitle: s.notificationsHint,
      leadingIcon: Icons.notifications_outlined,
      trailingIcon: Transform.scale(
        scale: 0.85,
        child: Switch(
          value: ServiceLocator.getDataModel().preferences.enableNotifications,
          onChanged: (value) {},
          activeColor: Colors.white,
          activeTrackColor: incomeColor,
          inactiveThumbColor: Colors.grey.shade300,
          inactiveTrackColor: Colors.grey.shade700,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
      ),
      onTap: () {},
    );
  }
}
