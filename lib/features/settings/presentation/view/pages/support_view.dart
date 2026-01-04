import 'package:flutter/material.dart';
import '../../../../../const_data/app.dart';
import '../../../../../generated/l10n.dart';
import '../widgets/support/support_body.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../core/widgets/back_ground.dart';
import '../../../../../core/widgets/nav_pop_icon.dart';

class SupportView extends StatelessWidget {
  const SupportView({super.key});

  @override
  Widget build(BuildContext context) {
    return BackGround(
      top: _Top(),
      body: SingleChildScrollView(child: SupportBody()),
    );
  }
}

class _Top extends StatelessWidget {
  const _Top();

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Container(
      padding: defaultAppBarPadding,
      decoration: BoxDecoration(gradient: linearGradient),
      child: Row(
        children: [
          NavPopIcon(),
          SizedBox(width: 10),
          CustomText(
            isHead: true,
            fontSize: 30,
            title: s.support,
            fontColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
