import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../../core/widgets/custom_text.dart';

class AddCategoryBodyTop extends StatelessWidget {
  const AddCategoryBodyTop({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Column(
      children: [
        Align(
          alignment: Alignment(0.12, 0),
          child: LottieBuilder.asset(
            'assets/lotties/addCategory.json',
            height: 140,
            fit: BoxFit.cover,
          ),
        ),
        CustomText(isHead: true, title: s.addNewCategory, fontSize: 30),
        CustomText(title: s.addNewCategorySubtitle, fontSize: 20),
      ],
    );
  }
}
