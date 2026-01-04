import 'custom_text.dart';
import '../utils/styles.dart';
import 'text_form_field.dart';
import '../../generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserForm extends StatelessWidget {
  final TextEditingController userNameController;
  final TextEditingController salaryController;
  final int salaryDay;
  final TextEditingController sideIncomeController;
  final void Function() onChanged;
  final void Function(int?) onChangedDay;

  const UserForm({
    super.key,
    required this.userNameController,
    required this.salaryController,
    required this.salaryDay,
    required this.sideIncomeController,
    required this.onChanged,
    required this.onChangedDay,
  });

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    var bgColor = Theme.of(context).scaffoldBackgroundColor;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(isHead: true, title: s.userName),
        SizedBox(height: 5),
        UTextFormField(
          controller: userNameController,
          hintText: s.userNameHint,
          backgroundColor: bgColor,
          onChanged: (p0) => onChanged(),
          textInputAction: TextInputAction.next,
        ),
        SizedBox(height: 7.h),
        CustomText(isHead: true, title: s.salary),
        SizedBox(height: 5),
        UTextFormField(
          controller: salaryController,
          hintText: s.salaryHint,
          keyboardType: TextInputType.number,
          backgroundColor: bgColor,
          onChanged: (p0) => onChanged(),
        ),
        SizedBox(height: 7.h),
        CustomText(isHead: true, title: s.SalaryDay),
        SizedBox(height: 5),
        _SalaryDay(
          salaryDay: salaryDay,
          onChanged: (value) => onChangedDay(value),
        ),
        SizedBox(height: 7),
        Row(
          children: [
            CustomText(isHead: true, title: s.SideIncome),
            CustomText(title: "  ( ${s.Optional} )", fontColor: Colors.red),
          ],
        ),
        SizedBox(height: 5),
        UTextFormField(
          controller: sideIncomeController,
          hintText: s.sideIncomeHint,
          keyboardType: TextInputType.number,
          backgroundColor: bgColor,
        ),
      ],
    );
  }
}

class _SalaryDay extends StatelessWidget {
  final int salaryDay;
  final void Function(int?) onChanged;
  const _SalaryDay({required this.onChanged, required this.salaryDay});

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return SizedBox(
      height: 43.h,
      child: DropdownButtonFormField<int>(
        initialValue: salaryDay,
        menuMaxHeight: 250,
        decoration: InputDecoration(
          filled: true,
          hintText: s.salaryDayHint,
          fillColor: Theme.of(context).scaffoldBackgroundColor,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r)),
          contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
          labelStyle: Styles.textStyle700.copyWith(fontSize: 30.sp),
          hintStyle: Styles.textStyle400.copyWith(fontSize: 30.sp),
        ),
        items: List.generate(28, (index) {
          final day = index + 1;
          return DropdownMenuItem(
            value: day,
            child: CustomText(
              isHead: true,
              title: day.toString(),
              fontSize: 25,
            ),
          );
        }),
        onChanged: (value) => onChanged(value),
      ),
    );
  }
}
