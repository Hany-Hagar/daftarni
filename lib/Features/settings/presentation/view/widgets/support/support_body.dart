import 'support_faq.dart';
import 'support_call.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SupportBody extends StatelessWidget {
  const SupportBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10.r),
        SupportCall(),
        SizedBox(height: 20.r),
        SupportFaq(),
      ],
    );
  }
}
