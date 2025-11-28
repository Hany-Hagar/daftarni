import 'package:flutter/material.dart';
import '../../../../../const/app.dart';
import '../../manager/layout_cubit.dart';
import '../../manager/layout_states.dart';
import '../../../../../core/utils/toast.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/add category/add_category_body.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddCategoryView extends StatelessWidget {
  const AddCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LayoutCubit, LayoutStates>(
      listener: (context, state) {
        if (state is AddDataState) {
          Toast.show(context, state: true, message: "addTransactionSuccess");
          LayoutCubit.get(context).clearTransactionData();
          Navigator.pop(context);
        }
      },
      child: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
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
            SingleChildScrollView(child: AddCategoryBody()),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Icon(Icons.close, size: 24.r),
            ),
          ],
        ),
      ),
    );
  }
}
