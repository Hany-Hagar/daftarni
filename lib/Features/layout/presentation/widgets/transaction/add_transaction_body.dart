// ignore_for_file: deprecated_member_use

import 'add_transaction_date.dart';
import 'add_transaction_brief.dart';
import 'add_transaction_value.dart';
import 'add_transaction_category.dart';
import 'package:flutter/material.dart';
import '../../../data/models/category_model.dart';
import '../../../../../core/widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddTransactionBody extends StatelessWidget {
  final String brief;
  final int categoryIndex;
  final String amountTitle;
  final VoidCallback? onTap;
  final TextEditingController value;
  final List<CategoryModel> categories;
  final dynamic Function(String?)? onChanged;
  final TextEditingController dateController;
  final TextEditingController briefController;
  const AddTransactionBody({
    super.key,

    required this.brief,
    required this.value,
    required this.onTap,
    required this.onChanged,
    required this.amountTitle,
    required this.categoryIndex,
    required this.dateController,
    required this.briefController,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10.h),
        AddTransactionValue(
          amountTitle: amountTitle,
          controller: value,
          onChanged: onChanged,
        ),
        AddTransactionCategory(
          categoryIndex: categoryIndex,
          categories: categories,
        ),
        AddTransactionDate(controller: dateController, onTap: onTap),
        AddTransactionBrief(brief: brief, controller: briefController),
        Padding(
          padding: EdgeInsets.all(10.h),
          child: CustomLoadingButton(
            isEnabled: true,
            isLoading: false,
            title: 'Save Transaction',
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
