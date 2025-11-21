// ignore_for_file: file_names

import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/model/on_boarding.dart';
import '../../../../../Core/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingBody extends StatelessWidget {
  final OnBoarding onBoarding;
  const OnBoardingBody({super.key, required this.onBoarding});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 10.h),
        CustomText(isHead: true, title: s.appTitle, fontSize: 30.sp),
        SizedBox(height: 10),
        Spacer(),

        Lottie.asset(
          onBoarding.image,
          height: MediaQuery.of(context).size.height * 0.4,
          width: double.infinity,
          fit: BoxFit.contain,
        ),
        Spacer(),
        CustomText(isHead: true, title: onBoarding.title, fontSize: 25.sp),
        SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
          child: CustomText(
            title: onBoarding.description,
            maxLines: 3,
            fontSize: 20.sp,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
