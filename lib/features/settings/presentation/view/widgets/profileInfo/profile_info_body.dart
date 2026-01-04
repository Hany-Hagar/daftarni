// ignore_for_file: file_names
import 'profile_info_avatar.dart';
import 'package:flutter/material.dart';
import '../../../manager/settings_cubit.dart';
import '../../../../../../generated/l10n.dart';
import '../../../manager/settings_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/widgets/user_form.dart';
import '../../../../../../core/widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileInfoBody extends StatelessWidget {
  const ProfileInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    var cubit = SettingsCubit.get(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProfileInfoAvatar(),
        UserForm(
          salaryController: cubit.salaryController,
          userNameController: cubit.userNameController,
          sideIncomeController: cubit.sideSalaryController,
          salaryDay: cubit.salaryDay,
          onChanged: () => cubit.addValidate(),
          onChangedDay: (value) => cubit.setSalaryDay(value),
        ),
        SizedBox(height: 20),
        Row(
          spacing: 12.w,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BlocBuilder<SettingsCubit, SettingsStates>(
              builder: (context, state) {
                return Expanded(
                  flex: 3,
                  child: CustomLoadingButton(
                    isEnabled: !cubit.emptyAddData,
                    isLoading: state is SettingsLoading,
                    title: s.saveChanges,
                    onTap: () {
                      cubit.saveUserInfo();
                    },
                  ),
                );
              },
            ),

            Expanded(
              flex: 2,
              child: CustomButton(
                borderColorOnly: true,
                text: s.cancle,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
