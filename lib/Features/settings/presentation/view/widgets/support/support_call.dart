// ignore_for_file: deprecated_member_use

import '../settings_item.dart';
import 'package:flutter/material.dart';
import '../../../../../../generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../data/model/support_call_models.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SupportCall extends StatelessWidget {
  const SupportCall({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = ExpansionTileController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.expand();
    });
    final s = S.of(context);
    var supportList = supportCallList(context: context);
    return Column(
      children: [
        SizedBox(height: 20.r),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.r),
          child: AnimatedSettingsItem(
            controller: controller,
            title: s.contactUsTitle,
            icon: Icons.support_agent,
            color: Theme.of(context).primaryColor,
            subTitle: s.contactUsHint,
            child: Padding(
              padding: EdgeInsets.only(bottom: 12.r),
              child: Column(
                spacing: 10.r,
                children: List.generate(
                  supportList.length,
                  (index) => Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 0.r,
                      horizontal: 10.r,
                    ),
                    child: SettingsItem(
                      title: supportList[index].title,
                      subTitle: supportList[index].subTitle,
                      leadingIcon: supportList[index].icon,
                      iconColor: supportList[index].iconColor,
                      backgroundColor: Colors.grey.withOpacity(0.1),
                      onTap: () {
                        Uri url = supportList[index].url;
                        launchUrl(url);
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
