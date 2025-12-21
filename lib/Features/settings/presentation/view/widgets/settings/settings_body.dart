// ignore_for_file: unused_element_parameter

import '../settings_item.dart';
import 'settings_body_lang.dart';
import 'settings_body_theme.dart';
import '../../pages/support_view.dart';
import 'package:flutter/material.dart';
import 'settings_body_notifications.dart';
import '../../pages/profile_info_view.dart';
import '../../pages/privacy_police_view.dart';
import '../../../manager/settings_cubit.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../../core/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/navigator_methods.dart';
import '../../../../../../core/services/service_locator.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: SingleChildScrollView(child: _Body()));
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    var data = ServiceLocator.getDataModel();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30.r),
          CustomText(isHead: true, fontSize: 25, title: s.personal),
          SizedBox(height: 10.r),
          SettingsItem(
            subTitle: s.personalInfo,
            title: data.profile.userName,
            leadingIcon: Icons.person_outlined,
            iconColor: Color(0xfff86889),
            onTap: () {
              SettingsCubit.get(context).setUserInfoControllers();
              NavTo.push(context: context, nextPage: const ProfileInfoView());
            },
          ),
          SizedBox(height: 10.r),
          CustomText(isHead: true, fontSize: 25, title: s.general),
          SizedBox(height: 10.h),
          SettingsBodyLang(),
          SizedBox(height: 10.h),
          SettingsBodyTheme(),
          SizedBox(height: 10.h),
          SettingsBodyNotifications(),
          SizedBox(height: 10.r),
          SettingsItem(
            title: s.privacyPolicy,
            subTitle: s.privacyPolicyHint,
            iconColor: Color(0xff22c3a1),
            leadingIcon: Icons.person_outlined,
            onTap:
                () =>
                    NavTo.push(context: context, nextPage: PrivacyPoliceView()),
          ),
          SizedBox(height: 12.r),
          SettingsItem(
            title: s.support,
            subTitle: s.supportHint,
            iconColor: Color(0xfff4639c),
            leadingIcon: Icons.contact_support_outlined,
            onTap: () => NavTo.push(context: context, nextPage: SupportView()),
          ),
        ],
      ),
    );
  }
}
