// ignore_for_file: unused_import

import 'dart:developer';

import 'package:glass/glass.dart';
import 'package:flutter/material.dart';
import '../../../manager/layout_cubit.dart';
import '../../../manager/layout_states.dart';
import '../glass_text_form_filed.dart';
import '../../../../../../../generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../core/utils/styles.dart';
import '../../../../../../core/utils/dialog_services.dart';
import '../../../../../../../core/widgets/custom_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/widgets/text_form_field.dart';

class AddTransactionDate extends StatelessWidget {
  const AddTransactionDate({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return BlocBuilder<LayoutCubit, LayoutStates>(
      builder: (context, state) {
        var cubit = LayoutCubit.get(context);
        return CustomCard(
          emoji: "📅",
          title: s.date,
          child: GlassTextFormField(
            height: 30.h,
            readOnly: true,
            title: s.selectDate,
            suffixIcon: Icons.edit_calendar_outlined,

            keyboardType: TextInputType.datetime,
            onTap: () async {
              cubit.setTransactionDate(
                await DialogServices.datePicker(
                  context: context,
                  initialDate: cubit.transactionDate,
                  firstDate: cubit.setFirstData(),
                  lastDate: DateTime.now(),
                ),
              );
            },
            padding: EdgeInsets.only(top: 7.h),
            controller: TextEditingController(text: "   ${cubit.formatDate()}"),
          ),
        );
      },
    );
  }
}
