import 'package:flutter/material.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../../core/widgets/custom_text.dart';
import '../../../../../../core/widgets/nav_pop_icon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsTop extends StatelessWidget {
  const SettingsTop({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Container(
      height: MediaQuery.of(context).size.height / 4.5,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFEF4444), Color(0xFFF43F5E), Color(0xFFDB2777)],
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.only(
          start: 10.r,
          top: MediaQuery.of(context).padding.top + 8.r,
        ),
        child: Align(
          alignment: AlignmentDirectional.topStart,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              NavPopIcon(),
              SizedBox(width: 10.r),
              CustomText(
                isHead: true,
                fontSize: 30,
                fontColor: Colors.white,
                title: s.settings,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
