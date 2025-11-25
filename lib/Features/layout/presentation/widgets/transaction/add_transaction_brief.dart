// ignore_for_file: unused_import

import 'package:daftarni/features/layout/presentation/widgets/transaction/transaction_text_form_filed.dart';
import 'package:flutter/material.dart';
import 'package:glass/glass.dart';
import '../../../../../../generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/widgets/custom_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/widgets/text_form_field.dart';

class AddTransactionBrief extends StatelessWidget {
  final String brief;
  final TextEditingController controller;
  const AddTransactionBrief({
    super.key,
    required this.brief,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return CustomCard(
      emoji: "📝",
      title: s.notesOptional,
      child: TransactionTextFormFiled(
        height: 65.h,
        title: brief,
        controller: controller,
        maxLines: 3,
        keyboardType: TextInputType.text,
      ),
    );
  }
}
