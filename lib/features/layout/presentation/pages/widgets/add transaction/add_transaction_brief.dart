// ignore_for_file: unused_import

import 'package:glass/glass.dart';
import 'package:flutter/material.dart';
import '../../../manager/layout_cubit.dart';
import '../glass_text_form_filed.dart';
import '../../../../../../../generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../core/utils/styles.dart';
import '../../../../../../../core/widgets/custom_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/widgets/text_form_field.dart';

class AddTransactionBrief extends StatelessWidget {
  final String brief;
  const AddTransactionBrief({super.key, required this.brief});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    var cubit = LayoutCubit.get(context);
    return CustomCard(
      emoji: "📝",
      title: s.notesOptional,
      child: GlassTextFormField(
        maxLines: 3,
        height: 65.h,
        title: brief,
        keyboardType: TextInputType.text,
        controller: cubit.addTransactionBrief,
        onChanged: (p0) => cubit.addTransactionValidate(),
      ),
    );
  }
}
