// ignore_for_file: file_names
import 'package:flutter/material.dart';
import '../../../../../const_data/app.dart';
import '../../../../../generated/l10n.dart';
import '../widgets/privacy/privacy_police_body.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../core/widgets/back_ground.dart';
import '../../../../../core/widgets/nav_pop_icon.dart';

class PrivacyPoliceView extends StatelessWidget {
  const PrivacyPoliceView({super.key});

  @override
  Widget build(BuildContext context) {
    return BackGround(
      top: _Top(),
      body: SingleChildScrollView(child: PrivacyPoliceBody()),
    );
  }
}

class _Top extends StatelessWidget {
  const _Top();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
      padding: defaultAppBarPadding,
      child: Row(
        children: [
          NavPopIcon(),
          SizedBox(width: 10),
          CustomText(
            isHead: true,
            fontSize: 30,
            title: S.of(context).privacyPolicy,
            fontColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
