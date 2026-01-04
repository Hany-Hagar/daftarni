import 'package:flutter/material.dart';
import '../../../../../../const_data/app.dart';
import '../../../manager/layout_cubit.dart';
import '../../../manager/layout_states.dart';
import '../../../../../../generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/utils/toast.dart';
import '../../../../data/models/category_model.dart';
import '../../../../../../core/widgets/back_ground.dart';
import '../../../../../../core/widgets/custom_text.dart';
import '../../../../../../core/widgets/nav_pop_icon.dart';
import '../../../../../../core/utils/dialog_services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/add transaction/add_transaction_body.dart';

class AddTransactionsView extends StatelessWidget {
  final bool isIncome;
  final String title;
  final String subTitle;
  final String brief;
  final String amountTitle;
  final List<CategoryModel> categories;
  final String buttonTitle;
  final bool isEditing;
  const AddTransactionsView({
    super.key,
    required this.isIncome,
    required this.title,
    required this.subTitle,
    required this.brief,
    required this.categories,
    required this.amountTitle,
    required this.buttonTitle,
    required this.isEditing,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<LayoutCubit, LayoutStates>(
      listener: (context, state) {
        final s = S.of(context);
        if (state is AddDataState) {
          Toast.show(context, state: true, message: s.addTransactionSuccess);
          LayoutCubit.get(context).clearTransactionData();
          Navigator.pop(context);
        }
        if (state is LayoutFailure) {
          DialogServices.showStateDialog(
            context: context,
            state: DialogState.failure,
            message: state.erroMessage,
          );
        }
        if (state is LowValueState) {
          DialogServices.showStateDialog(
            context: context,
            state: DialogState.failure,
            message: s.addExpenseTransactionLowValue,
          );
        }
      },
      child: BackGround(
        top: _AppBar(title: title, subTitle: subTitle),
        body: SingleChildScrollView(
          child: AddTransactionBody(
            isIncome: isIncome,
            brief: brief,
            categories: categories,
            amountTitle: amountTitle,
            buttonTitle: buttonTitle,
            isEditing: isEditing,
          ),
        ),
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  final String title;
  final String subTitle;
  const _AppBar({required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      padding: defaultAppBarPadding,
      decoration: BoxDecoration(
        gradient: linearGradient,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(13.r)),
      ),
      child: Row(
        children: [
          NavPopIcon(),
          Spacer(flex: 2),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText(
                isHead: true,
                title: title,
                fontSize: 30,
                fontColor: Colors.white,
              ),
              CustomText(
                isHead: true,
                title: subTitle,
                fontSize: 25,
                fontColor: Colors.white,
              ),
            ],
          ),
          Spacer(flex: 3),
        ],
      ),
    );
  }
}
