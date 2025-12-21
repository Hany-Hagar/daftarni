import '../../../../../const/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../manager/layout_cubit.dart';
import '../../manager/layout_states.dart';
import '../widgets/layout/layout_body.dart';
import '../../../../../../generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:daftarni/core/utils/toast.dart';
import '../../../../../core/utils/dialog_services.dart';
import '../../../../../../core/widgets/back_ground.dart';
import '../../../../../../core/widgets/custom_text.dart';
import '../../../../../core/services/service_locator.dart';
import '../../../../../../core/widgets/custom_avatar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/navigator_methods.dart';
import '../../../../settings/presentation/view/pages/settings_view.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LayoutCubit, LayoutStates>(
      listener: (context, state) {
        if (state is DeleteSuccessState) {
          NavTo.pop(context);
          Toast.show(
            context,
            state: true,
            message: S.current.deleteStateSuccess,
          );
        }
        if (state is EditSuccesState) {
          NavTo.pop(context);
          Toast.show(context, state: true, message: S.current.editStateSuccess);
        }
        if (state is LayoutFailure) {
          DialogServices.showStateDialog(
            context: context,
            state: DialogState.failure,
            message: state.erroMessage,
          );
        }
      },
      child: BackGround(
        top: _Top(),
        body: Column(
          children: [
            Expanded(child: SingleChildScrollView(child: LayoutBody())),
          ],
        ),
      ),
    );
  }
}

class _Top extends StatelessWidget {
  const _Top();

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
