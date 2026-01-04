import 'package:flutter/material.dart';
import '../../../../../const_data/app.dart';
import '../../manager/layout_cubit.dart';
import '../../manager/layout_states.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../core/utils/toast.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/add category/add_category_body.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddCategoryView extends StatelessWidget {
  final bool isIncome;
  const AddCategoryView({super.key, required this.isIncome});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LayoutCubit, LayoutStates>(
      listener: (context, state) {
        final s = S.of(context);
        if (state is AddCategorySuccesState) {
          Toast.show(context, state: true, message: s.addCategorySuccess);
          LayoutCubit.get(context).clearAddCategoryData();
          LayoutCubit.get(context).setTransactionCategory(state.index);
          Navigator.pop(context);
          Navigator.pop(context);
        }
      },
      child: _Body(isIncome: isIncome),
    );
  }
}

class _Body extends StatelessWidget {
  final bool isIncome;
  const _Body({required this.isIncome});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.r),
      margin: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        boxShadow: defaultBoxShadow,
        borderRadius: BorderRadius.circular(12.r),
        color: Theme.of(context).dialogTheme.backgroundColor,
      ),
      child: Stack(
        alignment: AlignmentDirectional.topStart,
        children: [
          AddCategoryBody(isIncome: isIncome),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(Icons.close, size: 24.r),
          ),
        ],
      ),
    );
  }
}
