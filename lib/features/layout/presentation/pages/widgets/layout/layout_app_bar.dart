import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../../../../../const_data/app.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../../core/widgets/custom_text.dart';
import '../../../../../../core/widgets/custom_avatar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/navigator_methods.dart';
import '../../../../../../core/services/service_locator.dart';
import '../../../../../settings/presentation/view/pages/settings_view.dart';

class LayoutAppBar extends StatelessWidget {
  const LayoutAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    var fontColor = Colors.white;
    var data = ServiceLocator.getDataModel();
    return Container(
      decoration: BoxDecoration(gradient: redLinearGradient),
      padding: EdgeInsets.symmetric(horizontal: 10.r),
      child: ListTile(
        tileColor: Colors.transparent,
        contentPadding: EdgeInsetsDirectional.only(
          top: MediaQuery.of(context).padding.top - 5.sp,
        ),
        leading: CustomAvatar(radius: 22.r),
        title: CustomText(
          isHead: true,
          title: "${s.hi} ${data.profile.userName}",
          fontSize: 22,
          fontColor: fontColor,
        ),
        subtitle: CustomText(
          isHead: true,
          title: " ${s.welcomeBack}",
          fontSize: 18.5,
          fontColor: fontColor,
        ),
        trailing: GestureDetector(
          onTap: () {
            NavTo.push(context: context, nextPage: const SettingsView());
          },
          child: Icon(CupertinoIcons.settings, size: 30.r, color: fontColor),
        ),
      ),
    );
  }
}
