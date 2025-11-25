// ignore_for_file: unused_import

import 'package:glass/glass.dart';
import 'package:flutter/material.dart';
import 'transaction_text_form_filed.dart';
import '../../../../../../generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/widgets/custom_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/widgets/text_form_field.dart';

class AddTransactionDate extends StatelessWidget {
  final VoidCallback? onTap;
  final TextEditingController controller;
  const AddTransactionDate({
    super.key,
    required this.onTap,

    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return CustomCard(
      emoji: "📅",
      title: s.date,
      child: TransactionTextFormFiled(
        height: 35.h,
        onTap: onTap,
        readOnly: true,
        title: s.selectDate,
        controller: controller,
        keyboardType: TextInputType.datetime,
      ),
    );
  }
}
