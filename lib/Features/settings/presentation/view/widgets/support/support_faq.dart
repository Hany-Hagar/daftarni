import '../settings_item.dart';
import 'package:flutter/material.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../../core/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SupportFaq extends StatelessWidget {
  const SupportFaq({super.key});

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    final faqQuestions = [s.faqQuestion1, s.faqQuestion2, s.faqQuestion3];
    final faqAnswers = [s.faqAnswer1, s.faqAnswer2, s.faqAnswer3];
    return Column(
      children: [
        CustomText(isHead: true, fontSize: 25, title: s.faqTitle),
        SizedBox(height: 10.r),
        ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: faqAnswers.length,
          padding: EdgeInsets.all(10.r),
          itemBuilder: (context, index) {
            return AnimatedSettingsItem(
              title: faqQuestions[index],
              icon: Icons.question_answer,
              color: Theme.of(context).hintColor,
              child: Padding(
                padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 16.h),
                child: CustomText(title: faqAnswers[index], fontSize: 19),
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(height: 10.r),
        ),
      ],
    );
  }
}
