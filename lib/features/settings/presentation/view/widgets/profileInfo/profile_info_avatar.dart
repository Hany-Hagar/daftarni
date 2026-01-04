import 'package:flutter/material.dart';
import '../../../manager/settings_cubit.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../../core/widgets/custom_text.dart';
import '../../../../../../core/widgets/custom_avatar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileInfoAvatar extends StatelessWidget {
  const ProfileInfoAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Align(
      alignment: AlignmentDirectional.center,
      child: Column(
        children: [
          SizedBox(height: 24.h),
          _Body(),
          SizedBox(height: 10.h),
          CustomText(isHead: true, title: s.pickImageTitle, fontSize: 16),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var cubit = SettingsCubit.get(context);

    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        CustomAvatar(radius: 80),
        GestureDetector(
          onTap: () {
            cubit.setUserImage();
          },
          child: CircleAvatar(
            radius: 25.r,
            backgroundColor: theme.primaryColor,
            child: Icon(
              Icons.camera_alt_outlined,
              size: 30.r,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
