import 'add_start_current_balance.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../manager/layout_cubit.dart';
import '../../manager/layout_states.dart';
import '../widgets/layout/layout_body.dart';
import '../widgets/layout/layout_app_bar.dart';
import '../../../../../../generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:daftarni/core/utils/toast.dart';
import '../../../../../core/utils/dialog_services.dart';
import '../../../../../../core/widgets/back_ground.dart';
import '../../../../../../core/utils/navigator_methods.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      LayoutCubit.get(context).showMonthlyRepeatTransactionsDialog(
        context: context,
        dialog: const AddStartCurrentBalance(),
      );
    });
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
        top: LayoutAppBar(),
        body: Column(
          children: [
            Expanded(child: SingleChildScrollView(child: LayoutBody())),
          ],
        ),
      ),
    );
  }
}
