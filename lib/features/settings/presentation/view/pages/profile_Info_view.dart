// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../../../../../const_data/app.dart';
import '../../manager/settings_cubit.dart';
import '../../manager/settings_states.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../core/utils/toast.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../core/widgets/back_ground.dart';
import '../../../../../core/widgets/nav_pop_icon.dart';
import '../widgets/profileInfo/profile_info_body.dart';
import '../../../../../core/utils/dialog_services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileInfoView extends StatelessWidget {
  const ProfileInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return BlocListener<SettingsCubit, SettingsStates>(
      listener: (context, state) {
        if (state is SettingsFailure) {
          DialogServices.showStateDialog(
            context: context,
            state: DialogState.failure,
            message: state.error,
          );
        }
        if (state is SettingsSuccess) {
          Toast.show(context, state: true, message: s.saveChangesSuccess);
        }
        if (state is UserImagePickedSuccess) {
          Toast.show(context, state: true, message: s.changeImageSuccess);
        }
      },
      child: BackGround(
        top: Container(
          alignment: AlignmentDirectional.topStart,
          padding: defaultAppBarPadding,
          decoration: BoxDecoration(gradient: linearGradient),
          child: Row(
            children: [
              NavPopIcon(),
              SizedBox(width: 10.w),
              CustomText(isHead: true, title: s.personalInfo, fontSize: 30),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: ProfileInfoBody(),
          ),
        ),
      ),
    );
  }
}
