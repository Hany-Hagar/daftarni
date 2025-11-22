import '../settings_item.dart';
import 'package:flutter/material.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../../core/widgets/lang_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../Core/services/service_locator.dart';

class SettingsBodyLang extends StatelessWidget {
  const SettingsBodyLang({super.key});

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    final subTitles = [s.english, s.arabic];
    final subTitle = subTitles[ServiceLocator.getDataModel().preferences.langI];
    return AnimatedSettingsItem(
      title: s.Language,
      subTitle: subTitle,
      icon: Icons.language,
      color: Colors.blue,
      child: Padding(
        padding: EdgeInsets.only(top: 0, left: 10.w, right: 10.w, bottom: 12.h),
        child: LangButton(
          isInDropDown: true,
          width: MediaQuery.sizeOf(context).width - 55.w,
        ),
      ),
    );
  }
}
