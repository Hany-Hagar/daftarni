// ignore_for_file: deprecated_member_use

import 'add_transaction_date.dart';
import 'add_transaction_brief.dart';
import 'add_transaction_value.dart';
import 'add_transaction_category.dart';
import 'package:flutter/material.dart';
import '../../../manager/layout_cubit.dart';
import '../../../manager/layout_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/models/category_model.dart';
import '../../../../../../core/widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddTransactionBody extends StatelessWidget {
  final bool isIncome;
  final String brief;
  final String amountTitle;
  final List<CategoryModel> categories;
  final String buttonTitle;
  const AddTransactionBody({
    super.key,
    required this.isIncome,
    required this.brief,
    required this.amountTitle,
    required this.categories,
    required this.buttonTitle,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = LayoutCubit.get(context);
    return Column(
      children: [
        SizedBox(height: 10.h),
        AddTransactionValue(amountTitle: amountTitle),
        AddTransactionCategory(categories: categories),
        AddTransactionDate(),
        AddTransactionBrief(brief: brief),
        BlocBuilder<LayoutCubit, LayoutStates>(
          builder:
              (context, state) => Padding(
                padding: EdgeInsets.all(10.h),
                child: CustomLoadingButton(
                  isEnabled: !LayoutCubit.get(context).emptyAddData,
                  isLoading: false,
                  title: buttonTitle,
                  onTap: () => cubit.validateValue(isExpense: !isIncome),
                ),
              ),
        ),
      ],
    );
  }
}
